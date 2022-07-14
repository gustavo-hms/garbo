" Vim color file
" Maintainer: Gustavo H. M. de Sousa
" Licence: GNU GPL

" Cleaning previous colors
hi clear
set background=dark
set termguicolors
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "garbo"

" Colorscheme
hi Normal guibg=NONE guifg=#ccd0da gui=NONE
hi Visual guibg=#3d3e53 guifg=#ffffff gui=NONE
hi Constant guibg=NONE guifg=#d3005b gui=bold
hi String guibg=NONE guifg=#ff1ea1 gui=NONE
hi Comment guibg=NONE guifg=#6a6f7c gui=NONE
hi Type guibg=NONE guifg=#00b982 gui=NONE
hi Identifier guibg=NONE guifg=#7a80ee gui=NONE
hi Function guibg=NONE guifg=#7a80ee gui=NONE
hi Statement guibg=NONE guifg=#fffb79 gui=NONE
hi PreProc guibg=NONE guifg=#5656e6 gui=NONE
hi Special guibg=NONE guifg=#ef2745 gui=NONE
hi SpecialKey guifg=#414153
hi Error guibg=NONE guifg=#ef2745 gui=bold
hi Todo guibg=#ef2745 guifg=#000000 gui=NONE
hi Search guibg=NONE guifg=#00e2ff gui=bold
hi IncSearch guibg=NONE guifg=#00e2ff gui=reverse
hi CursorLine guibg=#1c1d21 guifg=NONE gui=NONE
hi ColorColumn guibg=#1c1d21 guifg=NONE gui=NONE
hi CursorColumn guibg=#1c1d21 guifg=NONE gui=NONE
hi Conceal guibg=NONE guifg=#ccd0da gui=NONE
hi LineNr guibg=NONE guifg=#373941 gui=NONE
hi SignColumn guibg=NONE
hi NonText guifg=#1c1d21 gui=NONE
hi Folded guibg=NONE guifg=#6a6f7c gui=NONE
hi FoldColumn guibg=NONE guifg=#373941 gui=NONE
hi Pmenu guibg=#1c1d21 guifg=#ccd0da gui=NONE
hi PmenuSel guibg=#1c1d21 guifg=#ccd0da gui=reverse
hi VertSplit guibg=NONE guifg=#373941 gui=NONE
hi StatusLine guibg=#1c1d21 guifg=#595d68 gui=NONE
hi StatusLineNC guibg=#111114 guifg=#595d68 gui=NONE
hi TabLine guibg=#111114 guifg=#595d68 gui=NONE
hi TabLineFill guibg=#111114 guifg=#595d68 gui=NONE
hi TabLineSel guibg=NONE guifg=#c0c7df gui=NONE
hi SpellBad guibg=NONE guifg=NONE gui=underline
hi SpellCap guibg=NONE guifg=NONE gui=italic
hi SpellRare guibg=NONE guifg=NONE gui=italic
hi SpellLocal guibg=NONE guifg=NONE gui=italic
hi MatchParen guibg=NONE guifg=#ef2745 gui=NONE
hi DiffAdd guibg=#151515
hi DiffChange guibg=NONE
hi DiffDelete guibg=NONE guifg=#555555 gui=NONE
hi DiffText guibg=NONE guifg=NONE gui=underline
hi EndOfBuffer guifg=black

" Highlight groups for plugins
hi CocUnderline guibg=#151515
hi link CocCodeLens LineNr
hi link NeomakeVirtualtextWarning Comment
hi CocHighlightText guibg=NONE guifg=NONE gui=underline
