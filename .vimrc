set encoding=utf-8
scriptencoding utf-8
set number
set title
call plug#begin()

Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Install your sources
Plug 'Shougo/ddc-around'  " around source

" Install your filters
Plug 'Shougo/ddc-matcher_head'  "  matcher_head filter
Plug 'Shougo/ddc-sorter_rank'
Plug 'shun/ddc-vim-lsp' 
call plug#end()
" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around

" sourceの設定
call ddc#custom#patch_global('sources', ['vim-lsp'])

" sourceOptionsにmatchersを設定してる
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
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
