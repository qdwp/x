"              +---------------------+
"              | VIM Configurations. |
"              +---------------------+
"                     \   ^__^
"                      \  (oo)\_______
"                         (__)\       )\/\
"                             ||----w |
"                             ||     ||
"


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Common Configurations

set nocompatible

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set mouse=a
" if vim in st(suckless simple terminal) cannot scrolldown with mouse
" set ttymouse=sgr

syntax on
set number
set relativenumber

set scrolloff=5
set tw=0
set list
set listchars=tab:⇒\ ,trail:␣
set autochdir
set nobackup
set noswapfile

set tabstop=4			" ts
set softtabstop=4		" sts
set shiftwidth=4		" sw
set expandtab			" et
set autoindent

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd FileType json,markdown let g:indentLine_conceallevel=0

endif

" set hlsearch                    " High light search
" exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent

set cursorline
set cursorcolumn
set wildmenu

let mapleader=" "
let g:mapleader=" "

map R :source $MYVIMRC<CR>
noremap W :w<CR>
noremap Q :q<CR>

" paste
set clipboard=unnamed
set pastetoggle=<LEADER>p

vnoremap Y "+y
nnoremap <LEADER>p "+p

" set backspace=2
set backspace=indent,eol,start
nnoremap D d0i<BS><Esc>l

" Force to write file
cnoremap w!! w !sudo tee % > /dev/null

nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>
nnoremap sj :set splitbelow<CR>:split<CR>

nnoremap K 10k
nnoremap J 10j

nnoremap <leader>w <c-w>w
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k

nnoremap <leader><up> :res +5<CR>
nnoremap <leader><down> :res -5<CR>
nnoremap <leader><left> :vertical resize-5<CR>
nnoremap <leader><right> :vertical resize+5<CR>


" nnoremap <C-z> u
" inoremap <C-z> <Esc>ua
nnoremap U <C-r>

nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

nnoremap <LEADER>L :bufdo e<CR>

"             +---------+
"             | Plugins |
"             +---------+
"                    \   ^__^
"                     \  (oo)\_______
"                        (__)\       )\/\
"                            ||----w |
"                            ||     ||

" Install software to support vim plugins.
"
" For Archlinux
" sudo pacman -S chromium the_silver_searcher nodejs npm
" sudo npm -g install instant-markdown-d
"
" For Ubuntu
" sudo apt-get install silversearcher-ag

" Install Vim-Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

" Init
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'

" Search & Place & Edit
" Plug 'preservim/nerdtree'
" Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                   " Ag need install  `the_silver_searcher`
Plug 'brooth/far.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'voldikss/vim-floaterm'

"" dependencies
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"" telescope
"Plug 'nvim-telescope/telescope.nvim'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" rsStructureText
Plug 'vim-scripts/Unicode-RST-Tables'


" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
Plug 'honza/vim-snippets'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Initialize plugin system
call plug#end()

" Set airline theme
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

nnoremap <LEADER>0 :tabnew<CR>
nnoremap <LEADER>1 :tabnext 1<CR>
nnoremap <LEADER>2 :tabnext 2<CR>
nnoremap <LEADER>3 :tabnext 3<CR>
nnoremap <LEADER>4 :tabnext 4<CR>
nnoremap <LEADER>5 :tabnext 5<CR>
nnoremap <LEADER>6 :tabnext 6<CR>
nnoremap <LEADER>7 :tabnext 7<CR>
nnoremap <LEADER>8 :tabnext 8<CR>
nnoremap <LEADER>9 :tabnext 9<CR>
nnoremap - :tabNext<CR>
nnoremap = :tabnext<CR>

" plugin mapping o   open selected files or directories or bookmarks
" plugin mapping go  open selected ..., but leave cursor in the NERDTree
" plugin mapping t   open selected node/bookmark in a new tab
" plugin mapping T   open selected ..., but leave cursor in the NERDTree
" plugin mapping i   open selected file in a split window
" plugin mapping gi  open selected file in a split window, but leave cursor in the NERDTree
" plugin mapping s   open selected file in a vsplit window
" plugin mapping gs  open selected file in a vsplit windo, but leave cursor in the NERDTree

