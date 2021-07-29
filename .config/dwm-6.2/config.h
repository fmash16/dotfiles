/* See LICENSE file for copyright and license details. */

// Hardware multimedia keys
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 4;        // gaps between windows 
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 0;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
//static const int focusonwheel       = 0;        // 0 means focus on click 
static const char *fonts[]          = { "Hack NF:style=Regular:pixelsize=11:antialias=true:autohint=true"};
static const char dmenufont[]       = "azukifontB:style=Regular:size=12";
static const char dmenulines[]      = "53";
static const char dmenuX[]          = "0";
static const char dmenuY[]          = "0";
static const char dmenuW[]          = "300";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#dddddd";
//static const char col_accent[]      = "#689d6a";
static const char col_accent[]      = "#000000";
static const char col_bg[]          = "#f7daa2";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray4, col_gray1, "#222" },
	[SchemeSel]  = { col_gray4, col_accent, col_accent },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            0,           -1 },
	{ "Firefox",  NULL,       NULL,       0,            0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
//static const float smfact     = 0; // factor of tiled clients [0.00..0.95] <]
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-p", " ", "-m", dmenumon, "-l", dmenulines, "-x", dmenuX, "-y", dmenuY, "-w", dmenuW, "-fn", dmenufont, "-nb", col_bg, "-nf", col_accent, "-sb", col_accent, "-sf", col_bg, "-bw", "2",  NULL };
static const char *termcmd[]  = { "st", "-e", "tmux", NULL };
//static const char *webcmd[]  = { "tabbed", "surf", "-e", NULL };
static const char *webcmd[]  = { "firefox", NULL };
static const char *virtcmd[]  = { "virt-manager", NULL };
static const char *rangercmd[]  = { "st", "-e", "ranger", NULL };
static const char *flameshotcmd[]  = { "flameshot", "gui", NULL };
static const char *volupcmd[]  = { "amixer", "-q","set", "Master", "5%+", "unmute", NULL };
static const char *voldowncmd[]  = { "amixer", "-q","set", "Master", "5%-", "unmute", NULL };
static const char *volmutecmd[]  = { "amixer", "-q", "Master", "mute", NULL };
static const char *exitcmd[]  = { "killall", "startdwm", NULL };
static const char *ncmpcppcmd[]  = { "st", "-e", "ncmpcpp", NULL };
static const char *systemcmd[]  = { "/home/fmash/.config/dmenu/scripts/test.sh", NULL };
static const char *wificmd[]  = { "/home/fmash/.config/dmenu/scripts/wifi.sh", NULL };
static const char *slockcmd[]  = { "slock", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_l,      spawn,          {.v = slockcmd } },
	{ MODKEY,                       XK_s,      spawn,          {.v = systemcmd } },
	{ MODKEY|ShiftMask,             XK_w,      spawn,          {.v = wificmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_q,      spawn,          {.v = webcmd } },
	{ MODKEY,                       XK_v,      spawn,          {.v = virtcmd } },
	{ MODKEY,                       XK_r,      spawn,          {.v = rangercmd } },
	{ MODKEY,                       XK_c,      spawn,          {.v = flameshotcmd } },
	{ MODKEY,                       XK_m,      spawn,          {.v = ncmpcppcmd } },
	{ 0,           XF86XK_AudioRaiseVolume,    spawn,          {.v = volupcmd } },
	{ 0,           XF86XK_AudioLowerVolume,    spawn,          {.v = voldowncmd } },
	{ 0,           XF86XK_AudioMute,           spawn,          {.v = volmutecmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_h,      focusstack,     {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_u,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.05} }, // resize master horizontal
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.05} },
  //{ MODKEY|ShiftMask,             XK_k,      setsmfact,      {.f = +0.05} }, // resize slaves vertical height
  //{ MODKEY|ShiftMask,             XK_j,      setsmfact,      {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_p,      setlayout,      {.v = &layouts[3]} },
    { MODKEY,                       XK_o,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
  { MODKEY,                       XK_minus,  setgaps,        {.i = -2 } },
  { MODKEY,                       XK_equal,  setgaps,        {.i = +2 } },
  { MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
  //{ MODKEY|ShiftMask,			XK_Down,	moveresize,		{.v = (int []){ 0, 0, 0, 25 }}},
  //{ MODKEY|ShiftMask,			XK_Up,		moveresize,		{.v = (int []){ 0, 0, 0, -25 }}},
  //{ MODKEY|ShiftMask,			XK_Right,	moveresize,		{.v = (int []){ 0, 0, 25, 0 }}},
  //{ MODKEY|ShiftMask,			XK_Left,	moveresize,		{.v = (int []){ 0, 0, -25, 0 }}},
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_r,      quit,           {0} }, // reload the configurations
	{ MODKEY|ShiftMask,             XK_e,      spawn,          {.v = exitcmd } }, // exit dwm
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

