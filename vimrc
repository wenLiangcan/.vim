set nocp
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

"""��ݼ��h��"""
"leader��Ϊ,
"�༭vim�����ļ� ,vv(gvimΪ ,vg
"���������ļ� ,ss(gvimΪ ,sg
"����tag�ļ� F12
"����Tagbar F3
"����winmanager F9
"�ر�winmanager ctrl + F9
"�鿴�����ַ����� ,ch
"һ������ F5
"make F6
"��Ӱ�Ȩ��Ϣ F4
"��ʾ/���ع����� F2
"�����۵� <space>
"��ʽ�� Javascript/HTML/CSS Ctrl + f
"easy motion�����ٶ�λ��<leader<leader>w /��λ��ָ���ַ� <leader>leader>f<char>

"""Ctrl + s to save 
"nmap <C-s> :w<CR>
"imap <C-s> <Esc>:w<CR>
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

"Shift + w to exit
nmap <S-w> :q<CR>
"���ٱ༭��ǰ�ļ�����·���µĸ��ļ� ,e
"next/previous buffer
nmap [b :bp<CR>
nmap ]b :bn<CR>
"Gundo
"<leader>g
"VirtaulEnv
"Deactivate the current virtualen <leader>pd
"List all virtualenvs <leader>pl
"To activate a virtualenv <leader>pa

"Set mapleader
let mapleader = ","

"�����ļ��༭
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


""""""""""""""""�����趨""""""""""""""""

if(has("win32") || has("win95") || has("win64") || has("win16")) "�ж���ǰ����ϵͳ����
    let g:iswindows=1
else
    let g:iswindows=0
endif
if(g:iswindows==1)
        behave mswin
endif
autocmd BufEnter * lcd %:p:h
set nocompatible "��Ҫvimģ��viģʽ���������ã�������кܶ಻���ݵ�����
filetype off
filetype plugin indent off
if(g:iswindows==0)
		set runtimepath+=/usr/share/go/misc/vim
endif
syntax on"�򿪸���
filetype indent on
filetype on
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
set tabstop=4 shiftwidth=4 expandtab "��һ��tab����4���ո�
"set nowrap "���Զ�����
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

"�ر�������ʾ
"set noerrorbells
"set novisualbell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

"set the menu and the message to English
set langmenu=en_US
let $LANG='en_US'

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

"���������
if(g:iswindows==1)
		set guifont=Bitstream_Vera_Sans_Mono_for_Po:h13:cANSI"��ס�ո����»��ߴ���Ŷ
		set gfw=��Բ:h13.5:cGB2312
endif
if(g:iswindows==0)
		set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 12
		"set gfw=YouYuan\ 11.5
		set gfw=Microsoft\ YaHei\ Mono\ 11.5
endif

"����Ĭ����ʾ���İ����ĵ�
if version >= 603
		set helplang=cn
endif

set nu"��ʾ�к�
set guitablabel=%N.%t "��tab�������

"��ɫ
"colorscheme twilight
set t_Co=256"�ն���ɫ��������
colorscheme solarized
"let g:solarized_termcolors=256
"let g:solarized_visibility = "high"
"if has('gui_running')
"    set background=light
"else
    set background=dark
"endif

"��Ctrl+Enter���س�������һ��tab
inoremap <C-Return> <CR><CR><C-o>k<Tab>

"Javascript
au BufRead,BufNewFile *.js set syntax=jquery
au BufRead,BufNewFile *.js set foldmethod=indent

"Jsbeautify
"map <C-f> :call JsBeautify()<CR>
autocmd FileType javascript noremap <buffer> <C-f> :call JsBeautify()<cr>
autocmd FileType html,xhtml noremap <buffer> <C-f> :call HtmlBeautify()<cr>
"for css or scss
autocmd FileType css noremap <buffer> <C-f> :call CSSBeautify()<cr> 

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

"��c��c++,ʹ��openmpʱ,����#���Զ�����
"au BufRead,BufNewFile *.c set cinkeys-=0#
"au BufRead,BufNewFile *.cpp set cinkeys-=0#

"Python
autocmd filetype python setlocal et sta sw=4 sts=4
autocmd filetype python setlocal foldmethod=indent
set foldlevel=99

"Golang
autocmd BufWritePost *.go call CallGoimports()
function CallGoimports()
    !goimports -w %
    edit
    filetype detect
endfunction

"enable emmet for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"Ragel
au BufRead,BufNewFile *.rl set filetype=ragel

""""""""""""""""�����趨""""""""""""""""






""""""""""""""""���⹦��""""""""""""""""

"���ٱ༭��ǰ�ļ�����·���µĸ��ļ�
if(g:iswindows==1)
        map <leader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
else
        map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
endif

"�ÿո�������ش����۵�
"set foldenable
"set foldmethod=indent
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

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

"IDE
"����cscope��ctags�ļ�����
if has("cscope")
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        set csto=0
        set cst
        set csverb
endif

"Ϊ c/cpp �ļ�����tag
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

""""""""""""""""���⹦��""""""""""""""""






""""""""""""""""����趨""""""""""""""""

"����Tlist������
"TlistUpdate���Ը���tags
"map <F3> :silent! Tlist<CR> "����F3�Ϳ��Ժ�����
"if (g:iswindows == 1)
		"let Tlist_Ctags_Cmd='ctags' "��Ϊ���Ƿ��ڻ�����������Կ���ֱ��ִ��
"else
		"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"endif
"let Tlist_Use_Right_Window=1 "1�ô�����ʾ���ұߣ�0�Ļ�������ʾ�����
"let Tlist_Show_One_File=0 "��taglist����ͬʱչʾ����ļ��ĺ����б������ֻ��1��������Ϊ1
"let Tlist_File_Fold_Auto_Close=1 "�ǵ�ǰ�ļ��������б��۵�����
"let Tlist_Exit_OnlyWindow=1 "��taglist�����һ���ָ��ʱ���Զ��Ƴ�vim
"let Tlist_Process_File_Always=0 "�Ƿ�һֱ����tags.1:����;0:����������һֱʵʱ����tags����Ϊû�б�Ҫ
"let Tlist_Inc_Winwidth=0

"Ctags.vim
let g:ctags_statusline=1
let generate_tags=1
let g:ctags_title=1

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

"ZoomWin
nmap <leader>zw :ZoomWin<CR>

"Gundo
map <leader>g :GundoToggle<CR>

"vim-virtualenv
map <leader>pd :VirtaulEnvDeactivate<CR>
map <leader>pl :VirtualEnvList<CR>
map <leader>pa :VirtualEnvActivate

"winmanager
"map <c-w><c-f> :FirstExplorerWindow<cr> 
"map <c-w><c-b> :BottomExplorerWindow<cr> 
"map <c-w><c-t> :WMToggle<cr>
let g:winManagerWidth =25
let g:AutoOpenWinManager =1
"let g:persistentBehaviour = 0"��winmanager�����һ���ָ��ʱ���Զ��˳�vim
"��winmanager���ɺϲ���ʾNERDTree��TagList 
"let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWindowLayout='NERDTree|BufExplorer'
let g:NERDTree_title='NERD Tree'
let bufExplorerMaxHeight=30
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
nmap <F9> :WMToggle<cr>:q<cr>
nmap <C-F9> :WMToggle<cr>

"omnicppcomplete
set completeopt=menu "����ʾ��ϸ��Ϣ
let OmniCpp_ClobalScopeSearch=1
let OmniCpp_NamespaceSearch=2   " 0 ,  1 or 2  
let OmniCpp_DisplayMode=1  
let OmniCpp_ShowScopeInAbbr=0  
let OmniCpp_ShowPrototypeInAbbr=1  
let OmniCpp_ShowAccess=1  
let OmniCpp_MayCompleteDot=1  
let OmniCpp_MayCompleteArrow=1  
let OmniCpp_MayCompleteScope=1
let OmniCpp_SelectFirstItem=2

"delimitMate
au FileType mail let b:delimitMate_autoclose=0

"Syntastic
"let g:syntastic_check_on_open=1"�Զ����
"let g:syntastic_mode_map = {'mode': 'passive',
"						\ 'active_filetypes': ['python', 'c', 'cpp', 'tcl', 'lua', 'sh']}"passive + active_filetypes = whitelist
"let g:syntastic_stl_fromat = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} $%t]'"��Ϣ����ʾ�趨
"let g:syntastic_python_checker = ['pep8']
"let g:syntastic_c_checker = ['gcc']
"let g:syntastic_cpp_checker = ['gcc']

"NERD_commenter
"let loaded_nerd_comments=1 "�ر�NERD_commenter
let NERDShutUp=1 "����������ϣ�����һ��ctrl+h��ע�ͣ��ٰ���һ����ȡ��ע��
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
let g:Powerline_symbols = 'fancy'
set laststatus=2

"VIMIM
let g:vimim_map='c-space'"�������뷨
let g:vimim_punctuation=0"��ʹ�����ı��
"let g:vimim_toggle='pinyin,google,sogou,baidu'
let g:vimim_shuangpin='flypy'"˫ƴ����ΪС��
"let g:vimim_cloud='qq.shuangpin.flypy'"������
let g:vimim_cloud=0
let g:vimim_mycloud=0

"latex-suite
filetype plugin on
if(g:iswindows==1)
        set shellslash
endif
set grepprg=grep\ -nH\ $*

"AuthorInfo
let g:vimrc_author='wenLiangcan'
let g:vimrc_email='wenLiangcan@gmail.com'
"let g:vimrc_homepage=''
nmap <F4> :AuthorInfoDetect<cr>

""""""""""""""""����趨""""""""""""""""
