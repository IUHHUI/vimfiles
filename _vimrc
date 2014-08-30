" ************************************************************************************************
"       _     
"      (-'      .-.. .  .  . ..-- 		 
"      _\__$    `-.|\| /_\ |< |-  		 
"    (___)      `-'' ''   '' `'--
"		  Author:  howiefh
"        Version:  1.3.0
"    Last_modify:  2014/03/11
"		  Github:  http://github.com/howiefh
"    Description:   _vimrc for windows .vimrc for linux
"																         .--.--. ..-.  . .  .  .-.
"																	   	 |- |- |\||-.  |-| /_\ | |
"																		 '  '--' ''-'  ' ''   '`-'	
" ****************************************** Initialize variables *************************************** {{{
" 设置当前系统
" 
if has("win32") || has("win32unix")
    let g:OS#name = "win"
    let g:OS#win = 1
    let g:OS#mac = 0
    let g:OS#unix = 0
elseif has("mac")
    let g:OS#name = "mac"
    let g:OS#mac = 1
    let g:OS#win = 0
    let g:OS#unix = 0
elseif has("unix")
    let g:OS#name = "unix"
    let g:OS#unix = 1
    let g:OS#win = 0
    let g:OS#mac = 0
endif
if has("gui_running")
    let g:OS#gui = 1
else
    let g:OS#gui = 0
endif

" 用用户目录
if g:OS#win
    let $VIMFILES = $VIM.'/vimfiles'
	let $HOME = $VIMFILES
	let $BLOG = "E:/User/Documents/howiefh.github.io"
elseif g:OS#unix
	let $VIM=$HOME 
    let $VIMFILES = $HOME.'/.vim'
	let $BLOG = "/media/WinE/User/Documents/howiefh.github.io"
endif
" 定义浏览器
if g:OS#win
	let s:browser = "C:/Program Files/Google/Chrome/Application/chrome.exe"
elseif g:OS#unix
	let s:browser = "/usr/bin/chromium-browser"
endif
" }}}

"  default _vimrc   {{{
if g:OS#win
	 " MyDiff 
	set diffexpr=MyDiff()
	function! MyDiff()
		  let opt = '-a --binary '
		  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		  let arg1 = v:fname_in
		  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		  let arg2 = v:fname_new
		  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		  let arg3 = v:fname_out
		  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		  let eq = ''
		  if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
			  let cmd = '""' . $VIMRUNTIME . '\diff"'
			  let eq = '"'
			else
			  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		  else
			let cmd = $VIMRUNTIME . '\diff'
		  endif
		  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
endif

" }}}

" ****************************************** Settings *************************************** {{{
" ************************************************************************************************
"  基本设置
" ************************************************************************************************

set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
"colorscheme torte          " 配置颜色方案
set number                  " 显示行号
set scrolloff=7				"Set 7 lines to the curors - when moving vertical..光标所在的行将总定位在窗口的第7的位置 

set cursorline              " 突出显示当前行
" set cursorcolumn			" 突出显示当前列

set wildmenu				 "Turn on WiLd menu 在末行命令行敲tab键时会在状态栏显示选项
set whichwrap+=h,l			"Bbackspace and cursor keys wrap to 使指定的左右移动光标的键在行首或行尾可以移到前一行或者后一行

set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set expandtab               " 插入<TAB>时显示合适数量的空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set shiftround				" 缩进取整到shiftwidth的倍数

set nobackup                " 覆盖文件时不备份
setlocal noswapfile        " 禁用swf交换文件

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
" set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本

set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码

set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间

set smartindent             " 开启新行时使用智能自动缩进
" set autoindent                 "自动缩进

" 已经通过statusline显示
" set ruler                   " 打开状态栏标尺 默认关闭
" set showcmd					" 标尺的右边显示未完成的命令  默认打开
" set showmode				" 显示当前模式  默认打开

set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoread				" 文件修改之后自动载入。
filetype plugin indent on   " 开启文件检测 
set backupcopy=yes          " 设置备份时的行为为覆盖
set magic                   " For regular expressions turn magic on
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set helplang=cn				"设置中文帮助
set backspace=indent,eol,start                            " 不设定的话在插入状态无法用退格键和 Delete 键删除回车符
set viminfo+=n$VIMFILES/cache/.viminfo    "设置viminfo的路径
"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

