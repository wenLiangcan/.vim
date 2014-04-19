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
"easy motion（快速定位）<leader<leader>w /定位到指定字符 <leader>leader>f<char>
"全屏 F11
"降低窗口透明度 Shift + t 
"加大窗口透明度 Shift + y 
"切换Vim是否总在最前面显示 Shift + r 

"配色
"colorscheme github_c

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

set lines=30 columns=86"窗口大小
set guioptions-=r "隐藏右侧滚动条
set guioptions-=L "隐藏垂直分割窗口下的左侧滚动条

" {{{ Win平台下窗口全屏组件 gvimfullscreen.dll
" F11 全屏切换
" Shift + t 降低窗口透明度
" Shift + y 加大窗口透明度
" Shift + r 切换Vim是否总在最前面显示
" Vim启动的时候自动使用当前颜色的背景色以去除Vim的白色边框
if has('gui_running') && has('gui_win32') && has('libcall')
    let g:MyVimLib = 'gvimfullscreen.dll'
    function! ToggleFullScreen()
        call libcall(g:MyVimLib, 'ToggleFullScreen', 1)
    endfunction

    let g:VimAlpha = 245
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 180
            let g:VimAlpha = 180
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    endfunction

    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    endfunction
    "映射 F11 切换全屏vim
    map <F11> <esc>:call ToggleFullScreen()<cr>
    "切换Vim是否在最前面显示
    nmap <s-r> <esc>:call SwitchVimTopMostMode()<cr>
    "增加Vim窗体的不透明度
    nmap <s-t> <esc>:call SetAlpha(10)<cr>
    "增加Vim窗体的透明度
    nmap <s-y> <esc>:call SetAlpha(-10)<cr>
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
endif
" }}}
