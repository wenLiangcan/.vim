"""快捷键説明"""
"leader键为,'
"回车并缩进一个tab: Ctrl+Enter
"退出: Shift + w
"next/previous buffer: ]b / [b
"保存文件: Ctrl + s
"Copy / Paste: Ctrl+p / Ctrl+v
"编辑vim配置文件: ,vv(gvim为 ,vg
"重载配置文件: ,ss(gvim为 ,sg
"快速编辑当前文件所在路径下的各文件: ,e
"查看多行字符对齐: ,ch

"调用 Gundo: <leader>g
"呼出 Tagbar: F3
"格式化 Javascript/HTML/CSS: Ctrl + f

" 开关 Vimfiler: F9

"最大化当前分割窗口: Ctrl+w+o
"easy motion:
"           快速定位: <leader<leader>w
"           定位到指定字符: <leader>leader>f<char>

"显示/隐藏工具栏: F2
"生成tag文件: F12
"一键编译: F5
"make: F6
"添加版权信息: F4
"代码折叠: <space>
" Search and replace the word under the cursor: <Leader>s
" Toggle wrapping: <Leader>w



if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif

set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
filetype off

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" scripts on GitHub repos
Plugin 'vim-scripts/ag.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'rosenfeld/conque-term'
Plugin 'mattn/emmet-vim'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'vim-scripts/Indent-Guides'
Plugin 'vim-scripts/matchit.zip'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/winmanager'
"Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

