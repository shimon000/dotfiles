set encoding=utf-8
scriptencoding utf-8
set number
set title
set t_Co=256
set t_ut=
let g:codedark_conservative = 1
colorscheme codedark

call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'thinkpixellab/flatland'
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Install your sources
Plug 'Shougo/ddc-around'  " around source
Plug 'vim-skk/skkeleton'  "skkeleton source 日本語補完
" Install your filters
Plug 'Shougo/ddc-matcher_head'  "  matcher_head filter
Plug 'tani/ddc-fuzzy' " ddc-fuzzy filter　誤字っても補完してくれる

Plug 'Shougo/ddc-sorter_rank'
Plug 'shun/ddc-vim-lsp' 
call plug#end()

" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around

" 使うsourceの設定
call ddc#custom#patch_global('sources', ['vim-lsp','around'])
" source vim-lspの設定してる
call ddc#custom#patch_global('sourceOptions', {
      \ 'vim_lsp': {
      \   'matchers': ['matcher_head','matcher_fuzzy'],
      \   'sorters': ['sorter_rank'],
      \   'mark': 'lsp'},
      \ })
" source aroundの設定してる
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {
      \   'matchers': ['matcher_head','matcher_fuzzy'],
      \   'sorters': ['sorter_rank'],
      \   'mark': 'around'},
      \ })





call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
      \ 'clangd': {'mark': 'C'},
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()

" lspの設定
let g:lsp_diagnostics_echo_cursor = 1
" flake8の規定値をpycodestyleとpyflakeで使ってるよ
let g:lsp_settings = {
\   'pyls-all': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}
