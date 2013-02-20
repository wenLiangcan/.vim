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


"配色
colorscheme github_c


"When .vimrc/ .gvimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .gvimrc source ~/.gvimrc

set lines=30 columns=70"窗口大小
