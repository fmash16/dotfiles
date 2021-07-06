# My personal build of dwm - dynamic window manager
---
dwm is an extremely fast, small, and dynamic window manager for X, written
fully in c. Out of the box, dwm is very minimal and lacks many features that
I find essential for my daily workflow. So many patches have been applied to
this build of dwm to make it usable as per my requirements. Any patches that
can be downloaded from [here](https://dwm.suckless.org/patches/). 

# Patches
---
This personal build has the following patches:
  * fullgaps: Inserts gaps around windows and at borders for a clean look
  * attachaside: Instead of making the new window master, the new window will
    be opened at the 1st slave position retaining the master
  * smfact: Lets resize the slave vertically using smfact just like mfact is
    used to control the size of the master horizontally
  * focusonclick: focus only on mouse click and not just on mouse hovering over
    a window
  * colorbar: allow defining colors of different parts of the statusbar
    included with dwm
  * media-volume keys: Allows controlling the voulume with the media volume
    keys (not available at the dwm patches)


# Controls
---
The controls are mostly from the default controls of dwm. I have setup some
some custom controls for some apps. The meta key has been changed to windows.

  * MODKEY_d      : spawn dmenu
  * MODKEY_Return : spawn st terminal
  * MODKEY_q      : spawn firefox
  * MODKEY_v      : spawn virt-manager
  * MODKEY_r      : spawn ranger 
  * MODKEY_c      : spawn flameshot screenshot gui
  * MODKEY_b      : display/hide statusbar
  * MODKEY_k      : focus previous window in stack
  * MODKEY_j      : focus next window in stack
  * MODKEY_i      : increase the number of master windows by 1
  * MODKEY_u      : decrease the number of master windows by 1
  * MODKEY_Shift_h: resize master horizontally      
  * MODKEY_Shift_l
  * MODKEY_Shift_k: resize slaves vertically
  * MODKEY_Shift_j
  * MODKEY_Shift_ : Return make focused window the master
  * MODKEY_Tab    : view previous active tag/workspace 
  * MODKEY|Shift_q: killclient
  * MODKEY_t      : set tabbed layout
  * MODKEY_f      : setfloating layout
  * MODKEY_w      : set monoscle layout can be used to make client fullscreen
  * MODKEY_space  : make focused client floating
  * MODKEY_0      : view all clinets in all tags/workspaces
  * MODKEY|Shift_0      tag,            {.ui = ~0 } },
  * MODKEY_comma  : focusmon,
  * MODKEY_period : focusmon
  * MODKEY_Shift_comma,  tagmon,         {.i = -1 } },
  * MODKEY_Shift_period, tagmon,         {.i = +1 } },
  * MODKEY_minus  : decrease gaps between windows
  * MODKEY_equal  : increase gaps between windows
  * MODKEY_Shift_equal : reset gaps 


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec dwm