"显示长行 
set display=lastline                
nmap j gj
nmap k gk

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
" 级数大于foldlevel将会折叠
set foldlevel=5

" ************************************************************************************************

" gvim 菜单栏与工具栏隐藏与显示动态切换
" Toggle Menu and Toolbar
if g:OS#gui
	set guioptions-=m			 " 隐藏菜单栏
	set guioptions-=T			" 隐藏工具栏
	map <silent> <F2> :if &guioptions =~# 'T' <Bar>
			\set guioptions-=T <Bar>
			\set guioptions-=m <bar>
		\else <Bar>
			\set guioptions+=T <Bar>
			\set guioptions+=m <Bar>
		\endif<cr>
endif

" 设置字体 以及中文支持
if g:OS#unix
    set guifont=文泉驿等宽微米黑\ 11
endif
" if g:OS#win
	" set guifont=幼圆\ 12
" endif

" 解决win7下“Press Enter or type command to continue”提示
if g:OS#win
    silent!
endif 

" 设置启动时窗口最大化  linux下如果要窗口最大化参见：http://uniharmony.blog.163.com/blog/static/4617437620087310345373/
" 屏蔽以下的设置
if 0
if g:OS#win
    " 启动最大化
    " winsize 1024 768 "把窗口设为 宽：1024 高：768  已废弃
	set lines=28 columns=130
   " au GUIEnter * simalt ~x   "打开窗口后模拟（simalt ~x）alt 空格 x 组合键 （最大化窗口）
    au GUIEnter * winpos 200 140   "打开窗口后 将窗口 定位到 200 140 
 endif

" 设置窗口默认大小。
if g:OS#unix
	set columns=100
	set lines=30
endif
endif

" 配置多语言环境
if has("multi_byte")
	if g:OS#win
		" set fileencoding=chinese
        " set fileencodings=ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
		" TODO:设置为utf-8,:help查看不了帮助文档
		" set encoding=utf-8
		language messages utf-8
	elseif g:OS#unix
"		set fileencoding=cp936
		language messages zh_CN.utf-8
	endif
	set fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		" 设置宽度不明的文字(如 “”①②→ )为双宽度文本。
		" @see http://blog.sina.com.cn/s/blog_46dac66f010006db.html
        set ambiwidth=double
    endif  
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
 
"设置了ctrl+c  ctrl+v等标准windows操作
source $VIMRUNTIME/mswin.vim
behave mswin
 
"打开文件定位到关闭时的位置
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal g'\"" |
			\ endif |
 
" 定义Ev为编辑vimrc 命令
command! -nargs=* Ev edit $MYVIMRC  

" vimrc文件修改之后自动加载。
if g:OS#win
	autocmd! bufwritepost _vimrc source %
elseif g:OS#unix
	autocmd! bufwritepost .vimrc source %
endif

" 编辑myvimtips
command! -nargs=* Etips edit $VIMFILES/doc/1_myvimtips.txt

" 一旦vim窗口失去焦点，即你切换到其他窗口，vim编辑文件就会自动保存修改的文件
au FocusLost * silent! up 

" 在粘贴插入模式下代码是不会自动按格式缩进的,但是可以解决代码粘贴混乱的问题
" set paste
" set pastetoggle=<F9>
" 这样直接在插入模式按F9就会在“-- 插入 --”模式和“-- 插入（粘贴） --”模式中切换 
" ************************************************************************************************
 
" Autohotkey 
au BufNewFile,BufRead *.ahk	 setf autohotkey 
autocmd FileType autohotkey map <F5> :silent !start "d:\PortableApps\Autohotkey\autohotkey.exe" "%"<CR>

