""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic nvim settings for personal preferences on usability

"Clear search highlight
nnoremap <silent> <esc> :noh<cr><esc>

"setting system copy paste
"set clipboard+=unnamedplus "might be unnecessary
noremap <C-c> "+y
map ZZ <Nop>

"For Home button to go to first non-blank character
noremap <Home> ^
inoremap <Home> <Esc>^i
  
"Mapping save button
inoremap <c-s> <Esc>:w<cr>
noremap <c-s> <Esc>:w<cr>

"Mapping exit function
inoremap <c-q> <Esc>:q<cr>
noremap <c-q> <Esc>:q<cr>

"For changing tabs left and right
nmap <C-H> <C-PageUp>
nmap <C-L> <C-PageDown>
"mapping <C-L> does not work in netrw as it is overwritten by its own mappings
"this line overwrites that mapping again
autocmd filetype netrw nmap <buffer> <C-L> <C-PageDown>

let g:netrw_browse_split = 3 "to open new tabs in explorer

inoremap jj <Esc>
inoremap {<CR> {<CR>}<ESC>O
nnoremap <leader>newtab :Te<CR>
nnoremap <leader>te :Te<CR>

set guicursor=i:ver100-icursor
set hlsearch

syntax enable
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set softtabstop=4
" On pressing tab, insert 2 spaces
set expandtab
set autoindent
set smartindent
filetype plugin indent on
set number
set mouse=a 
set history=10000



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" https://github.com/junegunn/vim-plug
" Download plug.vim and put it in the "autoload" directory.
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" --- Declare the list of plugins. ---

"Plug 'Valloric/YouCompleteMe'


"Plug 'davidhalter/jedi-vim'
Plug 'ParamagicDev/vim-medic_chalk'

"Plug 'puremourning/vimspector'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Ale - Asynchronous Lint Engine
"https://github.com/dense-analysis/ale
"Plug 'dense-analysis/ale'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
"For more options and their meanings, check :h deoplete-options inside Nvim.

" List ends here. Plugins become visible to Vim after this call.
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust commands
"using bash command to keep gnome-terminal open
nnoremap <leader>cargobuild :cd %:p:h <bar> !gnome-terminal -- bash -c "cargo build; exec bash;"<CR><ESC>
nnoremap <leader>cargorun :cd %:p:h <bar> !gnome-terminal -- bash -c "cargo run; exec bash;"<CR><ESC>
nnoremap <leader>terminal :cd %:p:h <bar> !gnome-terminal -- bash -c "exec bash;"<CR><ESC>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fzf shortcut for search git files
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-f> :CocSearch 
"nnoremap <C-f> :Rg<Cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust debugging with gdb

packadd termdebug
let g:termdebugger="rust-gdb"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
colorscheme medic_chalk

