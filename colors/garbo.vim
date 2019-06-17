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
hi Normal guifg=#c8c8c8
hi Visual guibg=#2c2e34
hi ColorColumn guibg=#080808
hi Constant gui=bold guifg=#df005f
hi Conceal guibg=none guifg=#eeeeee
hi VertSplit guibg=none guifg=#000000
hi CursorLine gui=NONE guibg=#121316
hi CursorColumn gui=NONE guibg=#121212
hi LineNr guifg=#373940
hi SignColumn guibg=none
hi Comment guifg=#636363
hi Type gui=bold guifg=#00875f
hi Identifier guifg=#5f5fff gui=bold
hi Statement gui=bold guifg=#ffdf5f
hi PreProc gui=bold guifg=#5f5fff
hi Special guifg=#ff0000 gui=bold
hi SpecialKey guifg=#414153
hi NonText guifg=#24252b gui=none
hi Folded guifg=#949494 guibg=none
hi FoldColumn guibg=none guifg=#373940
hi Error guifg=#df0000 guibg=none gui=bold
hi Todo guifg=black guibg=#af0000 gui=bold
hi IncSearch guifg=#00e2ff guibg=none
hi Search guifg=#00e2ff guibg=none gui=bold
hi Pmenu guibg=#1c1d21 guifg=none
hi PmenuSel guifg=none guibg=#df5f00
hi SpellBad gui=underline guifg=none guibg=none
hi SpellCap guifg=none guibg=#3a3a3a
hi SpellRare guifg=none guibg=#5f0000
hi SpellLocal guifg=none guibg=#00005f
hi MatchParen guifg=#df5f00 guibg=none
hi TabLine guifg=#393b43 guibg=#1a1b1f gui=underline
hi TabLineFill guifg=#393b43 guibg=#1a1b1f gui=underline
hi TabLineSel guifg=#747787 guibg=#000000 gui=none
hi DiffAdd guibg=#151515
hi DiffChange guibg=none
hi DiffDelete guibg=none guifg=#555555 gui=none
hi DiffText guibg=#363648 gui=none
hi StatusLine gui=reverse guifg=#24252a guibg=#abb0c7
hi StatusLineNC guifg=#1a1b1f guibg=#747787
hi EndOfBuffer guifg=black
