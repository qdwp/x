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

" ===============================================
" 不在兼容旧版本 vi
" -----------------------------------------------
set nocompatible

" 开启类型检查
" 文件内容自动对齐
" -----------------------------------------------
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" ===============================================
" 基本设置：支持鼠标操作
set mouse=a
" if vim in st(suckless simple terminal) cannot scrolldown with mouse
" set ttymouse=sgr

" 开启语法高亮
syntax on
" 显示行号
set number
" 显示相对行号
set relativenumber

" 显示时 顶部/底部 保留 5 行缓冲
set scrolloff=5
set tw=0
set list
set listchars=tab:⇒\ ,trail:␣
set autochdir
set nobackup
set noswapfile


" ===============================================
" 设置 tab 键空格定义
set tabstop=4			" ts
set softtabstop=4		" sts
set shiftwidth=4		" sw
set expandtab			" et
set autoindent

" 设置 go 语言默认 tab 键占用 4 个空格
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd FileType json,markdown let g:indentLine_conceallevel=0

endif

" ===============================================


set hlsearch                    " High light search
nnoremap <esc> :nohlsearch<return><esc>

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

set foldmethod=syntax  " marker " syntax
"set foldnestmax=20
set foldlevelstart=99

let mapleader=" "
let g:mapleader=" "

" 重新加载 VIM 资源文件
"map R :source $MYVIMRC<CR>

noremap W :w<CR>
noremap Q :q<CR>

" paste
set clipboard=unnamed
set pastetoggle=<LEADER>p

vnoremap Y "+y
nnoremap <LEADER>p "+p

" set backspace=2
set backspace=indent,eol,start
nnoremap dD d0i<BS><Esc>l

" 强制写入文件
cnoremap w!! w !sudo tee % > /dev/null
" 删除所有缓冲区文件，并重新打开当前文件
cnoremap bda %bd\|e#\|bd#<CR>


nnoremap K 10k
nnoremap J 10j

nnoremap <leader>w <c-w>w
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k


nnoremap <leader>K :res +5<CR>
nnoremap <leader>J :res -5<CR>
nnoremap <leader>H :vertical resize-5<CR>
nnoremap <leader>L :vertical resize+5<CR>

" 与 u 相反
" u -> undo
" U -> redo
nnoremap U <C-r>

nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

"nnoremap <LEADER>L :bufdo e<CR>

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


" ===============================================
" 安装插件工具 Vim-Plug
" Install Vim-Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

" Init

" ===============================================
" 定义主题、图标等
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'

" -----------------------------------------------
" 快速搜索，屏幕显示范围内两个字符快速定位
"Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-surround'

" -----------------------------------------------
" 声明指定项目根目录
Plug 'airblade/vim-rooter'

" -----------------------------------------------
" 文件快速查找工具 FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                   " Ag need install  `the_silver_searcher`


" -----------------------------------------------
" 文件管理器 Ranger
" 仅支持 neovim
" ------------------------
"# ArchLinux install all requirements is extremely convenient
"yay -S ranger python-pynvim ueberzug

"# pip

"# macOS users please install ranger by `pip3 ranger-fm` instead of `brew install ranger`
"# There're some issues about installation, such as https://github.com/ranger/ranger/issues/1214
"# Please refer to the issues of ranger for more details
"pip3 install ranger-fm pynvim

"# ueberzug is not supported in macOS because it depends on X11
"pip3 install ueberzug

Plug 'kevinhwang91/rnvimr'

" -----------------------------------------------
" 代码快速重构工具
Plug 'brooth/far.vim'

" -----------------------------------------------
" 自动补全括号、单引号、双引号等
Plug 'jiangmiao/auto-pairs'

" -----------------------------------------------
" 文本注释插件
Plug 'preservim/nerdcommenter'

" -----------------------------------------------
" 浮动终端插件
Plug 'voldikss/vim-floaterm'

" -----------------------------------------------
" 文件 git 显示插件
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'


" -----------------------------------------------
" 编程相关插件
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'for': ['go', 'vim-plug'], 'tag': '*' }
Plug 'honza/vim-snippets'

