set nocp
call pathogen#infect()
call pathogen#helptags()

"""快捷键説明"""
"leader键为,
"编辑vim配置文件 ,ee(gvim为 ,eg
"重载配置文件 ,ss(gvim为 ,sg
"生成tag文件 F12
"呼出Tlist F3
"查看多行字符对齐 ,ch
"一键编译 F5
"make F6
"添加版权信息 F4
"显示/隐藏工具栏 F2
"代码折叠 <space>
"整理js <leader>ff
"easy motion（快速定位）<leader<leader>w /定位到指定字符 <leader>leader>f<char>

if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif
autocmd BufEnter * lcd %:p:h
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
syntax on"打开高亮
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
set tabstop=4 "让一个tab等于4个空格
set vb t_vb=
set nowrap "不自动换行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
if(g:iswindows==1) "允许鼠标的使用
    "防止linux终端下无法拷贝
    if has('mouse')
        set mouse=a
    endif
    au GUIEnter * simalt ~x
endif
"字体的设置
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI "记住空格用下划线代替哦
set gfw=幼圆:h10.5:cGB2312

"配色
"colorscheme twilight
"set t_Co=256"终端配色兼容设置
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

au BufRead,BufNewFile *.js set syntax=jquery

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

"Set mapleader
let mapleader = ","
"Fast reloading of the .vimrc/ .gvimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
map <silent> <leader>sg :source ~/.gvimrc<cr>
"Fast editing of .vimrc/ .gvimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
map <silent> <leader>eg :e ~/.gvimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

set nu"显示行号
"用空格键来开关代码折叠
"set foldenable
"set foldmethod=indent
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"""""""""""Gvim
"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


winpos 285 100"窗口启动位置
"colo peachpuff"本色方案
"""""""""""Gvim

"IDE
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

"进行Tlist的设置
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "1让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

"omnicppcomplete
set completeopt=menu "不显示详细信息

"NERD_commenter
"let NERDShutUp=1 "光标所在行上，按下一次ctrl+h是注释，再按下一次是取消注释
		 "内建的指令 
		 ",cm 是多行注释，类似C++的/**/
		 ",cu是取消注释
		 
"DoxygenToolkit
"map fg : Dox<cr>
"let g:DoxygenToolkit_authorName="wenLiangcan"
"let g:DoxygenToolkit_licenseTag="My own license\<enter>"
"let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
"let g:DoxygenToolkit_briefTag_pre = "@brief\t"
"let g:DoxygenToolkit_paramTag_pre = "@param\t"
"let g:DoxygenToolkit_returnTag = "@return\t"
"let g:DoxygenToolkit_briefTag_funcName = "no"
"let g:DoxygenToolkit_maxFunctionProtoLines = 30

"Indent Guides(对齐线)
let g:indent_guides_guide_size=1

"powerline
"set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
"let g:Powerline_symbols = 'fancy'
set laststatus=2


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



"进行版权声明的设置
"添加或更新头
"map <F4> :call TitleDet()<cr>'s
"function AddTitle()
"    call append(0,"/*=============================================================================")
"    call append(1,"#")
"    call append(2,"# Author: wenLiangcan - wenLiangcan@gmail.com")
"    call append(3,"#")
"    call append(4,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
"    call append(5,"#")
"    call append(6,"# Filename: ".expand("%:t"))
"    call append(7,"#")
"    call append(8,"# Description: ")
"    call append(9,"#")
"    call append(10,"=============================================================================*/")
"    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"endf
""更新最近修改时间和文件名
"function UpdateTitle()
"    normal m'
"    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
"    normal ''
"    normal mk
"    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
"    execute "noh"
"    normal 'k
"    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
"endfunction
""判断前10行代码里面，是否有Last modified这个单词，
""如果没有的话，代表没有添加过作者信息，需要新添加；
""如果有的话，那么只需要更新即可
"function TitleDet()
"    let n=1
"    "默认为添加
"    while n < 10
"        let line = getline(n)
"        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
"            call UpdateTitle()
"            return
"        endif
"        let n = n + 1
"    endwhile
"    call AddTitle()
"endfunction
""""""""""""""""一上命令现由AutorInfo替代，可支持更多语言
let g:vimrc_author='wenLiangcan'
let g:vimrc_email='wenLiangcan@gmail.com'
"let g:vimrc_homepage=''
nmap <F4> :AuthorInfoDetect<cr>