"字典目录
"au FileType txt setlocal dict+=$VIM/vimfiles/data/dictionary/zh_CN.dic
"au FileType txt setlocal dict+=$VIM/vimfiles/data/dictionary/eng_small.dic
"au FileType tex setlocal dict+=$VIM/vimfiles/data/dictionary/latex.dic
au FileType php setlocal dict+=$VIM/vimfiles/data/dictionary/php_funclist.txt
au FileType html setlocal dict+=$VIM/vimfiles/data/dictionary/html.dic

" for Java  http://mytc.5d6d.com/thread-5032-1-1.html
" makeprgs.Vim 
" 以下的设置没有效果
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>
" 开启很多对不规范的Python语法的警告提示 http://linux.cn/article-256-1.html
let python_no_builtin_highlight = 1
let python_no_doctest_code_highlight = 1
let python_no_doctest_highlight = 1
let python_no_exception_highlight = 1
let python_no_number_highlight = 1
let python_space_error_highlight = 1

" 切换c、c++、python工作目录
if g:OS#win
	let g:python_w = "D:/User/Documents/Program/Python"
	let g:cplus_w="D:/User/Documents/Program/c++"
	let g:c_w="D:/User/Documents/Program/c"
endif
if g:OS#unix
	let g:python_w = "~/文档/Program/Python"
	let g:cplus_w="~/文档/Program/C++"
	let g:c_w="~/文档/Program/C"
endif

function! ChangeWorkDir(dir) 
    execute ":cd " . a:dir 
endfunction 

map <Leader>py :call ChangeWorkDir(g:python_w)<CR>:pwd<CR>
map <Leader>cp :call ChangeWorkDir(g:cplus_w)<CR>:pwd<CR>
map <Leader>cw :call ChangeWorkDir(g:c_w)<CR>:pwd<cr>

" 调试
amenu icon=$VIMFILES."/gdbrun.bmp" ToolBar.Run :Crun<cr>
tmenu ToolBar.Run	Start debug
" }}}

" ***************************************** Mappings **************************************** {{{
" ************************************************************************************************
" map
" ************************************************************************************************
" 当前行下新起一行
map <S-RETURN> <Esc>o 
"去掉高亮
nnoremap <Esc> :noh<CR><Esc>
"映射esc键为jj
imap jj <Esc>
"映射ww为保存
nnoremap <Leader>w :w!<cr>
nnoremap <Leader>q :q<cr>

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
map <leader>1 :set filetype=xhtml<CR>
map <leader>2 :set filetype=css<CR>
map <leader>3 :set filetype=javascript<CR>
map <leader>4 :set filetype=php<CR>
map <leader>5 :set filetype=python<CR>

" Fileformats
set fileformats=unix,dos,mac
nmap <leader>fd :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 粘贴系统剪切板
vmap ys "+y

" }}}

" ***************************************** Function **************************************** {{{
"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" 在浏览器预览 
function! ViewInBrowser()
	let file = expand("%:p")
	if g:OS#win
		exec ":silent !start ". s:browser file
	elseif g:OS#unix
		exec ":silent !". s:browser file
	endif
endfunction
" http://www.vimer.cn/2012/05/vimgvim%E6%94%AF%E6%8C%81%E5%AF%B9%E9%BD%90%E7%BA%BF.html
map ,ch :call SetColorColumn()<CR>
map ,cc :set cuc<CR>
map ,cnc :set nocuc<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" }}}

" ****************************************** Plugins **************************************** {{{
" ************************************************************************************************
" plugin –vundle.vim管理插件的插件
" 其他
" https://github.com/junegunn/vim-plug
" https://github.com/tpope/vim-pathogen
" https://github.com/Shougo/neobundle.vim
" 发现在Ubuntu中将encoding设置为 utf-8 会使中文帮助无法使用
" https://github.com/gmarik/Vundle.vim/
" https://github.com/mutewinter/dot_vim
" https://github.com/kaochenlong/eddie-vim
" ************************************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIMFILES/bundle/Vundle.vim
call vundle#begin('$VIMFILES/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'kien/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mbbill/fencview'
" Plugin 'Raimondi/delimitMate'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'Yggdroot/indentLine'
" Plugin 'tpope/vim-fugitive'
" Plugin 'howiefh/statusline'
Plugin 'howiefh/c.vim'
Plugin 'howiefh/makeprgs'
Plugin 'howiefh/my-vim-plugin'
Plugin 'howiefh/TxtBrowser'
Plugin 'howiefh/vim-colors-solarized'
Plugin 'howiefh/Git-Branch-Info'
Plugin 'howiefh/vimcdoc'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'matchit.zip'
Plugin 'renamer.vim'
Plugin 'YankRing.vim'
Plugin 'AutoClose'
Plugin 'bufexplorer.zip'
Plugin 'TaskList.vim'
" Plugin 'TxtBrowser'
" Plugin 'Git-Branch-Info'
" Plugin 'FuzzyFinder'

