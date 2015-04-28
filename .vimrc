" Configuration file for vim: some useful features

" Puts some color when you code
syntax on

" Adapts the colors used to make them visible on a dark background
set background=dark

" Displays line numbers
set number

" Automatically indent when CRLF
set autoindent

" Allows you to copy directly into the clipboard via the command "+y
" You must first check in `vim --version` that you've got +xterm_clipboard
" If not, install vim-gnome, it should work
set clipboard=unnamed

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Sets softtabstop tabstop and shiftwidth to 4
" Be careful because then you cannot edit Makefile for instance
" TODO: adapt to automatically detect what kind of file is edited
"		and change these values accordingly
let &l:sts = 4
let &l:ts = 4
let &l:sw = 4

" Sets the terminal background and foreground color
" highlight Normal ctermbg=darkgrey ctermfg=grey

" To create new lines without going into insert mode
nmap <C-K> O<Esc>
nmap <C-j> o<Esc>

