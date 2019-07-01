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
hi Normal $texto
hi Visual $selecao2
hi Constant $constante
hi Comment $comentario
hi Type $tipo
hi Identifier $funcao
hi Statement $palavra_chave
hi PreProc $meta
hi Special $especial
hi SpecialKey guifg=#414153
hi Error $erro
hi Todo $todo
hi Search $busca
hi IncSearch $busca_incremental
hi CursorLine $linha_atual
hi ColorColumn $linha_atual
hi CursorColumn $linha_atual
hi Conceal $texto
hi LineNr $elemento_de_fundo
hi SignColumn guibg=none
hi NonText guifg=#24252b gui=none
hi Folded $elemento_de_fundo
hi FoldColumn $elemento_de_fundo
hi Pmenu $menu1
hi PmenuSel $selecao_do_menu
hi VertSplit $elemento_de_fundo
hi StatusLine $status_ativo
hi StatusLineNC $status1
hi TabLine $status1
hi TabLineFill $status1
hi TabLineSel $elemento_ativo
hi SpellBad $sublinhado
hi SpellCap $atencao
hi SpellRare $atencao
hi SpellLocal $atencao
hi MatchParen $elemento_casado
hi DiffAdd guibg=#151515
hi DiffChange guibg=none
hi DiffDelete guibg=none guifg=#555555 gui=none
hi DiffText $atencao
hi EndOfBuffer guifg=black

" Highlight groups for plugins
hi link CocCodeLens LineNr