""" Js
" Plugin 'marijnh/tern_for_vim'   " Javascript completion
Plugin 'ahayman/vim-nodejs-complete'   " Nodejs completion
" Linter
Plugin 'Shutnik/jshint2.vim'
" Format
""jsbeautify
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
" Hightlight
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/jQuery'

Plugin 'kchmck/vim-coffee-script'

Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'lilydjwg/colorizer'
Plugin 'ap/vim-css-color'
" Plugin 'szw/vim-ctrlspace'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Blackrush/vim-gocode'


Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'junegunn/goyo.vim'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/paredit.vim'
Plugin 'wlangstroth/vim-racket'

""UltiSnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'taurenchieftain/vim-vala'
Plugin 'vim-scripts/xmledit'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/nginx.vim'
Plugin 'leafo/moonscript-vim'
Plugin 'klen/python-mode'
Plugin 'lepture/vim-jinja'
Plugin 'fisadev/vim-isort'
Plugin 'wting/rust.vim'
Plugin 'phildawes/racer'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'kongo2002/fsharp-vim'
Plugin 'keith/swift.vim'
" This plugin highlights the matching HTML tag when the cursor is positioned on a tag.
Plugin 'gregsexton/MatchTag'
" Adapt the window proportions after Vim is resized.
Plugin 'vim-scripts/ProportionalResize'
" Provide smart input assistant
Plugin 'kana/vim-smartinput'
Plugin 'luochen1990/rainbow'

" scripts not on GitHub
Plugin 'git://fedorapeople.org/home/fedora/wwoods/public_git/vim-scripts.git', {'name': 'vim-systemd'}



""""""""""""""""基础设定""""""""""""""""

if(g:iswindows==1)
        behave mswin
endif
syntax on"打开高亮
filetype indent on
filetype on
autocmd BufEnter * lcd %:p:h
if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
    set autoindent " always set autoindenting on
endif " has("autocmd")
set tabstop=4 shiftwidth=4 expandtab "让一个tab等于4个空格
"set nowrap "不自动换行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
if(g:iswindows==1)
    "防止linux终端下无法拷贝
    au GUIEnter * simalt ~x
endif

if has('mouse') "允许鼠标的使用
    set mouse=a
endif

"关闭鸣声提示
"set noerrorbells
"set novisualbell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

"set the menu and the message to English
set langmenu=en_US
let $LANG='en_US'

"中文编码
set encoding=utf-8
""GBK
"set fenc=cp936
"set fileencodings=cp936,ucs-bom,utf-8
""UTF-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp936
if(g:iswindows==1)
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif
set nobomb

"字体的设置
if(g:iswindows==1)
    set guifont=Bitstream_Vera_Sans_Mono_for_Po:h13:cANSI"记住空格用下划线代替哦
    set gfw=幼圆:h13.5:cGB2312
else
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 11
    set guifont=Monaco\ 11
    "set gfw=YouYuan\ 11.5
    set gfw=Microsoft\ YaHei\ Mono\ 11
endif

set nu"显示行号
"set guitablabel=%N.%t "给tab加上序号

"配色
set t_Co=256"终端配色兼容设置
colorscheme solarized
"if has('gui_running')
"    set background=light
"else
    set background=dark
"endif

" Change location of swap file
set directory=~/tmp,/tmp

""""""""""""""""基础设定""""""""""""""""



"""""""""""""""" Key Mapping """"""""""""""""

"Set mapleader
let mapleader = ","

"按Ctrl+Enter，回车并缩进一个tab
inoremap <C-Return> <CR><CR><C-o>k<Tab>

"Shift + w to exit
nmap <S-w> :q<CR>

" Shift + Return to open new line in insert mode
imap <S-Return> <Esc>o
"next/previous buffer
nmap [b :bp<CR>
nmap ]b :bn<CR>

"""Ctrl + s to save
"" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%')) && has('gui_running')
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>
"""return to insert mode after the save
"inoremap <c-s> <c-o>:Update<CR>

"Copy / Paste
vnoremap <silent> <C-c> "+y
if has("gui_running")
    nnoremap <silent> <C-v> "+p
    inoremap <C-v> <Esc>"+p
endif

"配置文件编辑
if has("unix")
        "Fast reloading of the vimrc/gvimrc
        map <silent> <leader>ss :source ~/.vim/vimrc<cr>
        map <silent> <leader>sg :source ~/.vim/gvimrc<cr>
        "Fast editing of vimrc/gvimrc
        map <silent> <leader>vv :e ~/.vim/vimrc<cr>
        map <silent> <leader>vg :e ~/.vim/gvimrc<cr>
        "When vimrc/gvimrc is edited, reload it
        autocmd! bufwritepost vimrc source "~/.vim/vimrc" source "~/.vim/vimrc"
        autocmd! bufwritepost gvimrc source "~/.vim/gvimrc" source "~/.vim/gvimrc"
else
        "Fast reloading of the _vimrc/ _gvimrc
        map <silent> <leader>ss :source $VIM/_vimrc<cr>
        map <silent> <leader>sg :source $VIM/_gvimrc<cr>
        "Fast editing of _vimrc/ _gvimrc
        map <silent> <leader>vv :e $VIM/_vimrc<cr>
        map <silent> <leader>vg :e $VIM/_gvimrc<cr>
        "When _vimrc/ _gvimrc is edited, reload it
        autocmd! bufwritepost _vimrc source $VIM/_vimrc source $VIM/_vimrc
        autocmd! bufwritepost _gvimrc source $VIM/_gvimrc source $VIM/_gvimrc
endif

"快速编辑当前文件所在路径下的各文件
if(g:iswindows==1)
        map <leader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
else
        map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
endif

"用空格键来开关代码折叠
"set foldenable
"set foldmethod=indent
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"查看一下某几行的字符是否在同一列上
map ,ch :call SetColorColumn()<CR>"按下,ch 就可以将当前光标下的列高亮，再按下一次，取消高亮；并且可以同时多列高亮
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" Search and replace the word under the cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Toggle wrapping on or off
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
  endif
endfunction

autocmd filetype javascript :nnoremap <buffer> <C-LeftMouse> <LeftMouse>:TernDef<CR>
autocmd filetype python :nnoremap <buffer> <C-LeftMouse> <LeftMouse>:call pymode#rope#goto_definition()<CR>


" using `Alt+{h,j,k,l}` to navigate between windows
nnoremap <A-j> <C-w>j
nnoremap <A-h> <C-w>h
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"""""""""""""""" Key Mapping """"""""""""""""



"""""""""""""""" Languages """"""""""""""""

"对c和c++,使用openmp时,输入#后不自动顶格
"au BufRead,BufNewFile *.c set cinkeys-=0#
"au BufRead,BufNewFile *.cpp set cinkeys-=0#

"Javascript
au BufRead,BufNewFile *.js set syntax=jquery
au BufRead,BufNewFile *.js set foldmethod=indent

"Python
autocmd filetype python setlocal et sta sw=4 sts=4
autocmd filetype python setlocal foldmethod=indent
set foldlevel=99
autocmd filetype python autocmd BufWritePre * Isort " sort imports

"Golang
autocmd BufWritePost *.go call CallGoimports()
function CallGoimports()
    !goimports -w %
    edit
    filetype detect
endfunction

"Ragel
au BufRead,BufNewFile *.rl set filetype=ragel

" Spell checking
autocmd filetype pandoc,text,gitcommit,rst setlocal spell spelllang=en_us,cjk

"Nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | set filetype=nginx | endif

" Scala
autocmd BufRead,BufNewFile *.sc set filetype=scala
autocmd filetype scala setlocal et sta sw=4 sts=4

"""""""""""""""" Languages """"""""""""""""



""""""""""""""""额外功能""""""""""""""""

"IDE
"调整cscope和ctags的兼容性
if has("cscope")
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        set csto=0
        set cst
        set csverb
endif

"为 c/cpp 文件生成tag
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

"单个文件编译
map <F5> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        if g:iswindows==1
            set makeprg=gcc\ -Wall\ -o\ %<.exe\ %
        else
            set makeprg=gcc\ -Wall\ -o\ %<\ %
        endif
    elseif &filetype=="cpp"
        if g:iswindows==1
            set makeprg=g++\ -o\ %<.exe\ %
        else
            set makeprg=g++\ -o\ %<\ %
        endif
        "elseif &filetype=="cs"
        "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
    endif
    if(g:iswindows==1)
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'.exe','g')
        let toexename=outfilename
    else
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
        let toexename=outfilename
    endif
    if filereadable(outfilename)
        if(g:iswindows==1)
            let outdeletedsuccess=delete(getcwd()."\\".outfilename)
        else
            let outdeletedsuccess=delete("./".outfilename)
        endif
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    execute "normal :"
    if filereadable(outfilename)
        if(g:iswindows==1)
            execute "!".toexename
        else
            execute "!./".toexename
        endif
    endif
    execute "copen"
endfunction
"进行make的设置
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>
function Do_make()
    set makeprg=make
    execute "silent make"
    execute "copen"
endfunction

""""""""""""""""额外功能""""""""""""""""



"""""""""""""""" Plugins """"""""""""""""

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion =  1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_auto_trigger = 0
" This option controls for which Vim filetypes should YCM be turned off.
" let g:ycm_filetype_blacklist = {
      " \ 'tagbar' : 1,
      " \ 'qf' : 1
      " \}
" This option controls for which Vim filetypes should the YCM semantic completion engine be turned off.
" let g:ycm_filetype_specific_completion_to_disable = {
      " \ 'gitcommit': 1
      " \}
if(g:iswindows==0)
    let g:ycm_rust_src_path = '/usr/local/src/rust/src'
endif

"enable emmet for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml,jinja EmmetInstall

"Gundo
map <leader>g :GundoToggle<CR>

"Indent Guides(对齐线)
let g:indent_guides_guide_size=1

"Jshint2
let jshint2_save = 1 "Lint JavaScript files after saving it
let jshint2_height = 12 "Set default height of error list
" jshint validation
"nnoremap <silent><F1> :JSHint<CR>
"inoremap <silent><F1> <C-O>:JSHint<CR>
"vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
"nnoremap <silent><F2> :lnext<CR>
"inoremap <silent><F2> <C-O>:lnext<CR>
"vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
"nnoremap <silent><F3> :lprevious<CR>
"inoremap <silent><F3> <C-O>:lprevious<CR>
"vnoremap <silent><F3> :lprevious<CR>

"NERD_commenter
"let loaded_nerd_comments=1 "关闭NERD_commenter
let NERDShutUp=1 "光标所在行上，按下一次ctrl+h是注释，再按下一次是取消注释
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
            \ 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' }
            \ }
"内建的指令
",cm 是多行注释，类似C++的/**/
",cu是取消注释

"tagbar
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width=28
let g:tagbar_autopreview=0
let g:tagbar_sort=0
"integrate with gotags
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
" Scala
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }
" Rust
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds'     : [
        \ 'T:types,type definitions',
        \ 'f:functions,function definitions',
        \ 'g:enum,enumeration names',
        \ 's:structure names',
        \ 'm:modules,module names',
        \ 'c:consts,static constants',
        \ 't:traits,traits',
        \ 'i:impls,trait implementations'
    \ ]
\ }
" MoonScript
let g:tagbar_type_moon = {
    \ 'ctagstype' : 'moonscript',
    \ 'kinds' : [
        \ 'v:variables',
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 's:static properties',
        \ 'p:properties'
    \ ]
\ }

" Airline
set laststatus=2
let g:airline_detect_modified=1
let g:airline_detect_paste=1

let g:airline_theme = 'powerlineish'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'

let g:airline#extensions#tagbar#enabled = 1 " tagbar integration
let g:airline#extensions#syntastic#enabled = 1 " syntastic integration

let g:tmuxline_preset = {
      \'b'    : ['#h', '#(whoami)', '#S'],
      \'cwin' : '#I: #W',
      \'y'    : ['%R', '%a', '%Y-%m-%d']}

"Jsbeautify
"map <C-f> :call JsBeautify()<CR>
autocmd FileType javascript,json noremap <buffer> <C-f> :call JsBeautify()<cr>
autocmd FileType html,xhtml,jinja noremap <buffer> <C-f> :call HtmlBeautify()<cr>
"for css or scss
autocmd FileType css noremap <buffer> <C-f> :call CSSBeautify()<cr>

"Powerline
"set guifont=PowerlineSymbols\ for\ Powerline
"set t_Co=256
"let g:Powerline_symbols = 'fancy'

""UltiSnips
"Handle all issues between YCM and UltiSnips via: http://stackoverflow.com/a/18685821/1436873
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" python-mode
"" pymode quickfix window setting
let g:pymode_quickfix_minheight = 2
"" Default code checkers
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe']
"" pymode-rope
"" Turn on autocompletion when typing a period
let g:pymode_rope_complete_on_dot = 0
" Set pylint options
let g:pymode_lint_options_pylint =
            \ {'disable': 'C0111',
            \  'no-docstring-rgx': '__.*',
            \  'docstring-min-length': 99999}
" Check code on every save
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0

" vimfiler
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_readonly_file_icon = '⭤'
" Edit file in new tab
let g:vimfiler_edit_action = 'tabopen'
" Edit files by double click
autocmd FileType vimfiler
            \ nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)

nmap <F9> :call ToggleVimFilerExplorer()<cr>
function! ToggleVimFilerExplorer()
    :VimFilerExplorer -status -parent -winwidth=25 -auto-cd
endfunction

"winmanager
"let g:winManagerWidth =25
"let g:AutoOpenWinManager =1
"let g:winManagerWindowLayout='NERDTree'
"let g:NERDTree_title='NERD Tree'
"function! NERDTree_Start()
    "exec 'NERDTree'
"endfunction
"function! NERDTree_IsValid()
    "return 1
"endfunction
"nmap <F9> <C-w>l:WMToggle<cr>

"ZoomWin
"nmap <leader>zw :ZoomWin<CR>

"Syntastic
let g:syntastic_check_on_open=0 " 自动检测
let g:syntastic_auto_loc_list = 1
autocmd FileType c,cpp let g:ycm_show_diagnostics_ui = 0  " Interaction with YouCompleteMe

" symbols via: https://coderwall.com/p/zneomg
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'

" passive + active_filetypes = whitelist
let g:syntastic_mode_map = {'mode': 'passive',
            \ 'active_filetypes': ['c', 'cpp', 'lua', 'sh', 'ruby', 'rust', 'go', 'html', 'racket', 'vala', 'zsh', 'coffee'],
            \ 'passive_filetypes': ['python', 'javascript']}
" let g:syntastic_stl_fromat = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} $%t]'"信息栏显示设定
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_sh_checkers = ['sh']
let g:syntastic_zsh_checkers = ['zsh']
let g:syntastic_racket_checkers = ['racket']
let g:syntastic_go_checkers = ['go', 'govet']
let g:syntastic_html_checkers = ['tidy', 'jshint']
let g:syntastic_coffee_checkers = ['coffee']
"let g:syntastic_python_checker = ['pep8']

" rainbow
let g:rainbow_active = 1

"""""""""""""""" Plugins """"""""""""""""
