" Vim color file
" Maintainer: Gustavo H. M. de Sousa
" Licence: GNU GPL

" Cleaning previous colors
hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "garbo"

" Colorscheme
hi Normal guifg=#e4e4e4
hi Visual guibg=#3e3e46 gui=italic
hi ColorColumn guibg=#080808
hi Constant gui=bold guifg=#df005f
hi Conceal guibg=none guifg=#eeeeee
hi VertSplit guibg=none guifg=#000000
hi CursorLine gui=NONE guibg=#222222
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
hi NonText guifg=#444444
hi Folded guifg=#949494 guibg=none
hi FoldColumn guibg=none guifg=#373940
hi Error guifg=#df0000 guibg=none gui=bold
hi Todo guifg=NONE guibg=#af0000 gui=bold
hi IncSearch guifg=#00dfff guibg=none
hi Search guifg=#00dfff guibg=none gui=bold
hi Pmenu guibg=#444444 guifg=none
hi PmenuSel guifg=none guibg=#df5f00
hi SpellBad gui=underline guifg=none guibg=none
hi SpellCap guifg=none guibg=#3a3a3a
hi SpellRare guifg=none guibg=#5f0000
hi SpellLocal guifg=none guibg=#00005f
hi MatchParen guifg=#ff7700 guibg=none
hi TabLine guifg=#373940 guibg=none gui=underline
hi TabLineFill guifg=#373940 guibg=none gui=underline
hi TabLineSel guifg=#000000 guibg=#373940 gui=underline
hi DiffAdd guibg=#151515
hi DiffChange guibg=none
hi DiffDelete guibg=none guifg=#555555 gui=none
hi DiffText guibg=#363648 gui=none
hi StatusLine gui=reverse guifg=#303030 guibg=#a8a8a8
hi StatusLineNC guifg=#1c1c1c guibg=#949494
hi EndOfBuffer guifg=black

set t_Co=256

" Colorscheme
hi Normal ctermfg=254
hi ColorColumn ctermbg=232
hi Constant cterm=bold ctermfg=161
hi Conceal ctermbg=none ctermfg=white
hi VertSplit ctermbg=none ctermfg=black
hi CursorLine cterm=NONE ctermbg=233
hi CursorColumn cterm=NONE ctermbg=233
hi LineNr ctermfg=238
hi SignColumn ctermbg=none
hi Comment ctermfg=242
hi Type cterm=bold ctermfg=29
hi Identifier ctermfg=63 cterm=bold
hi Statement cterm=bold ctermfg=221
hi PreProc cterm=bold ctermfg=63
hi Special ctermfg=196 cterm=bold
hi SpecialKey ctermfg=146
hi NonText ctermfg=238
hi Folded ctermfg=246 ctermbg=none
hi Error ctermfg=160 ctermbg=none cterm=bold
hi Todo ctermfg=NONE ctermbg=124 cterm=bold
hi IncSearch ctermfg=45 ctermbg=none
hi Search ctermfg=45 ctermbg=none cterm=bold
hi Pmenu ctermbg=238 ctermfg=none
hi PmenuSel ctermfg=none ctermbg=166
hi SpellBad cterm=underline ctermfg=none ctermbg=none
hi SpellCap ctermfg=none ctermbg=237
hi SpellRare ctermfg=none ctermbg=52
hi SpellLocal ctermfg=none ctermbg=17
hi MatchParen ctermfg=196 ctermbg=none
hi TabLine ctermfg=238 ctermbg=none cterm=underline
hi TabLineFill ctermfg=238 ctermbg=none cterm=underline
hi TabLineSel ctermfg=black ctermbg=238 cterm=underline
hi DiffAdd ctermbg=235
hi DiffChange ctermbg=none
hi DiffDelete ctermbg=none ctermfg=none
hi DiffText ctermbg=238
hi StatusLine cterm=reverse ctermfg=236 ctermbg=248
hi StatusLineNC ctermfg=234 ctermbg=246