" plugin not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ************************************************************************************************
" plugin - tagbar.vim 查看函数列表，需要ctags程序  taglist 的同类软件
" http://www.vim.org/scripts/script.php?script_id=3465
" ************************************************************************************************
nmap <silent> <F11> :TagbarToggle<CR>
if g:OS#win
    let g:tagbar_ctags_bin = "D:/PortableApps/Vim/ctags58/ctags.exe"
elseif g:OS#unix
    let g:tagbar_ctags_bin = "ctags"
endif
let g:tagbar_width = 30
" 自动打开
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" tagbar markdown
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ],
	\ 'sort'    : 0
\ }
" Tagbar txt
let g:tagbar_type_txt = {
    \ 'ctagstype': 'txt',
    \ 'kinds' : [
        \'c:content',
		\'t:tables',
		\'f:figures'
    \],
	\ 'sort'    : 0
\}
let g:tagbar_type_autohotkey = {
    \ 'ctagstype': 'autohotkey',
    \ 'kinds' : [
        \'l:Label',
		\'s:HotString',
		\'f:Function',
		\'n:Note',
		\'t:Todo',
		\'k:Hotkey',
		\'v:Variable'
    \],
	\ 'sort'    : 0
\}

" ************************************************************************************************
" plugin - bufexplorer.vim Buffers切换
" http://www.vim.org/scripts/script.php?script_id=42 
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
" 启动 bufexplorer 后可用下列命令:
" <F1>          切换帮助信息。
" <enter>       在当前 window 中打开光标所处的行的 buffer。
" <leftmouse>   在当前 window 中打开鼠标所指的行的 buffer。
" <shift-enter> 在别的 tab 中打开当前当标所处的行的 buffer。
" D             |:delete| 从列表里关闭当前光标下的 buffer, buffer 的 buflisted
" 选项被清空，可以通过 'show unlisted' 命令来重新显示这个 buffer。
" R             切换 相对路径/绝对路径。
" T             切换 是否只显示本 tab 的 buffer。
" d             |:wipeout| 从列表里删除当前光标下的 buffer。当一个 buffer 被清除，
" 即使 unlisted buffer 被显示，这个 buffer 也不会出现。
" f             切换 在选中 buffer 时，在当前窗口中打开 buffer，还是在活动窗口
              " (原 buffer 打开的窗口)中打开 buffer。
" o             在当前窗口中打开光标下的 buffer。
" p             切换 文件路径 是否按 文件名/路径 来显示。
" q             退出 bufexplore。
" r             反转 buffer 列表的顺序。
" s             选择buffer列表的排序方式，可以是 buffer 的序号(buffer number)，
	   " 文件名，扩展名，最近最多使用(MRU)，或者文件全路径。
" t             在新的 tab 页打开光标下的 buffer。
" t             在另外的tab中打开光标下的 buffer。
" u             切换 是否显示 "unlisted" buffer。
" ************************************************************************************************
"
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy=\"mru\"        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

" ************************************************************************************************
" plugin - NeoComplCache.vim    自动补全插件
" http://www.vim.org/scripts/script.php?script_id=2620
" https://github.com/Shougo/neocomplcache
" ************************************************************************************************
let g:neocomplcache_temporary_dir=$VIMFILES.'/cache/.neocon' 	"产生的临时文件保存的目录.默认值是 '~/.neocon'.
" neocomplcache开关.
map <F4> :NeoComplCacheToggle<CR>				
imap <F4> <ESC>:NeoComplCacheToggle<CR>a

