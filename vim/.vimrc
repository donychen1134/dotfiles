" 粘贴模式
set paste

" 恢复delete键不能删除行的问题
set backspace=2

" 配置变更生效
autocmd! BufWritePost .vimrc source %

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" vundle 环境设置
" 开启文件类型侦测
filetype off
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
" vundle 插件
Plugin 'VundleVim/Vundle.vim'
" 状态行插件
Plugin 'Lokaltog/vim-powerline'
" 素雅主题插件
Plugin 'altercation/vim-colors-solarized'
" golang 插件
Plugin 'fatih/vim-go'
" 显示目录结构插件
Plugin 'scrooloose/nerdtree'
" 自动注释不同后缀(.sh/.go)的代码插件
Plugin 'scrooloose/nerdcommenter'
" 上方打开文件列表状态栏插件
Plugin 'fholgado/minibufexpl.vim'
" 代码自动补全插件
Plugin 'Shougo/neocomplete.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on

" 设置不显示vim-go报错信息（vim-go需要更高vim版本，当前版本较低，故忽略）
let g:go_version_warning = 0

" 设置主题
syntax enable
syntax on
set background=dark

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 自动打开NERDTree
autocmd vimenter * NERDTree
" 打开vim时，光标自动移动到右侧窗口
autocmd VimEnter * wincmd w
" 如果仅剩NERDTree窗口，则关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键; 在buffer栏中，光标置于对应buffer上，用'd'来删除对应buffer
map <S-h> :MBEbp<cr>
map <S-l> :MBEbn<cr>

" 代码自动补齐开启
let g:neocomplete#enable_at_startup = 1
