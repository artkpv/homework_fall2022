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
badd +279 cs285/infrastructure/rl_trainer.py
badd +8 cs285/agents/base_agent.py
badd +17 cs285/agents/bc_agent.py
badd +62 cs285/infrastructure/replay_buffer.py
badd +5 cs285/scripts/run_hw1.py
badd +105 cs285/policies/loaded_gaussian_policy.py
badd +238 cs285/scripts/run_hw1.ipynb
badd +61 cs285/infrastructure/utils.py
badd +59 cs285/infrastructure/logger.py
badd +124 cs285/policies/MLP_policy.py
badd +56 cs285/infrastructure/pytorch_util.py
badd +2 cs285/policies/base_policy.py
badd +518 ~/.local/share/virtualenvs/hw1-i6Zxy2r0/lib/python3.10/site-packages/torch/nn/modules/loss.py
argglobal
%argdel
$argadd setup.py
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit cs285/infrastructure/rl_trainer.py
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
balt cs285/infrastructure/logger.py
let s:l = 279 - ((41 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 279
normal! 041|
tabnext
edit cs285/policies/MLP_policy.py
argglobal
balt ~/.local/share/virtualenvs/hw1-i6Zxy2r0/lib/python3.10/site-packages/torch/nn/modules/loss.py
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext 2
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
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
