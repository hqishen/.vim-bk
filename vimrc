"--------------------------------------------
"--------->:brif:   VIM 的配置字段------------
"--------->:Author: sandy --------------------
"--------->:Version: v0.01 17-11-04 building
"--------->:Version: v0.02 17-11-05 add some plugin
"--------------------------------------------

set smarttab
set smartindent
set selection=inclusive
set wildmenu
set mousemodel=popup
syntax on
set cul "高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
set go=             " 不要图形按钮

"set guifont=Courier_New:h10:cANSI   " 设置字体
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set statusline=%m%w------------------->\ [TYPE=%Y]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ <------------------"状态行显示的内容
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
"将tab替换为空格
"nmap tt :%s/\t/    /g<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if expand("%:e") == 'sh'
        call setline(1,"\#!/bin/bash")
        call setline(2,"#*************************************************")
        call setline(3,"#**********File Name:")
        call setline(4,"#**********Function :")
        call setline(5,"#**********Author   :Sandy")
        call setline(6,"#**********Email    :hqishen@126.com")
        call setline(7,"#*************************************************")
        call append(line(".")+8, "")
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"#!--- coding=utf-8 ---*/")
        call append(line(".")+1,"'''***************************************************")
        call append(line(".")+2, " > File Name   : ".expand("%"))
        call append(line(".")+3, " > Company     : Huizhou Desay SV Automotive")
        call append(line(".")+4, " > Unit        : Central Techonlogy")
        call append(line(".")+5, " > Created Time: ".strftime("%c"))
        call append(line(".")+6, " > Function    : " )
        call append(line(".")+7, " > Author      : Sandy" )
        call append(line(".")+8, " > Email       : hqishen@126.com" )
        call append(line(".")+9,"***************************************************'''")
        call append(line(".")+10, "")
    elseif expand("%:e") == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
        "    elseif &filetype == 'mkd'
        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "	> File Name  : ".expand("%"))
        call append(line(".")+1, "	> Company    : Huizhou Desay SV Automotive")
        call append(line(".")+2, "	> Unit       : Central Techonlogy")
        call append(line(".")+3, "	> Created Time: ".strftime("%c"))
        call append(line(".")+4, "    > Function   : " )
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+7, "#include <iostream>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+7, "#include <stdio.h>")
        call append(line(".")+8, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+7, "#pragma once")
