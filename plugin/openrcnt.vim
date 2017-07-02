" Author:  hisakazu <cantabilehisa@gmail.com>
" License: MIT License

let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_openrcnt")
  finish
endif
let g:loaded_openrcnt = 1


if !exists(":RecentList")
  command RecentList call openrcnt#filelist()
endif


" When open Old files list, following variable 'g:openrcnt_newbuf_cmd'
" is used. The variable only alloed in the list 's:newbuf_cmd_list'.
let g:openrcnt_opencmd_rcntlist = "new"
let g:openrcnt_opencmd_oldfile  = "new"


autocmd BufEnter __RECENT__  call openrcnt#setmap()

" restore-cpo
let &cpo = s:save_cpo
unlet s:save_cpo
