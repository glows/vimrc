Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

call plug#end()

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

"set viminfo='100,n$HOME/.vim/files/info/viminfo
colorscheme molokai     "设置主题为molokai
"弹窗显示结果
let g:Lf_WindowPosition = 'popup'

"搜索当前文件的方法
nmap <LEADER>o :LeaderfFunction<CR>


autocmd VimEnter * NERDTree
autocmd VimEnter * RainbowParenthesesToggle
     