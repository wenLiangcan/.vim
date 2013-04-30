set nocp
call pathogen#infect()
call pathogen#helptags()

"""��ݼ��h��"""
"leader��Ϊ,
"�༭vim�����ļ� ,ee(gvimΪ ,eg
"���������ļ� ,ss(gvimΪ ,sg
"����tag�ļ� F12
"����Tlist F3
"�鿴�����ַ����� ,ch
"һ������ F5
"make F6
"��Ӱ�Ȩ��Ϣ F4
"��ʾ/���ع����� F2
"�����۵� <space>
"����js <leader>ff
"easy motion�����ٶ�λ��<leader<leader>w /��λ��ָ���ַ� <leader>leader>f<char>

if(has("win32") || has("win95") || has("win64") || has("win16")) "�ж���ǰ����ϵͳ����
    let g:iswindows=1
else
    let g:iswindows=0
endif
autocmd BufEnter * lcd %:p:h
set nocompatible "��Ҫvimģ��viģʽ���������ã�������кܶ಻���ݵ�����
syntax on"�򿪸���
if has("autocmd")
    filetype plugin indent on "�����ļ���������
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    "������������Ӧ����cindent���ٷ�˵autoindent����֧�ָ����ļ�������������Ч�����ֻ֧��C/C++��cindentЧ�����һ�㣬�����߲�û�п�����
    set autoindent " always set autoindenting on 
endif " has("autocmd")
set tabstop=4 "��һ��tab����4���ո�
set vb t_vb=
set nowrap "���Զ�����
set hlsearch "������ʾ���
set incsearch "������Ҫ����������ʱ��vim��ʵʱƥ��
set backspace=indent,eol,start whichwrap+=<,>,[,] "�����˸����ʹ��
if(g:iswindows==1) "��������ʹ��
    "��ֹlinux�ն����޷�����
    if has('mouse')
        set mouse=a
    endif
    au GUIEnter * simalt ~x
endif
"���������
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI "��ס�ո����»��ߴ���Ŷ
set gfw=��Բ:h10.5:cGB2312

"��ɫ
"colorscheme twilight
"set t_Co=256"�ն���ɫ��������
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

au BufRead,BufNewFile *.js set syntax=jquery

"���ı���
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

set nu"��ʾ�к�
"�ÿո�������ش����۵�
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


winpos 285 100"��������λ��
"colo peachpuff"��ɫ����
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

"����Tlist������
"TlistUpdate���Ը���tags
map <F3> :silent! Tlist<CR> "����F3�Ϳ��Ժ�����
let Tlist_Ctags_Cmd='ctags' "��Ϊ���Ƿ��ڻ�����������Կ���ֱ��ִ��
let Tlist_Use_Right_Window=0 "1�ô�����ʾ���ұߣ�0�Ļ�������ʾ�����
let Tlist_Show_One_File=0 "��taglist����ͬʱչʾ����ļ��ĺ����б������ֻ��1��������Ϊ1
let Tlist_File_Fold_Auto_Close=1 "�ǵ�ǰ�ļ��������б��۵�����
let Tlist_Exit_OnlyWindow=1 "��taglist�����һ���ָ��ʱ���Զ��Ƴ�vim
let Tlist_Process_File_Always=0 "�Ƿ�һֱ����tags.1:����;0:����������һֱʵʱ����tags����Ϊû�б�Ҫ
let Tlist_Inc_Winwidth=0

"omnicppcomplete
set completeopt=menu "����ʾ��ϸ��Ϣ

"NERD_commenter
"let NERDShutUp=1 "����������ϣ�����һ��ctrl+h��ע�ͣ��ٰ���һ����ȡ��ע��
		 "�ڽ���ָ�� 
		 ",cm �Ƕ���ע�ͣ�����C++��/**/
		 ",cu��ȡ��ע��
		 
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

"Indent Guides(������)
let g:indent_guides_guide_size=1

"powerline
"set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
"let g:Powerline_symbols = 'fancy'
set laststatus=2


"�鿴һ��ĳ���е��ַ��Ƿ���ͬһ����
map ,ch :call SetColorColumn()<CR>"����,ch �Ϳ��Խ���ǰ����µ��и������ٰ���һ�Σ�ȡ�����������ҿ���ͬʱ���и���
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction


"�����ļ�����
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
"����make������
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>
function Do_make()
    set makeprg=make
    execute "silent make"
    execute "copen"
endfunction



"���а�Ȩ����������
"��ӻ����ͷ
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
""��������޸�ʱ����ļ���
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
""�ж�ǰ10�д������棬�Ƿ���Last modified������ʣ�
""���û�еĻ�������û����ӹ�������Ϣ����Ҫ����ӣ�
""����еĻ�����ôֻ��Ҫ���¼���
"function TitleDet()
"    let n=1
"    "Ĭ��Ϊ���
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
""""""""""""""""һ����������AutorInfo�������֧�ָ�������
let g:vimrc_author='wenLiangcan'
let g:vimrc_email='wenLiangcan@gmail.com'
"let g:vimrc_homepage=''
nmap <F4> :AuthorInfoDetect<cr>
