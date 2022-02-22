" Name: patine
" URL: https://github.com/Canop/patine
" License: use or copy as you want
" Best viewed with a #0e0e0e background

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "patine"

" Baseline
hi Normal term=NONE cterm=NONE ctermfg=252 ctermbg=NONE

" Faded
hi ColorColumn term=NONE cterm=NONE ctermfg=NONE ctermbg=236
hi Comment term=NONE cterm=NONE ctermfg=73 ctermbg=NONE
hi SpecialComment term=NONE cterm=NONE ctermfg=73 ctermbg=NONE
hi FoldColumn term=NONE cterm=NONE ctermfg=240 ctermbg=NONE
hi Folded term=NONE cterm=NONE ctermfg=240 ctermbg=NONE
hi LineNr term=NONE cterm=NONE ctermfg=8 ctermbg=235
hi NonText term=NONE cterm=NONE ctermfg=240 ctermbg=NONE
hi SignColumn term=NONE cterm=NONE ctermfg=240 ctermbg=NONE
hi SpecialKey term=NONE cterm=NONE ctermfg=240 ctermbg=NONE
hi StatusLineNC term=NONE cterm=NONE ctermfg=white ctermbg=240
hi VertSplit term=NONE cterm=NONE ctermfg=black ctermbg=240

" Highlighted
hi CursorColumn term=NONE cterm=NONE ctermfg=NONE ctermbg=0
hi CursorIM term=NONE cterm=NONE ctermfg=0 ctermbg=4
hi CursorLineNr term=NONE cterm=NONE ctermfg=NONE ctermbg=0
hi CursorLine term=NONE cterm=NONE ctermfg=NONE ctermbg=0
hi Cursor term=NONE cterm=NONE ctermfg=0 ctermbg=4
hi Directory term=NONE cterm=NONE ctermfg=69 ctermbg=NONE
hi ErrorMsg term=NONE cterm=NONE ctermfg=15 ctermbg=52
hi Error term=NONE cterm=NONE ctermfg=15 ctermbg=52
hi IncSearch term=NONE cterm=NONE ctermfg=black ctermbg=green
hi MatchParen term=NONE cterm=bold ctermfg=red ctermbg=NONE
hi ModeMsg term=NONE cterm=NONE ctermfg=69 ctermbg=NONE
hi MoreMsg term=NONE cterm=NONE ctermfg=69 ctermbg=NONE
hi PmenuSel term=NONE cterm=NONE ctermfg=0 ctermbg=13
hi Question term=NONE cterm=NONE ctermfg=69 ctermbg=NONE
hi Search term=NONE cterm=NONE ctermfg=0 ctermbg=6
hi StatusLine term=NONE cterm=NONE ctermfg=0 ctermbg=15
hi Todo term=NONE cterm=NONE ctermfg=10 ctermbg=NONE
hi VisualNOS term=NONE cterm=NONE ctermfg=NONE ctermbg=69
hi WarningMsg term=NONE cterm=NONE ctermfg=15 ctermbg=52

" Reversed
hi DiffText term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE
hi PmenuSbar term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE
"hi Pmenu term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE
hi Pmenu term=NONE cterm=NONE ctermfg=253 ctermbg=235
hi PmenuThumb term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE
hi TabLineSel term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE
hi Visual term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE
hi WildMenu term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE

" Diff
hi DiffAdd term=NONE cterm=NONE ctermfg=2 ctermbg=NONE
hi DiffChange term=NONE cterm=NONE ctermfg=3 ctermbg=NONE
hi DiffDelete term=NONE cterm=NONE ctermfg=1 ctermbg=NONE
hi DiffText term=NONE cterm=NONE ctermfg=4 ctermbg=NONE

" Spell
hi SpellBad term=underline cterm=underline ctermfg=13 ctermbg=NONE
hi SpellCap term=underline cterm=underline ctermfg=13 ctermbg=NONE
hi SpellLocal term=underline cterm=underline ctermfg=13 ctermbg=NONE
hi SpellRare term=underline cterm=underline ctermfg=13 ctermbg=NONE

" Vim Features
hi Menu term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Scrollbar term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi TabLineFill term=NONE cterm=NONE ctermfg=white ctermbg=240
hi TabLine term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Tooltip term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE

" Syntax Highlighting (or lack of)
hi Boolean term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Character term=NONE cterm=NONE ctermfg=NONE ctermbg=233
hi Conceal term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Conditional term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Constant term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Debug term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Define term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Delimiter term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Directive term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Exception term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Float term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Format term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Function term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Identifier term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Ignore term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Include term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Keyword term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Label term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Macro term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Number term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Operator term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi PreCondit term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi PreProc term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Repeat term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi SpecialChar term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Special term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Statement term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi StorageClass term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi String term=NONE cterm=NONE ctermfg=222 ctermbg=NONE
hi Structure term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Tag term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Title term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Typedef term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Type term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Underlined term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE

" Sneak
hi SneakPluginTarget term=NONE cterm=NONE ctermfg=black ctermbg=yellow
hi SneakStreakTarget term=NONE cterm=NONE ctermfg=black ctermbg=yellow
hi SneakStreakStatusLine term=NONE cterm=NONE ctermfg=black ctermbg=yellow