" Set colorscheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " set foreground color
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " set background color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

let g:SnazzyTransparent = 1
colorscheme snazzy

" indentLine
" let g:indentLine_char = 'c'
let g:vim_json_syntax_conceal = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" vim-float-terminal
let g:floaterm_autoclose = 0
let g:floaterm_title = ''
let g:floaterm_wintype = 'float'
"type `termi` to toggle terminam
let g:floaterm_keymap_toggle = 'termi'
"let g:floaterm_position = 'topright'
""hi Floaterm guibg='#444444'
"hi FloatermBorder guibg='#444444' guifg='#444444'


" Find by 2 characters
nmap ss <Plug>(easymotion-s2)

" vim-instant-markdown
nnoremap <LEADER>( <Esc>:InstantMarkdownPreview<CR>
nnoremap <LEADER>) <Esc>:InstantMarkdownStop<CR>

" rsStructureText Table
" <leader><leader>c     :create table
" <leader><leader>f     :format table

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
	autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><cr>:nohlsearch<cr>"_c4l
	autocmd filetype markdown inoremap <buffer> ,w <esc>/<++><CR>:nohlsearch<CR>"_c5l<CR>
	autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
	" autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
	" autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
	autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
	autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
	autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
	autocmd Filetype markdown inoremap <buffer> ,m - [ ]
	autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
	autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
	autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><Enter><++><Esc>kkA
	autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><Enter><++><Esc>kkA
	autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><Enter><++><Esc>kkA
	autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><Enter><++><Esc>kkA
	autocmd Filetype markdown inoremap <buffer> ,l --------<Enter><Enter>
endif

" vim-table-mode
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

noremap <LEADER>\ :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'python'
        exec "!python %"
	endif

endfunc

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \ ]
" let g:bullets_set_mappings = 0                      " default = 1
" let g:bullets_delete_last_bullet_if_empty = 1       " default = 1
" let g:bullets_pad_right = 0                         " default = 1
let g:bullets_line_spacing = 1 " default = 1
"


" " nerdtree
" inoremap <C-t> <Esc>:NERDTreeToggle<CR>
" nnoremap <C-t> <Esc>:NERDTreeToggle<CR>
" nnoremap tt :NERDTreeToggle<CR>
" nnoremap <LEADER>f :NERDTreeFind<CR>
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeAutoDeleteBuffer = 1
" let NERDTreeShowHidden=1
" let NERDTreeIgnore = [
"     \ '\.code', '\.idea', '\.DS_Store',
"     \ '\.git$', '\.gitignore',
"     \ '\.pyc$', '\.pyo$', '__pycache__',
"     \ ]
" 
" " nerdcommenter
" let g:NERDSpaceDelims = 1
" let g:NERDDefaultAlign = 'left'
" 
" " nerdtree-git-plugin
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"                 \ 'Modified'  :'✹',
"                 \ 'Staged'    :'✚',
"                 \ 'Untracked' :'✭',
"                 \ 'Renamed'   :'➜',
"                 \ 'Unmerged'  :'═',
"                 \ 'Deleted'   :'✖',
"                 \ 'Dirty'     :'✗',
"                 \ 'Ignored'   :'☒',
"                 \ 'Clean'     :'✔︎',
"                 \ 'Unknown'   :'?',
"                 \ }
" let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0


" vim-gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = -1

" vim-go
let g:go_doc_keywordprg_enabled = 0


" coc.nvim
" Initialize install.
" :CocInstall marketplace
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-explorer',
  \ 'coc-vimlsp',
  \ 'coc-go',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-jedi',
  \ 'coc-python',
  \ 'coc-translator',
  \ ]

set hidden
set updatetime=100
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by
" otherlugin beforeutting this into your config.
inoremap <silent><expr> <TAB>
      \umvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-n>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <LEADER>d :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction


nmap <Leader>z <Plug>(coc-translator-p)
vmap <Leader>z <Plug>(coc-translator-pv)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <c-]> <Plug>(coc-definition)

nmap tt :CocCommand explorer<CR>
let g:node_client_debug = 1

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx


" FZF
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>fg <cmd>Ag<cr>