" 停用 AutoComplPop.
" let g:acp_enableAtStartup = 0
" 启用 neocomplcache.  1是打开 
let g:neocomplcache_enable_at_startup = 1
" 启用 smartcase. 仅当输入大写字母时，区分大小写 
" let g:neocomplcache_enable_smart_case = 1
" 启用大写字母补全.输入大写字母时, 进行模糊搜索可能性词语  例如，当输入AE时会匹配ArgumentsException。
let g:neocomplcache_enable_camel_case_completion = 1
" 启用下划线补全.进行模糊搜索匹配的词。例如,当输入'p_h'时会匹配'public_html'。默认值是 0
let g:neocomplcache_enable_underbar_completion = 1
" 设定最小语法关键词长度.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" 定义字典.
"let g:neocomplcache_dictionary_filetype_lists = {
"	\ 'default' : '',
"	\ 'vimshell' : $HOME.'/.vimshell_hist',
"	\ 'scheme' : $HOME.'/.gosh_completions'
"		\ }
	
" 定义关键词.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 插件键映射.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" 推荐的键映射.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"			"加了这句之后对有的文件按回车不会输入候选项
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" 类似于AutoComplPop用法, 自动选择第一个候选项目 .
let g:neocomplcache_enable_auto_select = 1

" 类似于 Shell 用法(不推荐).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" 启用 omni 补全.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" 启用 heavy omni 补全.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"ruby
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" ************************************************************************************************
" plugin - Neosnippet.vim    代码段
" https://github.com/Shougo/neosnippet.vim
" ************************************************************************************************
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" nippets
let g:neosnippet#snippets_directory=$VIMFILES.'/data/snippets'
" cache
let g:neosnippet#data_directory=$VIMFILES.'cache/neosnippet'
" 解决neosnippet default snippets cannot be loaded.  You must install neosnippet-snippets or disable runtime snippets.
let g:neosnippet#disable_runtime_snippets={ "_": 1, } 

" ************************************************************************************************
" plugin - NERD_commenter.vim   注释代码用的，
" http://www.vim.org/scripts/script.php?script_id=1218 
" https://github.com/scrooloose/nerdcommenter
" [count],cc:光标以下count行逐行添加注释(7,cc)
" [count],cu:光标以下count行逐行取消注释(7,cu)
" [count],cm:光标以下count行尝试添加块注释(7,cm)
" 注：count参数可选，无则默认为选中行或当前行
" ************************************************************************************************
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

" ************************************************************************************************
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" http://www.vim.org/scripts/script.php?script_id=1658 
" https://github.com/scrooloose/nerdtree
" :NERDTree 打开NERD_tree         :NERDTreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
" ************************************************************************************************
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeBookmarksFile=$VIMFILES.'/data/.NERDTreeBookmarks'
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.rar$', '\.zip$', '\.png$', '\.jpg$', '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let NERDTreeAutoDeleteBuffer=1

" ************************************************************************************************
" plugin - AutoClose
" https://github.com/vim-scripts/AutoClose
" 匹配括号、引号
" <Leader>c 开关
" 其他
" https://github.com/Raimondi/delimitMate (试过，花括号换行有些问题，删除也有问题，没有解决)
" http://www.vim.org/scripts/script.php?script_id=3599
" https://github.com/jiangmiao/auto-pairs
" ************************************************************************************************
nmap <Leader>c <Plug>ToggleAutoCloseMappings

" ************************************************************************************************
" plugin –txtbrower.vim
" http://www.vim.org/scripts/script.php?script_id=2899
" http://guoyoooping.blog.163.com/blog/static/1357051832009112910162389/
" ************************************************************************************************
au BufEnter *.txt setlocal ft=txt
let g:default_web_browser = s:browser

"阅读txt            http://guoyoooping.blog.163.com/blog/static/135705183201003172751993/
let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
au BufRead,BufNewFile *.txt setlocal ft=txt nu formatoptions=t2crmB textwidth=152 bg& " 换行 折行
au BufRead,BufNewFile *.log setlocal ft=txt nu bg&

if !exists('Tlist_Ctags_Cmd')
    let Tlist_Ctags_Cmd = g:tagbar_ctags_bin
endif

" ************************************************************************************************
" plugin –fencview.vim自动识别编码
" http://www.vim.org/scripts/script.php?script_id=1708 
" ************************************************************************************************
let g:fencview_autodetect = 0                         " 0关闭 1开启

" ************************************************************************************************
" plugin – ctrlp.vim 文件搜索
" https://github.com/kien/ctrlp.vim 
" Once CtrlP is open:
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
" Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.

" Submit two or more dots .. to go up the directory tree by one or multiple levels.
" End the input string with a colon : followed by a command to execute it on the opening file(s):
" Use :25 to jump to line 25.
" Use :diffthis when opening multiple files to run :diffthis on the first 4 files.
" ************************************************************************************************
" Set the directory to store the cache files: >
let g:ctrlp_cache_dir = $VIMFILES.'/cache/ctrlpcache'

noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
command! -nargs=* MRU CtrlPMRU

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
  \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|png|jpg|jpeg)$',
  \ }


" ************************************************************************************************
" plugin – numbers.vim 在命令模式显示与当前行间隔的行数，用于快速定位
" https://github.com/myusuf3/numbers.vim
" ************************************************************************************************
nnoremap <F6> :NumbersToggle<CR>

" ************************************************************************************************
" plugin – matchit 快速找到标签的开始或结束位置
" https://github.com/vim-scripts/matchit.zip
" ************************************************************************************************
" % g% [% ]% a%

" ************************************************************************************************
" plugin – vim-markdown markdown高亮
" https://github.com/plasticboy/vim-markdown
" ************************************************************************************************
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
let g:vim_markdown_folding_disabled=1
" 用浏览器打开文件
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn,html,htm} map <Leader>p :call ViewInBrowser()<CR>

" ************************************************************************************************
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
"http://www.vim.org/scripts/script.php?script_id=2981
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
" ************************************************************************************************
let g:user_zen_settings = { 
  \  'lang' : 'zh-cn',
  \  'charset' : 'gbk',
  \  'indentation' : '    ', 
  \  'perl' : { 
  \    'aliases' : { 
  \      'req' : 'require ' 
  \    }, 
  \    'snippets' : { 
  \      'use' : "use strict\nuse warnings\n\n", 
  \      'warn' : "warn \"|\";", 
  \    } 
  \  } 
  \}
 " 'charset' : 'gbk',   设置编码 默认是utf-8
let g:user_zen_leader_key = ','
" let g:user_zen_expandabbr_key = '<c-e>'    "设置为ctrl+e展开
let g:use_zen_complete_tag = 1

" ************************************************************************************************
" plugin - YankRing.vim : Maintains a history of previous yanks, changes and deletes 
" http://www.vim.org/scripts/script.php?script_id=1234
" ************************************************************************************************
" yankring快捷键映射,原来的快捷键跟vim-multiple-cursors有冲突
let g:yankring_replace_n_pkey = '<A-p>'
let g:yankring_replace_n_nkey = '<A-n>'
let g:yankring_history_dir = $VIMFILES.'/cache'

" ************************************************************************************************
" plugin - vim-airline设置在状态行显示的信息  
" https://github.com/bling/vim-airline
" ************************************************************************************************
set laststatus=2			" 显示statusline
set t_Co=256
let g:airline_theme             = 'wombat' "molokai, luna
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

" 定义符号
" the separator used on the left side >
let g:airline_left_sep='>'
" the separator used on the right side >
let g:airline_right_sep='<'
let g:airline_left_alt_sep = '-'
let g:airline_right_alt_sep = '-'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '$'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = '#'
let g:airline_symbols.readonly = 'x'

" enable iminsert detection >
let g:airline_detect_iminsert=0

let g:airline#extensions#tabline#enabled = 1
" configure separators for the tabline only. >
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = '<'
let g:airline#extensions#tabline#right_alt_sep = ''

" 显示分支
let g:airline_section_b = '%{GitBranchInfoString()}'

" ************************************************************************************************
" plugin - vim-easymotion 快速移动定位
" https://github.com/Lokaltog/vim-easymotion
" ************************************************************************************************
map f <Plug>(easymotion-prefix)

" ************************************************************************************************
" plugin - vim-colors-solarized 配色
" https://github.com/altercation/vim-colors-solarized
" 另一个主题
" https://github.com/tomasr/molokai
" ************************************************************************************************
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" 配色方案
if g:OS#gui
	set background=dark
else
	set background=light
endif
colorscheme solarized

" ************************************************************************************************
" plugin - syntastic 检查语法
" https://github.com/scrooloose/syntastic
" ************************************************************************************************
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
" let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

" ************************************************************************************************
" plugin - Git-Branch-Info git分支信息
" https://github.com/vim-scripts/Git-Branch-Info
" ************************************************************************************************
" This will show just the current head branch name 
let g:git_branch_status_head_current=1

" This will show "? " before the branches. If not set ' Git ' (with a trailing
" left space) will be displayed.
let g:git_branch_status_text = ""
"
" The message when there is no Git repository on the current dir
let g:git_branch_status_nogit = ""
"
" Characters to put around the branch strings. Need to be a pair or characters,
" the first will be on the beginning of the branch string and the last on the
" end.
let g:git_branch_status_around=""
" 
" Check the current branch if it's the same branch where the file was loaded, 
" before saving the file.
let g:git_branch_check_write=0

" ************************************************************************************************
" plugin - vim-table-mode
" 方便地创建表格
" https://github.com/dhruvasagar/vim-table-mode
" <Leader>tm table mode 开关
" <Leader>tt 使用g:table_mode_delimiter定义的分隔符插入表格
" <Leader>T  使用用户输入的分隔符插入表格
" [|       移动到前一个表格 
" ]|       移动到下一个表格       
" {|       移动到上面一个表格
" }|       移动到下面一个表格       
" ||	   插入表头边框
" <Leader>tdd	删除一行
" <Leader>tdc	删除一列
" 其他
" https://github.com/nvie/vim-rst-tables
" https://github.com/vim-scripts/RST-Tables-CJK
" ************************************************************************************************
" Use this option to permanently enable the table mode: >
" let g:table_mode_always_active = 1
" Use this option to define the table corner character: >
let g:table_mode_corner = '|'
" Use this option to define the delimiter which used by
let g:table_mode_delimiter = ' '

" ************************************************************************************************
" plugin - tabular
" 对齐
" https://github.com/godlygeek/tabular
" 其它
" https://github.com/junegunn/vim-easy-align
" ************************************************************************************************

" ************************************************************************************************
" plugin - TaskList.vim
" 查看并快速跳转到代码中的TODO列表
" 默认<Leader>t 打开todo列表,和 vim-table-mode 冲突,改为<leader>v
" https://github.com/vim-scripts/TaskList.vim
" ************************************************************************************************
map <leader>v <Plug>TaskList

" ************************************************************************************************
" plugin - vim-indent-guides
" 显示缩进
" <Leader>ig 开关
" https://github.com/nathanaelkane/vim-indent-guides
" 另一个
" https://github.com/Yggdroot/indentLine
" ************************************************************************************************
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" ************************************************************************************************
" plugin - makeprgs.vim 
" http://www.vim.org/scripts/script.php?script_id=2031 
" ************************************************************************************************

" ************************************************************************************************
" plugin - statusline.vim 设置在状态行显示的信息  进行过更改
" http://www.vim.org/scripts/script.php?script_id=2879
" ************************************************************************************************

" ************************************************************************************************
" plugin - taglist.vim 查看函数列表，需要ctags程序
" http://www.vim.org/scripts/script.php?script_id=273 
" http://att.newsmth.net/att.php?s.731.55149.150442.diff
" http://att.newsmth.net/att.php?p.731.55149.1226.vim 
" ************************************************************************************************

" ************************************************************************************************
" plugin –pathogen.vim管理插件的插件
" http://www.vim.org/scripts/script.php?script_id=2332 
" https://github.com/tpope/vim-pathogen
" ************************************************************************************************

" ************************************************************************************************
" plugin –mru.vim打开历史文件
"http://www.vim.org/scripts/script.php?script_id=521
" ************************************************************************************************

" ************************************************************************************************
" plugin - pydiction Python 代码自动完成的脚本
" http://www.vim.org/scripts/script.php?script_id=850
" ************************************************************************************************


" ************************************************************************************************
" plugin - vimwiki
" http://www.vim.org/scripts/script.php?script_id=2226
" ************************************************************************************************

" ************************************************************************************************
" plugin - Calendar.vim 日历插件，可以写自己的心情日记。
" http://www.vim.org/scripts/script.php?script_id=52 
" <leader>cal 在左侧打开     <leader>caL 在下边打开
" ************************************************************************************************

" ************************************************************************************************
" plugin- vimtweak.dll 设置背景透明,窗口最大化,窗口在最前端
" http://www.vim.org/scripts/script.php?script_id=687
" ************************************************************************************************

" ************************************************************************************************
" plugin - Conque Shell 在vim中打开终端
" http://www.vim.org/scripts/script.php?script_id=2771
" ************************************************************************************************

" ************************************************************************************************
" plugin -VimIM.vim 
"http://vim.sourceforge.net/scripts/script.php?script_id=2506
" ************************************************************************************************

" ************************************************************************************************
" plugin - Mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" http://www.vim.org/scripts/script.php?script_id=2666 
" \m mark or unmark the word under (or before) the cursor
" \r manually input a regular expression. 用于搜索.
" \n clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \* 当前MarkWord的下一个     \# 当前MarkWord的上一个
" \/ 所有MarkWords的下一个    \? 所有MarkWords的上一个
" ************************************************************************************************

" ************************************************************************************************
" plugin - DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释
"http://www.vim.org/scripts/script.php?script_id=987 
" ************************************************************************************************
" ************************************************************************************************
" plugin – EasyGrep 多文档字符串搜索
" http://www.vim.org/scripts/script.php?script_id=2438
" vv – Grep for the word under the cursor
" va – Like vv, but add to existing list
" vo – Select the files to search in and set grep options
" :Grep SearchString 
" ************************************************************************************************

" ************************************************************************************************
"  plugin – javascript 语法设置 ~/.vim/syntax/javascript.vim
" ************************************************************************************************

" ************************************************************************************************
"  plugin –javascript 常见语法错误检查 plugin/javaScriptLint.vim
"http://www.vim.org/scripts/script.php?script_id=2578
" 按 Ctrl + S + J 就可以检查 Javascript 语法有无问题
" ************************************************************************************************

" ************************************************************************************************
" plugin –DrawIt：Vim画图插件（可在vim中画基本示意图）
" http://www.vim.org/scripts/script.php?script_id=40 
"http://hi.baidu.com/2maollm/blog/item/ff98de179aa61505c93d6da7.html
" ************************************************************************************************
 
" ************************************************************************************************
" plugin - template_loader.vim模板
"http://code.google.com/p/nishizaw23/downloads/list
" ************************************************************************************************

" ************************************************************************************************
" plugin –sketch.vim画图
"  http://www.vim.org/scripts/script.php?script_id=705 
" ************************************************************************************************
"执行:call ToggleSketch()命令开启或关闭画图功能. 建议在.vimrc中把
"    call ToggleSketch() 映射为命令, 方便一些":map <F1> :call
"    ToggleSketch()<CR>"
" 
"鼠标左键用于画自由曲线, Ctrl-鼠标左键可以画粗曲线. 鼠标右键圈一个区域, 然后点击
"左键可以画空心图, Shift-鼠标左键画的的时候拐弯处用"."而不是"+", Ctrl-鼠标左键可
"以画实习图. Alt-鼠标左键可以切换实心画和粗笔画的线条, 可以有的选择为".", ":"和
"#".
"
"command Sketch :call ToggleSketch() "定义新命令Sketch
"
" ************************************************************************************************
" plugin - timestamp.vim 
" http://www.vim.org/scripts/script.php?script_id=923
" ************************************************************************************************
" }}}

" vim:fdm=marker