" -----------------------------------------------
" 异步 lint 引擎
Plug 'dense-analysis/ale'

" 安装 TagBar 插件
" brew install ctags
Plug 'majutsushi/tagbar'

" Vim Tag list for Go
" 插件列出go文件中得变量、类型、函数等，并支持跳转, 需要通过gotags
" go get -u github.com/jstemmer/gotags


" Initialize plugin system
call plug#end()

" Set airline theme
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


" Set colorscheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " set foreground color
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " set background color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

let g:SnazzyTransparent = 1
colorscheme snazzy


" ===============================================
" 左对齐格式
let g:vim_json_syntax_conceal = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1


" ===============================================
" The Nerd Commenter
" 文本注释，在多行左侧对齐，保留文件原对齐格式
let g:NERDDefaultAlign = 'left'


" ===============================================
" 打开/关闭浮动终端窗口
" 使用插件：Plug 'voldikss/vim-floaterm'
" -----------------------------------------------
nnoremap <silent>  <F1>  :FloatermToggle<CR>
tnoremap <silent>  <F1>  <C-\><C-n>:FloatermToggle<CR>

" -----------------------------------------------
" vim-float-terminal
let g:floaterm_autoclose = 0
let g:floaterm_title = ''
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.5
let g:floaterm_height = 0.6

" ===============================================

"" Find by 2 characters
"nmap ss <Plug>(easymotion-s2)

"" vim-sneak
"nnoremap s <Plug>Sneak_s
"nnoremap S <Plug>Sneak_S

"nnoremap f <Plug>Sneak_f
"nnoremap F <Plug>Sneak_F


noremap <LEADER>\ :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'python'
        exec "!python %"
	endif

endfunc

" =================================================
" Git 插件设置
" vim-gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = -1


" vim-go
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_experimental = 1

" =================================================
" TagBar 插件对 Golang 配置

" 展示 TagBar
"nnoremap <leader>t :TagbarToggle<CR>
cnoremap tag TagbarToggle<CR>

let g:tagbar_ctags_bin = "/opt/homebrew/bin/ctags"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" coc.nvim
" Initialize install.
" :CocInstall marketplace
" \ 'coc-explorer',
" \ 'coc-translator',
let g:coc_global_extensions = [
  \'coc-explorer',
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-go',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-jedi',
  \ 'coc-python',
  \ ]

" ======================================================
" 异步 Lint 引擎配置

" 禁用高亮
let g:ale_set_highlights = 0
" 启用快速修复列表
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" 仅在保存文件时执行检查
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_swift_swiftlint_use_defaults = 1
let g:ale_open_list = 0
let g:ale_lint_delay = 300
let g:ale_linters = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \ }


set hidden
set updatetime=100
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by
" otherlugin beforeutting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-n>"

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif


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


"nmap <Leader>z <Plug>(coc-translator-p)
"vmap <Leader>z <Plug>(coc-translator-pv)

nmap <silent> def <Plug>(coc-definition)
nmap <silent> det <Plug>(coc-type-definition)
nmap <silent> red <Plug>(coc-implementation)
nmap <silent> ref <Plug>(coc-references)

nmap <c-]> <Plug>(coc-definition)

"" coc 文件管理器
nmap ;; :CocCommand explorer<CR>
let g:node_client_debug = 0

" set filetypes as typescript.tsx
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" ===============================================
" FZF
nnoremap <Leader>ff <cmd>Files<cr>
nnoremap <Leader>fb <cmd>Buffers<cr>
nnoremap <Leader>fg yaw<cmd>Ag<CR>
"nnoremap <Leader>a  :Ag! <C-r>=expand('<cword>')<CR><CR>



" ===============================================
" Plug 'kevinhwang91/rnvimr' 集成 Ranger 文件管理器

nnoremap <silent> <LEADER>F :RnvimrToggle<CR>

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-b>': 'NvimEdit tabedit',
            \ '<C-t>': 'NvimEdit split',
            \ '<C-x>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }





