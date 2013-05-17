" ************************************************************************************************
"       _     
"      (-'      .-.. .  .  . ..-- 		 
"      _\__$    `-.|\| /_\ |< |-  		 
"    (___)      `-'' ''   '' `'--
"        Version:  1.2.14
"           Date:  2012/03/12
"    Description:   _vimrc for windows .vimrc for linux
"																         .--.--. ..-.  . .  .  .-.
"																	   	 |- |- |\||-.  |-| /_\ | |
"																		 '  '--' ''-'  ' ''   '`-'	
" ************************************************************************************************
" ���õ�ǰϵͳ
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


" ************************************************************************************************
"  default _vimrc
if g:OS#win
	 " MyDiff {{{
	set diffexpr=MyDiff()
	function MyDiff()
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
"  ��������
" ************************************************************************************************

set nocompatible            " �ر� vi ����ģʽ
syntax on                   " �Զ��﷨����
"colorscheme torte           "������ɫ����
set number                  " ��ʾ�к�
set cursorline              " ͻ����ʾ��ǰ��
set wildmenu				 "Turn on WiLd menu ��ĩ����������tab��ʱ����״̬����ʾѡ��
set whichwrap+=h,l			"Bbackspace and cursor keys wrap to ʹָ���������ƶ����ļ������׻���β�����Ƶ�ǰһ�л��ߺ�һ��
set so=7					 "Set 7 lines to the curors - when moving vertical..������ڵ��н��ܶ�λ�ڴ��ڵĵ�7��λ�� 
"set ruler                   " ��״̬�����
set shiftwidth=4            " �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4
set softtabstop=4           " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�
set tabstop=4               " �趨 tab ����Ϊ 4
set nobackup                " �����ļ�ʱ������
set autochdir               " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
filetype plugin indent on   " �����ļ���� 
set backupcopy=yes          " ���ñ���ʱ����ΪΪ����
set ignorecase smartcase    " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
" set nowrapscan              " ��ֹ���������ļ�����ʱ��������
set incsearch               " ������������ʱ����ʾ�������
set hlsearch                " ����ʱ������ʾ���ҵ����ı�
set noerrorbells            " �رմ�����Ϣ����
set novisualbell            " �ر�ʹ�ÿ�������������
set t_vb=                   " �ÿմ����������ն˴���
set showmatch               " ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ����
set showcmd		    "��ߵ��ұ���ʾδ��ɵ�����
set matchtime=2             " ������ת��ƥ�����ŵ�ʱ��
set magic                   " ����ħ��
set hidden                  " ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�
set helplang=cn				"�������İ���
set smartindent             " ��������ʱʹ�������Զ�����
"set autoindent                 "�Զ�����
set backspace=indent,eol,start                            " ���趨�Ļ��ڲ���״̬�޷����˸���� Delete ��ɾ���س���
setlocal noswapfile        " ����swf�����ļ�
set viminfo+=n$VIMFILES/Data/.viminfo    "����viminfo��·��
 "��ʾ����
set display=lastline                
nmap j gj
nmap k gk
"������ʾ����

" ************************************************************************************************
"  gvim �˵����빤������������ʾ��̬�л�
"Toggle Menu and Toolbar
" ************************************************************************************************
if g:OS#gui
	set guioptions-=m			 " ���ز˵���
	set guioptions-=T			" ���ع�����
	map <silent> <F2> :if &guioptions =~# 'T' <Bar>
			\set guioptions-=T <Bar>
			\set guioptions-=m <bar>
		\else <Bar>
			\set guioptions+=T <Bar>
			\set guioptions+=m <Bar>
		\endif<cr>
endif

" ************************************************************************************************
" ��ɫ����
" ************************************************************************************************
if g:OS#gui
	colorscheme torte           "������ɫ����
else
	colorscheme ManShow           "������ɫ����
endif

" ************************************************************************************************
" ���û�Ŀ¼
if g:OS#win
    let $VIMFILES = $VIM.'/vimfiles'
	let $HOME = $VIMFILES
	let $BLOG = "E:/User/Documents/howiefh.github.io"
elseif g:OS#unix
	let $VIM=$HOME 
    let $VIMFILES = $HOME.'/.vim'
	let $BLOG = "/media/WinE/User/Documents/howiefh.github.io"
endif

" �������� �Լ�����֧��
if g:OS#win
    set guifont=����:h12:cANSI
endif

if g:OS#win
    " ���win7�¡�Press Enter or type command to continue����ʾ
    silent!
endif 

" ��������ʱ�������  linux�����Ҫ������󻯲μ���http://uniharmony.blog.163.com/blog/static/4617437620087310345373/
if g:OS#win
    " �������
    " winsize 1024 768 "�Ѵ�����Ϊ ��1024 �ߣ�768  �ѷ���
	set lines=28 columns=130
   " au GUIEnter * simalt ~x   "�򿪴��ں�ģ�⣨simalt ~x��alt �ո� x ��ϼ� ����󻯴��ڣ�
    au GUIEnter * winpos 200 140   "�򿪴��ں� ������ ��λ�� 200 140 
 endif

if g:OS#unix
	 " ���ô���Ĭ�ϴ�С��
	set columns=100
	set lines=30
endif

" ���ö����Ի���
if has("multi_byte")
	if g:OS#win
        " set fileencoding=cp936
        " set fileencodings=ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
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
		" ���ÿ�Ȳ���������(�� �����٢ڡ� )Ϊ˫����ı���
		" @see http://blog.sina.com.cn/s/blog_46dac66f010006db.html
        set ambiwidth=double
    endif  
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
 
"������ctrl+c  ctrl+v�ȱ�׼windows����
source $VIMRUNTIME/mswin.vim
behave mswin
 
"���ļ���λ���ر�ʱ��λ��
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal g'\"" |
			\ endif |
 
"�ֵ�Ŀ¼
"au FileType txt setlocal dict+=$VIM/vimfiles/Data/dictionary/zh_CN.dic
"au FileType txt setlocal dict+=$VIM/vimfiles/Data/dictionary/eng_small.dic
"au FileType tex setlocal dict+=$VIM/vimfiles/Data/dictionary/latex.dic
au FileType php setlocal dict+=$VIM/vimfiles/Data/dictionary/php_funclist.txt

au FileType html setlocal dict+=$VIM/vimfiles/Data/dictionary/html.dic

" for Java  http://mytc.5d6d.com/thread-5032-1-1.html
" makeprgs.Vim 
" ���µ�����û��Ч��
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" ************************************************************************************************
" Python �ļ���һ�����ã����粻Ҫ tab ��
" ************************************************************************************************
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" ************************************************************************************************
"  �л�c��c++��python����Ŀ¼
" ************************************************************************************************
if g:OS#win
	let g:python_w = "D:/User/Documents/Program/Python"
	let g:cplus_w="D:/User/Documents/Program/c++"
	let g:c_w="D:/User/Documents/Program/c"
endif
if g:OS#unix
	let g:python_w = "~/�ĵ�/Program/Python"
	let g:cplus_w="~/�ĵ�/Program/C++"
	let g:c_w="~/�ĵ�/Program/C"
endif

function ChangeDir(dir) 
    execute ":cd " . a:dir 
endfunction 

map <Leader>py :call ChangeDir(g:python_w)<CR>:pwd<CR>
map <Leader>cp :call ChangeDir(g:cplus_w)<CR>:pwd<CR>
map <Leader>cw :call ChangeDir(g:c_w)<CR>:pwd<cr>

" }}}
" ***************************************** Mappings **************************************** {{{
" ************************************************************************************************
" map
" ************************************************************************************************
map <S-RETURN> <Esc>o 
" ��ǰ��������һ��
nnoremap <Esc> :noh<CR><Esc>
"ȥ������
imap jj <Esc>
"ӳ��esc��Ϊjj
nnoremap <Leader>w :w!<cr>
"ӳ��wwΪ����

" Buffers������ݷ�ʽ!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab������ݷ�ʽ!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"һЩ�����ӳ��ת���﷨�������һ���ļ��л���˲�ͬ����ʱ���ã�
map <leader>1 :set filetype=xhtml<CR>
map <leader>2 :set filetype=css<CR>
map <leader>3 :set filetype=javascript<CR>
map <leader>4 :set filetype=php<CR>
map <leader>5 :set filetype=python<CR>

" Fileformats
set fileformats=unix,dos,mac
nmap <leader>fd :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>

"���ڷָ�ʱ,�����л��İ����ȼ���Ҫ��������,������·������ƶ�
"��굽�Ϸ�����,��Ҫ<c-w><c-w>k,�ǳ��鷳,������ӳ��Ϊ<c-k>,�л���
"ʱ����÷ǳ�����.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}
" Autohotkey 
au BufNewFile,BufRead *.ahk	 setf autohotkey 

command! -nargs=* Ev edit $MYVIMRC  "����Vimrc Ϊ�༭vimrc ����

" �������Ԥ�� 
function! ViewInBrowser()
	let file = expand("%:p")
	if g:OS#win
		let Browser = "C:/Program Files/Google/Chrome/Application/chrome.exe"
	elseif g:OS#unix
		let Browser = "chromium-browser"
	endif
	exec ":silent !start ". Browser file
endfunction

" ****************************************** Plugins **************************************** {{{
" ************************************************************************************************
" plugin �Cvundle.vim�������Ĳ��   �������İ����޷�ʹ�� �Ѿ�ͣ�ô˲������pathogen.vim
" ������Ubuntu�н�encoding����Ϊ utf-8 ��ʹ���İ����޷�ʹ��
" https://github.com/gmarik/vundle/
" https://github.com/mutewinter/dot_vim
" https://github.com/kaochenlong/eddie-vim
" ************************************************************************************************
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$VIMFILES/bundle/vundle
call vundle#rc('$VIMFILES/bundle/')

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/neocomplcache'
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'howiefh/statusline'
Bundle 'howiefh/c.vim'
Bundle 'howiefh/makeprgs'

" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'matchit.zip'
Bundle 'AutoClose'
Bundle 'bufexplorer.zip'
Bundle 'TxtBrowser'
Bundle 'FencView.vim'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ************************************************************************************************
" plugin - tagbar.vim �鿴�����б���Ҫctags����  taglist ��ͬ�����
" http://www.vim.org/scripts/script.php?script_id=3465
" ************************************************************************************************
nmap <silent> <F11> :TagbarToggle<CR>
if g:OS#win
    let g:tagbar_ctags_bin = "D:/PortableApps/Vim/ctags58/ctags.exe"
endif
let g:tagbar_width = 30
" �Զ���
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" tagbar markdown
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
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

" ************************************************************************************************
" plugin - bufexplorer.vim Buffers�л�
" http://www.vim.org/scripts/script.php?script_id=42 
" \be ȫ����ʽ�鿴ȫ���򿪵��ļ��б�
" \bv ���ҷ�ʽ�鿴   \bs ���·�ʽ�鿴
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
" plugin - NeoComplCache.vim    �Զ���ȫ���
"http://www.vim.org/scripts/script.php?script_id=2620
"https://github.com/Shougo/neocomplcache
" ************************************************************************************************
let g:neocomplcache_temporary_dir=$VIMFILES.'/Data/.neocon' 	"��������ʱ�ļ������Ŀ¼.Ĭ��ֵ�� '~/.neocon'.
let g:neocomplcache_snippets_dir=$VIMFILES.'/Data/snippets'
" neocomplcache����.
map <F4> :NeoComplCacheToggle<CR>				
imap <F4> <ESC>:NeoComplCacheToggle<CR>a

" ͣ�� AutoComplPop.
" let g:acp_enableAtStartup = 0
" ���� neocomplcache.  1�Ǵ� 
let g:neocomplcache_enable_at_startup = 1
" ���� smartcase. ���������д��ĸʱ�����ִ�Сд 
" let g:neocomplcache_enable_smart_case = 1
" ���ô�д��ĸ��ȫ.�����д��ĸʱ, ����ģ�����������Դ���  ���磬������AEʱ��ƥ��ArgumentsException��
let g:neocomplcache_enable_camel_case_completion = 1
" �����»��߲�ȫ.����ģ������ƥ��Ĵʡ�����,������'p_h'ʱ��ƥ��'public_html'��Ĭ��ֵ�� 0
let g:neocomplcache_enable_underbar_completion = 1
" �趨��С�﷨�ؼ��ʳ���.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" �����ֵ�.
"let g:neocomplcache_dictionary_filetype_lists = {
"	\ 'default' : '',
"	\ 'vimshell' : $HOME.'/.vimshell_hist',
"	\ 'scheme' : $HOME.'/.gosh_completions'
"		\ }
	
" ����ؼ���.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" �����ӳ��.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" ������SuperTab�÷� .
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" �Ƽ��ļ�ӳ��.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"			"�������֮����е��ļ����س����������ѡ��
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" ������AutoComplPop�÷�, �Զ�ѡ���һ����ѡ��Ŀ .
let g:neocomplcache_enable_auto_select = 1

" ������ Shell �÷�(���Ƽ�).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" ���� omni ��ȫ.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" ���� heavy omni ��ȫ.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" ************************************************************************************************
" plugin - NERD_commenter.vim   ע�ʹ����õģ�
" http://www.vim.org/scripts/script.php?script_id=1218 
" https://github.com/scrooloose/nerdcommenter
" [count],cc:�������count���������ע��(7,cc)
" [count],cu:�������count������ȡ��ע��(7,cu)
" [count],cm:�������count�г�����ӿ�ע��(7,cm)
" ע��count������ѡ������Ĭ��Ϊѡ���л�ǰ��
" ************************************************************************************************
let NERDSpaceDelims=1       " ��ע�ͷ������֮����һ���ո�
let NERDCompactSexyComs=1   " ����ע��ʱ���Ӹ��ÿ�

" ************************************************************************************************
" plugin - NERD_tree.vim ����״��ʽ���ϵͳ�е��ļ���Ŀ¼
" http://www.vim.org/scripts/script.php?script_id=1658 
" https://github.com/scrooloose/nerdtree
" :NERDTree ��NERD_tree         :NERDTreeClose    �ر�NERD_tree
" o �򿪹ر��ļ�����Ŀ¼         t �ڱ�ǩҳ�д�
" T �ں�̨��ǩҳ�д�           ! ִ�д��ļ�
" p ���ϲ�Ŀ¼                   P ����Ŀ¼
" K ����һ���ڵ�                 J �����һ���ڵ�
" u ���ϲ�Ŀ¼                 m ��ʾ�ļ�ϵͳ�˵�����ӡ�ɾ�����ƶ�������
" r �ݹ�ˢ�µ�ǰĿ¼             R �ݹ�ˢ�µ�ǰ��Ŀ¼
" ************************************************************************************************
" F3 NERDTree �л�
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeBookmarksFile=$VIMFILES.'/Data/.NERDTreeBookmarks'

" ************************************************************************************************
" plugin -auto-pairs.vim
" http://www.vim.org/scripts/script.php?script_id=3599
" https://github.com/jiangmiao/auto-pairs
" ƥ�����š�����,���ļ���/autoload ��
" ��Ϊhttps://github.com/vim-scripts/AutoClose
" ************************************************************************************************
" au FileType c,cpp so $VIMFILES/bundle/autoclose/autoclose.vim

" ************************************************************************************************
" plugin �Ctxtbrower.vim
" http://www.vim.org/scripts/script.php?script_id=2899
" http://guoyoooping.blog.163.com/blog/static/1357051832009112910162389/
" ************************************************************************************************
au BufEnter *.txt setlocal ft=txt

if g:OS#win
"
	"�Ķ�txt            http://guoyoooping.blog.163.com/blog/static/135705183201003172751993/
	let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
	au BufRead,BufNewFile *.txt setlocal ft=txt nu formatoptions=t2crmB textwidth=152 bg& " ���� ����
	au BufRead,BufNewFile *.txt colo torte " default 
	au BufRead,BufNewFile *.log setlocal ft=txt nu bg&
	au BufRead,BufNewFile *.log colo torte "default desert
	map <F9> :TGoto<CR> 
	autocmd BufRead,BufNewFile *.html map <F10> :call ViewInBrowser()<CR>           " ����������ļ�
"
	if !exists('Tlist_Ctags_Cmd')
		let Tlist_Ctags_Cmd = g:tagbar_ctags_bin
	endif
endif
" ************************************************************************************************
" plugin �Cfencview.vim�Զ�ʶ�����
" http://www.vim.org/scripts/script.php?script_id=1708 
" ************************************************************************************************
let g:fencview_autodetect = 0                         " 0�ر� 1����

" ************************************************************************************************
" plugin �Cpathogen.vim�������Ĳ��
" http://www.vim.org/scripts/script.php?script_id=2332 
" https://github.com/tpope/vim-pathogen
" ************************************************************************************************

" ************************************************************************************************
" plugin �C ctrlp.vim �ļ�����
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
let g:ctrlp_cache_dir = $VIMFILES.'/Data/ctrlpcache'

noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
command! -nargs=* MRU CtrlPMRU

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" ************************************************************************************************
" plugin �C numbers.vim ������ģʽ��ʾ�뵱ǰ�м�������������ڿ��ٶ�λ
" https://github.com/myusuf3/numbers.vim
" ************************************************************************************************
nnoremap <F6> :NumbersToggle<CR>

" ************************************************************************************************
" plugin �C matchit �����ҵ���ǩ�Ŀ�ʼ�����λ��
" https://github.com/vim-scripts/matchit.zip
" ************************************************************************************************
" % g% [% ]% a%

" ************************************************************************************************
" plugin �C vim-markdown markdown����
" https://github.com/plasticboy/vim-markdown
" ************************************************************************************************
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
let g:vim_markdown_folding_disabled=1
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :call ViewInBrowser()<CR>

" ************************************************************************************************
" plugin �C ZenCoding.vim �ܿ�Ĳ����HTML��������
"http://www.vim.org/scripts/script.php?script_id=2981
" ������°棺http://github.com/mattn/zencoding-vim
" ��������ɿ���http://nootn.com/blog/Tool/23/
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
 " 'charset' : 'gbk',   ���ñ��� Ĭ����utf-8
let g:user_zen_leader_key = ','
" let g:user_zen_expandabbr_key = '<c-e>'    "����Ϊctrl+eչ��
let g:use_zen_complete_tag = 1

" ************************************************************************************************
" plugin - statusline.vim ������״̬����ʾ����Ϣ  ���й�����
" http://www.vim.org/scripts/script.php?script_id=2879
" ************************************************************************************************

" ************************************************************************************************
" plugin - makeprgs.vim 
" http://www.vim.org/scripts/script.php?script_id=2031 
" ************************************************************************************************

" ************************************************************************************************
" plugin - taglist.vim �鿴�����б���Ҫctags����
" http://www.vim.org/scripts/script.php?script_id=273 
" http://att.newsmth.net/att.php?s.731.55149.150442.diff
" http://att.newsmth.net/att.php?p.731.55149.1226.vim 
" ************************************************************************************************

" ************************************************************************************************
" plugin �Cmru.vim����ʷ�ļ�
"http://www.vim.org/scripts/script.php?script_id=521
" ************************************************************************************************

" ************************************************************************************************
" plugin - pydiction Python �����Զ���ɵĽű�
" http://www.vim.org/scripts/script.php?script_id=850
" ************************************************************************************************


" ************************************************************************************************
" plugin - vimwiki
" http://www.vim.org/scripts/script.php?script_id=2226
" ************************************************************************************************

" ************************************************************************************************
" plugin - Calendar.vim �������������д�Լ��������ռǡ�
" http://www.vim.org/scripts/script.php?script_id=52 
" <leader>cal ������     <leader>caL ���±ߴ�
" ************************************************************************************************

" ************************************************************************************************
" plugin- vimtweak.dll ���ñ���͸��,�������,��������ǰ��
" http://www.vim.org/scripts/script.php?script_id=687
" ************************************************************************************************

" ************************************************************************************************
" plugin - Conque Shell ��vim�д��ն�
" http://www.vim.org/scripts/script.php?script_id=2771
" ************************************************************************************************

" ************************************************************************************************
" plugin -VimIM.vim 
"http://vim.sourceforge.net/scripts/script.php?script_id=2506
" ************************************************************************************************

" ************************************************************************************************
" plugin - Mark.vim ������tags��ǲ�ͬ����ɫ�����ڹۿ���ʽ�Ĳ����
" http://www.vim.org/scripts/script.php?script_id=2666 
" \m mark or unmark the word under (or before) the cursor
" \r manually input a regular expression. ��������.
" \n clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \* ��ǰMarkWord����һ��     \# ��ǰMarkWord����һ��
" \/ ����MarkWords����һ��    \? ����MarkWords����һ��
" ************************************************************************************************

" ************************************************************************************************
" plugin - DoxygenToolkit.vim ��ע�������ĵ��������ܹ��������ɺ�����׼ע��
"http://www.vim.org/scripts/script.php?script_id=987 
" ************************************************************************************************
" ************************************************************************************************
" plugin �C EasyGrep ���ĵ��ַ�������
" http://www.vim.org/scripts/script.php?script_id=2438
" vv �C Grep for the word under the cursor
" va �C Like vv, but add to existing list
" vo �C Select the files to search in and set grep options
" :Grep SearchString 
" ************************************************************************************************

" ************************************************************************************************
"  plugin �C javascript �﷨���� ~/.vim/syntax/javascript.vim
" ************************************************************************************************

" ************************************************************************************************
"  plugin �Cjavascript �����﷨������ plugin/javaScriptLint.vim
"http://www.vim.org/scripts/script.php?script_id=2578
" �� Ctrl + S + J �Ϳ��Լ�� Javascript �﷨��������
" ************************************************************************************************

" ************************************************************************************************
" plugin �CDrawIt��Vim��ͼ���������vim�л�����ʾ��ͼ��
" http://www.vim.org/scripts/script.php?script_id=40 
"http://hi.baidu.com/2maollm/blog/item/ff98de179aa61505c93d6da7.html
" ************************************************************************************************
 
" ************************************************************************************************
" plugin - template_loader.vimģ��
"http://code.google.com/p/nishizaw23/downloads/list
" ************************************************************************************************

" ************************************************************************************************
" plugin �Csketch.vim��ͼ
"  http://www.vim.org/scripts/script.php?script_id=705 
" ************************************************************************************************
"ִ��:call ToggleSketch()�������رջ�ͼ����. ������.vimrc�а�
"    call ToggleSketch() ӳ��Ϊ����, ����һЩ":map <F1> :call
"    ToggleSketch()<CR>"
" 
"���������ڻ���������, Ctrl-���������Ի�������. ����Ҽ�Ȧһ������, Ȼ����
"������Ի�����ͼ, Shift-���������ĵ�ʱ����䴦��"."������"+", Ctrl-��������
"�Ի�ʵϰͼ. Alt-�����������л�ʵ�Ļ��ʹֱʻ�������, �����е�ѡ��Ϊ".", ":"��
"#".
"
"command Sketch :call ToggleSketch() "����������Sketch
"
" ************************************************************************************************
" plugin - timestamp.vim 
" http://www.vim.org/scripts/script.php?script_id=923
" ************************************************************************************************
" }}}

" vim:fdm=marker
