filetype plugin on
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
"let Tlist_Right_window = 1
let Tlist_Lift_window = 1
syntax on
set nu
set cindent
set ruler
set tabstop=4
set shiftwidth=4
set nobackup
set autochdir
set nowrapscan
set incsearch
set hlsearch
set history=1000
set t_Co=256
set nocp
nnoremap <silent><F7> :TlistToggle<CR>
nnoremap <silent><F8> :nohlsearch<CR>
nnoremap <silent><F2> :ts<CR>
nnoremap <silent><F3> :set mouse=a<CR>
nnoremap <silent><F4> :set mouse= <CR>
"set tags+=/home/shaoqi/code/2.dsda/linux/modules/tags
"set tags+=/home/shaoqi/code/dsda/linux/modules/tags
"set tags =/home/shaoqi/code/dsda/linux/kernel/tags
"set tags+=/home/shaoqi/code/dsda/vendor/intel/tags
"set tags+=/home/shaoqi/code/4.sofia/hardware/imc/tags
set tags+=/home/shaoqi/code/4.sofia/hardware/tags
set tags+=/home/shaoqi/code/5.sofia/linux-3.10/tags
"set tags+=/home/shaoqi/code/2.dsda/vendor/intel/tags
autocmd Insertleave * se nocul
autocmd InsertEnter * se cul
set cursorline
set magic
set autowrite
set noeb
set vb t_vb= 
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn
colorscheme desert
set ts=4
set expandtab
%retab

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"cscope  add /home/denglietao/work/cscope.out
cscope add /home/zhangshaoqi/dsds/linux/kernel/cscope.out
"set tags=$WORKDIR/rapid_ril/tags,$WORKDIR/mmgr/tags;
"set path=~/work/my_cr8000/trunk/src/**/*
set path=~/work/l_cr8000_brn_er/brn_er/src/**/*
set tags=/home/ltdeng/work/l_cr8000_brn_er/brn_er/tags
"set tags=/home/ltdeng/work/my_cr8000/trunk/tags
set tags=/home/ltdeng/work/l_cr8000_brn_er/brn_er/tags
set cscopequickfix=s-,c-,d-,i-,t-,e-
set wrap
"set textwidth=65
"set list
noremap <F12> :set mouse=a<CR> 
noremap <F11> :set mouse=<CR> 
let Tlist_Ctags_Cmd = '/home/ltdeng/bin/ctags'
"set paste
set backspace=eol,start,indent
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set clipboard+=unnamed

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>
" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>
" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>
" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>
"set fdm=indent
"set autoindent
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"let g:SuperTabDefaultCompletionType="context"   



" save last session

au VimLeave * mks! ~/Session.vim
if expand("%")==""
    if(expand("~/Session.vim")==findfile("~/Session.vim"))
             silent :source ~/Session.vim
    endif
endif 

function! UPDATE_TAGS()
  let _f_ = expand("%:p")
  let _cmd_ = '"/home/ltdeng/bin/ctags -a -f /dvr/tags --c++-kinds=+p --fields=+iaS --extra=+q " ' . '"' . _f_ . '"'
  let _resp = system(_cmd_)
  unlet _cmd_
  unlet _f_
  unlet _resp
endfunction
autocmd BufWrite *.cpp,*.h,*.c call UPDATE_TAGS()
