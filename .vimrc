set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

"大括号自动补全并缩进,方法1. 按 '{ + 回车' , 方法2. '} + 回车'
imap {<CR> {<CR>}<ESC>O
imap }<CR> <CR>}<ESC>O
"中括号的效果同上
imap [<CR> [<CR>]<ESC>O
imap [<CR> <CR>]<ESC>O
"小括号的效果同上
imap (<CR> (<CR>)<ESC>O
imap (<CR> <CR>)<ESC>O

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugini'
Plug 'prettier/vim-prettier', {'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'jsx', 'yaml'] }
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown', 'RoyalBlue3'],
            \ ['Darkblue', 'SeaGreen3'],
            \ ['darkgray', 'DarkOrchid3'],
            \ ['darkgreen', 'firebrick3'],
            \ ['darkcyan', 'RoyalBlue3'],
            \ ['darkred', 'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown', 'firebrick3'],
            \ ['gray', 'RoyalBlue3'],
            \ ['black', 'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue', 'firebrick3'],
            \ ['darkgreen', 'RoyalBlue3'],
            \ ['darkcyan', 'SeaGreen3'],
            \ ['darkred', 'DarkOrchid3'],
            \ ['red', 'firebrick3'],
            \ ]
Plug 'leafgarland/typescript-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'jiangmiao/auto-pairs'
" git相关
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

call plug#end()

let g:airline_powerline_fonts = 1
let g:webdevicons_enable_nerdtree = 1


if has("gui_running")
    au GUIEnter * simalt ~x " 窗口启动时自动最大化
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    "set showtabline=0 " 隐藏Tab栏
endif

 "tagbar
nmap <F9> :TagbarToggle<CR>
map <F5> :w<CR>

"'显示行号'
set nu
set number
set cursorline
set cul          "'cursorline的缩写形式'
set cursorcolumn
set cuc          "'cursorcolumn的缩写形式'
"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"显示括号匹配
set showmatch
"设置粘贴模式
set paste
"'总是显示状态栏'
set laststatus=2
"'显示光标当前位置'
set ruler
filetype plugin indent on
"'让vimrc配置变更立即生效'
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"html标签自动补全
map! <C-O> <C-Y>,

set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=2     " 光标移动到buffer的顶部和底部时保持3行距离  
set laststatus=2   " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠 
"搜索逐字符高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>


"set viminfo='100,n$HOME/.vim/files/info/viminfo
colorscheme molokai     "设置主题为molokai
"弹窗显示结果
let g:Lf_WindowPosition = 'popup'


xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"搜索当前文件的方法
nmap <LEADER>o :LeaderfFunction<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'cpp'
        exec '!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<'
        exec "!time ./%<"
    elseif &filetype == 'javascript'
        exec '!node %'
    elseif &filetype == 'java'
        exec '!javac %'
        exec '!java %<'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

autocmd VimEnter * NERDTree
autocmd VimEnter * RainbowParenthesesToggle
"VUE 相关配置
"采用两个空格的缩进
 au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2
 au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2
 au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2
 au BufNewFile,BufRead *.html,*.js,*.vue set expandtab
 au BufNewFile,BufRead *.html,*.js,*.vue set autoindent
 au BufNewFile,BufRead *.html,*.js,*.vue set fileformat=unix
"这个是解决偶尔高亮失效的，貌似没什么鸟用 
 autocmd FileType vue syntax sync fromstart
"代码格式化的快捷键，设置为F9
 autocmd FileType vue noremap <buffer> <F9> :%!vue-formatter<CR>
"启用eslint代码检查，如果不想受限制，可以注释掉
" let g:syntastic_javascript_checkers = ['eslint']    
" F2打开当前文件目录
nn <silent><F2> :exec("NERDTree ".expand('%:h'))<CR>

"实用配置------------------------------------------------------------------------------
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:coc_disable_startup_warning = 1

 
