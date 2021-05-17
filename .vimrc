" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()


" Keybinds

" Set Leader to Space
nnoremap <SPACE> <Nop>
map <Space> <Leader>

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Ctrl+P fzf
nnoremap <C-p> :GFiles<Cr>

" Ctrl+g Ripgrep fzf
nnoremap <C-g> :Rg<Cr>

" <spc>+l search buffers
nnoremap <silent><leader>l :Buffers<CR>

