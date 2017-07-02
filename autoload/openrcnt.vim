" Author:  hisakazu <cantabilehisa@gmail.com>
" License: MIT License

function! openrcnt#filelist()
  let bufname = "__RECENT__"
  if bufexists(bufname) | return | endif
  execute printf("%s %s", g:openrcnt_opencmd_rcntlist, bufname)
  silent put =v:oldfiles
  silent 1,1delete
  silent setlocal bufhidden=wipe
  silent setlocal buftype=nofile
  silent setlocal noswapfile
  silent setlocal nomodifiable
endfunction

function! openrcnt#editfile()
  let file = getline('.')
  execute printf("%s %s", g:openrcnt_opencmd_oldfile, file)
endfunction

function! openrcnt#setmap()
  if !hasmapto('openrcnt#editfile')
    nmap <buffer> l  :call openrcnt#editfile()<CR>
  endif
endfunction
