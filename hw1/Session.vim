let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/mydir/dev/rl_berkeley_cs285/hw1
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +4 setup.py
badd +269 cs285/infrastructure/rl_trainer.py
badd +8 cs285/agents/base_agent.py
badd +6 cs285/agents/bc_agent.py
badd +1 cs285/infrastructure/replay_buffer.py
badd +65 cs285/scripts/run_hw1.py
badd +21 cs285/policies/loaded_gaussian_policy.py
badd +73 cs285/infrastructure/utils.py
badd +17 cs285/infrastructure/logger.py
badd +114 cs285/policies/MLP_policy.py
argglobal
%argdel
$argadd setup.py
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit cs285/scripts/run_hw1.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt cs285/infrastructure/rl_trainer.py
let s:l = 70 - ((23 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 70
normal! 028|
tabnext
edit cs285/infrastructure/rl_trainer.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt cs285/infrastructure/utils.py
let s:l = 174 - ((20 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 174
normal! 049|
wincmd w
argglobal
if bufexists(fnamemodify("cs285/infrastructure/rl_trainer.py", ":p")) | buffer cs285/infrastructure/rl_trainer.py | else | edit cs285/infrastructure/rl_trainer.py | endif
if &buftype ==# 'terminal'
  silent file cs285/infrastructure/rl_trainer.py
endif
balt cs285/infrastructure/utils.py
let s:l = 33 - ((27 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 016|
wincmd w
wincmd =
tabnext
edit cs285/infrastructure/utils.py
argglobal
balt cs285/scripts/run_hw1.py
let s:l = 62 - ((28 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 62
normal! 044|
tabnext
edit cs285/agents/bc_agent.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
let s:l = 37 - ((36 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
normal! 016|
wincmd w
argglobal
if bufexists(fnamemodify("cs285/infrastructure/replay_buffer.py", ":p")) | buffer cs285/infrastructure/replay_buffer.py | else | edit cs285/infrastructure/replay_buffer.py | endif
if &buftype ==# 'terminal'
  silent file cs285/infrastructure/replay_buffer.py
endif
balt cs285/agents/bc_agent.py
let s:l = 78 - ((30 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 78
normal! 09|
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
