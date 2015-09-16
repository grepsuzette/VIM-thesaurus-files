function! MultiWordThesaurus()
  " if a thesaurus is already open, abort.
  if pumvisible() || &thesaurus == ""
    return 0
  endif

  " mark the cursor position
  silent exec "normal! mt"

  " take a window of 6 words
  let i = 6
  while i > 0
    " yank window and convert spaces to underscores
    silent exec "normal! `t" . i . "B\"tyv`t"
    if @t == ""
      " nothing yanked. abort.
      let i = 0
    else
      let to_underscore = substitute(@t, " ", "_", "g")
      silent exec "silent! 1vimgrep /^" . to_underscore . ",/j " . &thesaurus
      if len(getqflist()) > 0
        " found an entry in the thesaurus: convert spaces to underscores
        " in the buffer and exit
        silent exec "normal! cv`t" . to_underscore 
        let i = 0
      else
        " not yet found. iterate further
        let i -= 1
      endif
    endif
  endwhile
  
  silent exec "normal! `t"
endfunction!

inoremap <C-x><C-t> <Esc>:call MultiWordThesaurus()<CR>a<C-x><C-t>

inoremap <expr> <Esc>   pumvisible() ? "\<C-e>\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta"  : "\<Esc>"
inoremap <expr> <C-e>   pumvisible() ? "\<C-e>\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta"  : "\<C-e>"
inoremap <expr> <C-y>   pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta"  : "\<C-y>"
inoremap <expr> <space> pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta " : "\<space>"
inoremap <expr> .       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta." : "."
inoremap <expr> ,       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta," : ","
inoremap <expr> ?       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta?" : "?"
inoremap <expr> !       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta!" : "!"
inoremap <expr> -       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta-" : "-"
inoremap <expr> _       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta_" : "_"
inoremap <expr> :       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta:" : ":"
inoremap <expr> ;       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta;" : ";"
inoremap <expr> )       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta)" : ")"
inoremap <expr> ]       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta]" : "]"
inoremap <expr> }       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta}" : "}"
inoremap <expr> >       pumvisible() ?       "\<Esc>mt\<C-v>iW:s/\\%V_/ /ge\<CR>`ta>" : ">"

