set sw=2 ts=2 sts=2
set rnu
set nu
set laststatus=2
set noshowmode
set cursorline
set shell=/bin/zsh

imap jj <esc>
imap jk <esc>

let mapleader = " "

xmap # <Plug>Commentary
nmap # <Plug>CommentaryLine

nnoremap gh 0
nnoremap gs ^
nnoremap gl $

nnoremap <leader>p :set list!<cr>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeFocus<CR>

nnoremap <leader>wwh :VimwikiAll2HTML<cr>
nnoremap <leader>wwwh :VimwikiAll2HTML!<cr>
nnoremap <leader>ev :ex $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader> :Bu<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>pc :call popup_close(win_getid())

:tnoremap <Esc> <C-\><C-n>

"Abbrevs
iabbrev ltxcm $\checkmark$
iabbrev ltxs  \;
iabbrev ltx2s \;\;
iabbrev ltxcb \{   \}

au BufNewFile,BufRead *.wiki
	\iabbrev ltxcase \begin{cases}<cr>
	\\end{cases}

au BufNewFile,BufRead *.wiki
	\iabbrev ltxbo $O()$

"Some ft not tucked away
au BufNewFile,BufRead *.tpl set filetype=html

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" call plug#begin()
" Plug 'file:///home/sharkbait/.fzf/fzf'
" Plug 'itchyny/lightline.vim'
" Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-dispatch'
" Plug 'preservim/nerdtree'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'nordtheme/vim'
" Plug 'morhetz/gruvbox'
" Plug 'sheerun/vim-polyglot'
" Plug 'dense-analysis/ale'
" Plug 'vimwiki/vimwiki'
" call plug#end()

set termguicolors
set background=dark

let g:tokyonight_style = 'night'
let g:tokynight_enable_italic = 0
let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ }
" let g:airline_theme = "hybrid"

" colorscheme hybrid_reverse
colorscheme retrobox

set notermguicolors

let g:jedi#popup_on_dot = 0
let g:ale_completion_enabled = 1

" vimwiki settings
let g:vimwiki_list = [{
	\'vimwiki_listing_hl': 1,
	\'nested_syntaxes': {'python': 'python', 'py': 'python'},
	\'path': '~/vimwiki',
	\'auto_toc': 1,
	\}]

hi clear SpellBad
hi SpellBad cterm=underline

" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$].\{-}\$'
hi link math Statement

" macros
let @e = 'a\\(  \\)jj4ha'
let @f = 'a\frac{}{}jj2hi'
let @p = 'a![](./img/.png)jj4hi'
let @i = 'yss}yss}wilocal:~/../vimwiki/jk'

command Rt2 set ts=4 sts=4 noet | retab! | set ts=2 sts=2 et | retab!

" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set nolist

" set colorcolumn=88
set tw=88
