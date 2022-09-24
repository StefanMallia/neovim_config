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
" Coc configuration

"let g:ale_linters = {'rust': ['rls']}
nnoremap <space>e :CocCommand explorer<CR>
nnoremap cocrestart :CocRestart

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <c-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Symbol renaming.
" prev: <leader>rn
nmap rename <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" https://github.com/junegunn/vim-plug
" Download plug.vim and put it in the "autoload" directory.
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" --- Declare the list of plugins. ---

"Plug 'Valloric/YouCompleteMe'

"Conquer of Completion
"https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Support for the rust language was installed with the following commands:
"rustup component add rls rust-analysis rust-src
":CocInstall coc-rls


"Plug 'davidhalter/jedi-vim'
Plug 'ParamagicDev/vim-medic_chalk'

Plug 'puremourning/vimspector'

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
nnoremap cargobuild :cd %:p:h <bar> !gnome-terminal -- bash -c "cargo build; exec bash;"<CR><ESC>
nnoremap cargorun :cd %:p:h <bar> !gnome-terminal -- bash -c "cargo run; exec bash;"<CR><ESC>
nnoremap terminal :cd %:p:h <bar> !gnome-terminal -- bash -c "exec bash;"<CR><ESC>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fzf shortcut for search git files
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-f> :CocSearch 
"nnoremap <C-f> :Rg<Cr>


let g:deoplete#enable_at_startup = 1
colorscheme medic_chalk

