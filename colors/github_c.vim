" Vim color file
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

hi clear

set background=light
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="github"

highlight Normal guifg=#000000 guibg=#f8f8ff ctermfg=16 ctermbg=231

" {{{ Cursor
highlight Cursor guifg=#f8f8ff guibg=#444454 ctermfg=231 ctermbg=238
highlight CursorLine guibg=#d8d8dd ctermbg=188 cterm=NONE
highlight CursorColumn guibg=#e8e8ee ctermbg=254
" }}}

" {{{ Diff
highlight DiffAdd guifg=#003300 guibg=#ddffdd gui=NONE ctermfg=22 ctermbg=194 cterm=NONE
highlight DiffChange guibg=#ececec gui=NONE ctermbg=255 cterm=NONE
highlight DiffText guifg=#000033 guibg=#ddddff gui=NONE ctermfg=17 ctermbg=189 cterm=NONE
highlight DiffDelete guifg=#ddcccc guibg=#ffdddd gui=NONE ctermfg=252 ctermbg=224 cterm=NONE
" }}}

" {{{ Folding / Line Numbering / Status Lines
highlight Folded guifg=#808080 guibg=#ececec gui=bold ctermfg=244 ctermbg=255 cterm=bold
hi vimFold		guibg=#ECECEC guifg=#808080 gui=bold
highlight FoldColumn guifg=#808080 guibg=#ececec gui=bold ctermfg=244 ctermbg=255 cterm=bold

highlight LineNr guifg=#959595 guibg=#ececec gui=bold ctermfg=246 ctermbg=255 cterm=bold
highlight NonText guifg=#808080 guibg=#ececec ctermfg=244 ctermbg=255
highlight Folded guifg=#808080 guibg=#ececec gui=bold ctermfg=244 ctermbg=255 cterm=bold
highlight FoldeColumn guifg=#808080 guibg=#ececec gui=bold ctermfg=244 ctermbg=255 cterm=bold

highlight VertSplit guifg=#bbbbbb guibg=#bbbbbb gui=NONE ctermfg=250 ctermbg=250 cterm=NONE
highlight StatusLine guifg=#404040 guibg=#bbbbbb gui=bold ctermfg=238 ctermbg=250 cterm=bold
highlight StatusLineNC guifg=#404040 guibg=#d4d4d4 gui=italic ctermfg=238 ctermbg=188
" }}}

" {{{ Misc
highlight ModeMsg guifg=#990000 ctermfg=88
highlight MoreMsg guifg=#990000 ctermfg=88

highlight Title guifg=#ef5939 ctermfg=196
highlight WarningMsg guifg=#ef5939 ctermfg=196
highlight SpecialKey guifg=#177f80 gui=italic ctermfg=30

highlight MatchParen guifg=#000000 guibg=#cdcdfd ctermfg=16 ctermbg=189
highlight Underlined guifg=#000000 gui=underline ctermfg=16 cterm=underline
highlight Directory guifg=#990000 ctermfg=88
" }}}

" {{{ Search, Visual, etc
highlight Visual guifg=#ffffff guibg=#3465a4 gui=NONE ctermfg=231 ctermbg=25 cterm=NONE
highlight VisualNOS guifg=#ffffff guibg=#204a87 gui=NONE ctermfg=231 ctermbg=25 cterm=NONE
highlight IncSearch guifg=#000000 guibg=#cdcdfd gui=italic ctermfg=16 ctermbg=189
highlight Search guifg=#000000 guibg=#cdcdfd gui=italic ctermfg=16 ctermbg=189
" }}}

" {{{ Syntax groups
highlight Ignore guifg=#808080 ctermfg=244
highlight Identifier guifg=#0086b3 ctermfg=31
highlight PreProc guifg=#a0a0a0 gui=bold ctermfg=247 cterm=bold
highlight Comment guifg=#999988 ctermfg=246
highlight Constant guifg=#177f80 gui=NONE ctermfg=30 cterm=NONE
highlight String guifg=#d81745 ctermfg=161
highlight Function guifg=#990000 gui=bold ctermfg=88 cterm=bold
highlight Statement guifg=#000000 gui=bold ctermfg=16 cterm=bold
highlight Type guifg=#445588 gui=bold ctermfg=60 cterm=bold
highlight Number guifg=#1c9898 ctermfg=30
highlight Todo guifg=#ffffff guibg=#990000 gui=bold ctermfg=231 ctermbg=88 cterm=bold
highlight Special guifg=#159828 gui=bold ctermfg=28 cterm=bold
hi rubySymbol   guifg=#960B73
highlight Error guifg=#ff1100 guibg=#f8f8ff gui=undercurl ctermfg=196 ctermbg=231 cterm=undercurl
highlight Todo guifg=#ff1100 guibg=#f8f8ff gui=underline ctermfg=196 ctermbg=231 cterm=underline
highlight Label guifg=#000000 gui=bold ctermfg=16 cterm=bold
highlight StorageClass guifg=#000000 gui=bold ctermfg=16 cterm=bold
highlight Structure guifg=#000000 gui=bold ctermfg=16 cterm=bold
highlight TypeDef guifg=#000000 gui=bold ctermfg=16 cterm=bold
" }}}

" {{{ Completion menus
highlight WildMenu guifg=#7fbdff guibg=#425c78 gui=NONE ctermfg=75 ctermbg=24 cterm=NONE

highlight Pmenu guifg=#ffffff guibg=#808080 gui=bold ctermfg=231 ctermbg=244 cterm=bold
highlight PmenuSel guifg=#000000 guibg=#cdcdfd gui=italic ctermfg=16 ctermbg=189
highlight PmenuSbar guifg=#444444 guibg=#000000 ctermfg=238 ctermbg=16
highlight PmenuThumb guifg=#aaaaaa guibg=#aaaaaa ctermfg=248 ctermbg=248
" }}}

" {{{ Spelling
hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#fcaf3e
hi spellLocal   guisp=#729fcf
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character		Number
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant
" }}}

" {{{ Tabs (non-gui0
highlight TabLine guifg=#404040 guibg=#dddddd gui=NONE ctermfg=238 ctermbg=253 cterm=NONE
highlight TabLineFill guifg=#404040 guibg=#dddddd gui=NONE ctermfg=238 ctermbg=253 cterm=NONE
highlight TabLineSel guifg=#404040 gui=bold ctermfg=238 cterm=bold
" }}}
"
" vim: sw=4 ts=4 foldmethod=marker
