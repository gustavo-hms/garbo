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
hi Normal guibg=none guifg=#ccd0da gui=none
hi Visual guibg=#6a6f7c guifg=#000000 gui=none
hi Constant guibg=none guifg=#d3005b gui=bold
hi Comment guibg=none guifg=#595d68 gui=none
hi Type guibg=none guifg=#00b982 gui=none
hi Identifier guibg=none guifg=#7a80ee gui=none
hi Function guibg=none guifg=#7a80ee gui=none
hi Statement guibg=none guifg=#fffb79 gui=none
hi PreProc guibg=none guifg=#5656e6 gui=none
hi Special guibg=none guifg=#ff0000 gui=none
hi SpecialKey guifg=#414153
hi Error guibg=none guifg=#af0000 gui=bold
hi Todo guibg=#af0000 guifg=#000000 gui=none
hi Search guibg=none guifg=#00e2ff gui=bold
hi IncSearch guibg=none guifg=#00e2ff gui=reverse
hi CursorLine guibg=#1c1d21 guifg=none gui=none
hi ColorColumn guibg=#1c1d21 guifg=none gui=none
hi CursorColumn guibg=#1c1d21 guifg=none gui=none
hi Conceal guibg=none guifg=#ccd0da gui=none
hi LineNr guibg=none guifg=#373940 gui=none
hi SignColumn guibg=none
hi NonText guifg=#1c1d21 gui=none
hi Folded guibg=none guifg=#595d68 gui=none
hi FoldColumn guibg=none guifg=#373940 gui=none
hi Pmenu guibg=#1c1d21 guifg=#ccd0da gui=none
hi PmenuSel guibg=#9d4125 guifg=#000000 gui=none
hi VertSplit guibg=none guifg=#373940 gui=none
hi StatusLine guibg=#1c1d21 guifg=#595d68 gui=none
hi StatusLineNC guibg=#111114 guifg=#595d68 gui=none
hi TabLine guibg=#111114 guifg=#595d68 gui=none
hi TabLineFill guibg=#111114 guifg=#595d68 gui=none
hi TabLineSel guibg=none guifg=#c0c7df gui=none
hi SpellBad guibg=none guifg=none gui=underline
hi SpellCap guibg=none guifg=none gui=italic
hi SpellRare guibg=none guifg=none gui=italic
hi SpellLocal guibg=none guifg=none gui=italic
hi MatchParen guibg=#2e3036 guifg=none gui=italic
hi DiffAdd guibg=#151515
hi DiffChange guibg=none
hi DiffDelete guibg=none guifg=#555555 gui=none
hi DiffText guibg=#373940 guifg=none gui=none
hi EndOfBuffer guifg=black

" Highlight groups for plugins
hi CocUnderline guibg=#151515
hi link CocCodeLens Comment
hi link NeomakeVirtualtextWarning Comment