"        call append(line(".")+8, "#define _".toupper(expand("%:r"))."_H")
"        call append(line(".")+9, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+7,"public class ".expand("%:r"))
        call append(line(".")+8,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shift tab pages
"map <S-Left> :tabp<CR>
"map <S-Right> :tabn<CR>
"map! <C-Z> <Esc>zzi
"map! <C-O> <C-Y>,
"map <C-A> ggVG$"+y
"map <F12> gg=G
map <C-w> <C-w>w
"imap <C-k> <C-y>,
"imap <C-t> <C-q><TAB>
"imap <C-j> <ESC>
"
"set clipboard=unnamed
"去空行
"nnoremap <F2> :g/^\s*$/d<CR>
"比较文件
"nnoremap <C-F2> :vert diffsplit
" 选中状态下 Ctrl+c 复制
"map <C-v> "*pa
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y
set mouse=v

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -std=c++11"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

"filetype plugin on
"共享剪贴板
set clipboard+=unnamed
"自动保存
set autowrite
"set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
"set completeopt=longest,menu

" 括号自动不全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
" end



"<----------------- Plugin Manager --------------->
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"Bundle 'tpope/vim-surround'

" 主题"
Plugin 'altercation/vim-colors-solarized'

" Tabular: 自动对齐。
Plugin 'godlygeek/tabular'

""Plugin 'NERD_Tree'
Plugin 'https://github.com/scrooloose/nerdtree'

"Plugin tagbar"
Plugin 'https://github.com/majutsushi/tagbar'

"按tab健9选择补全"
Plugin 'SuperTab'
"标记无用空格
Plugin 'bronson/vim-trailing-whitespace'

"窗口管理工具"
""Plugin 'WinManager'
"快速注释工具
Plugin 'scrooloose/nerdcommenter'

"cpp .h 间切换
Plugin 'derekwyatt/vim-fswitch'
Plugin 'a.vim'
Plugin 'c.vim'
"Plugin 'stl.vim'
Plugin 'stlrefvim'
Plugin 'cpp.vim'
Plugin 'https://github.com/Mizuchi/STL-Syntax'

"快速插入代码片段
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


call vundle#end()            " required
filetype plugin indent on    " required



" <<-------------------begin------------------------->
" 主题
" scheme "
""syntax enable
""set background=dark
""colorscheme solarize


" <<-------------------begin------------------------->
""let g:winManagerWindowLayout='FileExplorer|TagList'
""nmap wm :WMToggle<cr>


" <<-------------------begin------------------------->
"set up NerdTree"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F9> :NERDTreeToggle<CR>

"autocmd VimEnter * wincmd w
"autocmd VimEnter * NERDTree
"wincmd w

" <<-------------------begin------------------------->
"set up tagbar"'
"F10触发，设置宽度为30
let g:tagbar_width = 30
nmap <F10> :TagbarToggle<CR>
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0

" <<-------------------begin------------------------->
"set up supertab"
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" <<-------------------begin------------------------->
"setup auto pair"
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" <<-------------------begin------------------------->
"记住上次打开的位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"去掉多余的空格
map <leader><space> :FixWhitespace<cr>	" \+space去掉末尾空格

" <<-------------------begin------------------------->
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
let mapleader=","
"快捷键
",ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
",cc，注释当前行
",c，切换注释/非注释状态
",cs，以”性感”的方式注释
",cA，在当前行尾添加注释符，并进入Insert模式
",cu，取消注释

"<<---------------------------------------->>
"setup a.vim 切换头文件和源文件
"可以设置搜索路径
"let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
"快捷键
"   :A 在新 buffer 中切换；
" 　　:AS 水平分割式切换；
" 　　:AV 垂直分割式切换；
" 　　:AT 新建页标签，然后切换；
" 　　:AN 如果在指定目录下有多个同名的 c/h 文件，循环切换；』
" 　　:IH 创建新 buffer 切换到光标下的文件；
" 　　:IHS 同上，且创建水平窗口；
" 　　:IHV 同 :IH，且创建垂直窗口；
" 　　:IHT 同 :IH，切换到新建页标签；
" 　　:IHN 同 :IH，循环切换；
" 　　<Leader>ih 同 :IH；
" 　　<Leader>is 功能相当于是 :IHS + :A 。效果是切换到光标下的头文件对应的源文件中。
" 　　<Leader>ihn 同 :IHN；
"<< ------------------------------------->>

" <<-------------------begin------------------------->
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" <<-------------------begin------------------------->
" 自动补全
" omnicppcomplete-0.41 ---- AutoComplPop
" 配置网址:http://blog.chinaunix.net/uid-30024978-id-4830530.html
"
"配置cpp.vim c.vim的自动不全
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1    "打开  . 操作符
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
let OmniCpp_NamespaceSearch=1   "打开命名空间
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1   "打开显示函数原型
let OmniCpp_SelectFirstItem = 2     "自动弹出时自动跳至第一个
""
""要生成专用于c/c++的ctags文件，并引导vim找到改tags文件：
""tags文件生成命令（通常位于代码项目的最上层目录下执行）
""[admin@local]$ ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
""引导omnicppcomplete找到tags文件：
""（1）在vim中设置：set tags+=/home/project/project_1/tags 。该方法不方便，每次使用都要set一下
""（2）在~/.vimrc中添加常用的路径tags：
""set tags+=/home/project/project_1/tags
""set tags+=/home/project/project_2/tags
""这样，每次打开vim便会自动寻找以上设置的tags文件。另外，可以通过vim中：set tags来查看已设置的tags文件路径。

