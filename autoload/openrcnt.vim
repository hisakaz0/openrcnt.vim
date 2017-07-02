" Author:  hisakazu <cantabilehisa@gmail.com>
" License: MIT License

let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_openrcnt")
  finish
endif
let g:loaded_openrcnt = 1


if !exists(":RecentList")
  command RecentList call <SID>Filelist()
endif


" When open Old files list, following variable 'g:openrcnt_newbuf_cmd'
" is used. The variable only alloed in the list 's:newbuf_cmd_list'.
let g:openrcnt_opencmd_rcntlist = "new"
let g:openrcnt_opencmd_oldfile  = "new"

let s:bufname = "__RECENT__"


function! s:Filelist()
  if bufexists(s:bufname) | return | endif
  execute printf("%s %s", g:openrcnt_opencmd_rcntlist, s:bufname)
  silent put =v:oldfiles
  silent 1,1delete
  silent setlocal bufhidden=wipe
  silent setlocal buftype=nofile
  silent setlocal noswapfile
  silent setlocal nomodifiable
endfunction

function! s:Editfile()
  let s:file = getline('.')
  execute printf("%s %s", g:openrcnt_opencmd_oldfile, s:file)
endfunction

function! s:Setmap()
  if !hasmapto('<Plug>OpenrcntEditfile')
    nmap <buffer> l  <Plug>OpenrcntEditfile
  endif
endfunction


noremap <unique> <script> <Plug>OpenrcntEditfile  :call <SID>Editfile()<CR>


autocmd BufEnter __RECENT__  call s:Setmap()


" restore-cpo
let &cpo = s:save_cpo
unlet s:save_cpo
