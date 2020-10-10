"              +---------------------+
"              | VIM Configurations. |
"              +---------------------+
"                     \   ^__^
"                      \  (oo)\_______
"                         (__)\       )\/\
"                             ||----w |
"                             ||     ||
"

" Common Configurations

set nocompatible

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set mouse=a

syntax on
set number
set relativenumber

set scrolloff=5
set tw=0
set list
set listchars=tab:⇒\ ,trail:␣
set autochdir
set backspace=indent,eol,start
set nobackup
set noswapfile

set tabstop=4			" ts
set softtabstop=4		" sts
set shiftwidth=4		" sw
set expandtab			" st
set autoindent

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 et

endif

" autocomplete
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

function! RemovePairs()
    let s:line = getline(".")
    let s:previous_char = s:line[col(".")-1]

    if index(["(","[","{"],s:previous_char) != -1
        let l:original_pos = getpos(".")
        execute "normal %"
        let l:new_pos = getpos(".")
        " only right (
        if l:original_pos == l:new_pos
            execute "normal! a\<BS>"
            return
        end

        let l:line2 = getline(".")
        if len(l:line2) == col(".")
            execute "normal! v%xa"
        else
            execute "normal! v%xi"
        end
    else
        execute "normal! a\<BS>"
    end
endfunction

function! RemoveNextDoubleChar(char)
    let l:line = getline(".")
    let l:next_char = l:line[col(".")]

    if a:char == l:next_char
        execute "normal! l"
    else
        execute "normal! i" . a:char . ""
    end
endfunction

inoremap <BS> <ESC>:call RemovePairs()<CR>a
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
inoremap > <ESC>:call RemoveNextDoubleChar('>')<CR>a


" set hlsearch                    " High light search
" exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap = nzz
noremap - Nzz

set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent

set cursorline
set wildmenu

let mapleader=" "
let g:mapleader=" "

map R :source $MYVIMRC<CR>
noremap W :w<CR>
noremap Q :q<CR>

" paste
set clipboard=unnamed
set pastetoggle=<LEADER>p

" Force to write file
cnoremap w!! w !sudo tee % > /dev/null

nnoremap Y y$
nnoremap D d$

map J 10j
map K 10k

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>


map <leader>h <c-w>h
map <leader>l <c-w>l
map <leader>j <c-w>j
map <leader>k <c-w>k

map <leader><up> :res +5<CR>
map <leader><down> :res -5<CR>
map <leader><left> :vertical resize-5<CR>
map <leader><right> :vertical resize+5<CR>

nnoremap <C-z> u
inoremap <C-z> <Esc>ua

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

"             +---------+
"             | Plugins |
"             +---------+
"                    \   ^__^
"                     \  (oo)\_______
"                        (__)\       )\/\
"                            ||----w |
"                            ||     ||

" Install Vim-Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'Yggdroot/indentLine'

Plug 'easymotion/vim-easymotion'


" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" NerdTree
Plug 'preservim/nerdtree'

" For programming
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }


" Initialize plugin system
call plug#end()

" Set airline theme
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


" Set colorscheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " set foreground color
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " set background color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

let g:SnazzyTransparent = 1
colorscheme snazzy

" Find by 2 characters
nmap ss <Plug>(easymotion-s2)

" ===
" === vim-instant-markdown
" ===
nnoremap <LEADER>md <Esc>:InstantMarkdownPreview<CR>
nnoremap <LEADER>mdd <Esc>:InstantMarkdownStop<CR>

let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_browser = "chromium --new-window"

if has("autocmd")
	"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
	autocmd Filetype markdown inoremap <buffer> ,w <Esc>/<++><CR>:nohlsearch<CR>"_c5l<CR>
	autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
	" autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
	" autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
	autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
	autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
	autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
	autocmd Filetype markdown inoremap <buffer> ,m - [ ]
	autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
	autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
	autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
endif

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	endif

endfunc


" ===
" === nerdtree
" ===
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1



