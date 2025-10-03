syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

" Start of vim-plug section
call plug#begin('~/.vim/plugged')

" Add your plugins here
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings' " Highly recommended for auto-configuring servers

" End of vim-plug section
call plug#end()
nnoremap <silent> gd <cmd>LspDefinition<CR>
nnoremap <silent> K <cmd>LspHover<CR>
nnoremap <silent> gr <cmd>LspReferences<CR>
let g:lsp_document_code_action_signs_enabled = 0

