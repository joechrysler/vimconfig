"=================================================================================
" Configs from Coming Home to Vim
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#why-i-switched-to-textmate
"=================================================================================
	" Ignore compatibility with vanilla VI (there was some good reason for
	" this but I don't remember what it was)
	set nocompatible
	set modelines=0
	" Always use utf-8 when saving files
	set encoding=utf-8
	set scrolloff=3
	" Automatically indent files that vim understands
	set autoindent
	" Always show which editing mode you're in
	set showmode
	" Show the current command characters @ screen bottom-right
	set showcmd
	" Wildmenu bits for the gVim gui...not sure what they do
	set wildmenu
	set wildmode=list:longest
	" If you're into self-mutilation, uncomment the next line.  It makes the
	" screen blink whenever an old workstation would have beeped the piezo
	" speaker...especially when you overscroll up or down.
	" set visualbell
	"set cursorline
	set ttyfast
	" Make sure the cursor position is always shown @ screen bottom-right
	set ruler
	" Make backspace do something more sensible than default
	set backspace=indent,eol,start
	set laststatus=2
	" The next line is only useful if you have linenumbers turned on, and then
	" only if you don't mind the line numbers being relative to the current
	" line.
	"set relativenumber
	" Use an undo file so you can undo/redo changes even if Vim crashes or you
	" open up the file on another workstation
	set undofile
	" Use regular Perl style regexp instead of Vim's custom kind
	nnoremap / /\v
	vnoremap / /\v
	"set gdedefault
	" Highlight all matches when searching for text
	set showmatch
	" hit comma space to get rid of the highligting when you're done searching
	"nnoremap <leader><space> :noh<CR>
	nnoremap <tab> %
	vnoremap <tab> %
	" Wrap text at column 79 to avoid writing "too long" lines...because
	" apparently widescreen hasn't really taken off...riiight.
	set wrap
	set textwidth=79
	set formatoptions=qrn1
	"set colorcolumn=85
	" Remap the blanking F1 key to escape so you don't constantly hit it when
	" switching modes
	inoremap <F1> <ESC>
	nnoremap <F1> <ESC>
	vnoremap <F1> <ESC>
	" Write files when vim loses focus (I think this only works in gVim)
	au FocusLost * :wa
	" Remove trailing whitespace with comma W
	nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
	"nnoremap <leader>a :Ack
	nnoremap <leader>ft Vatzf
	nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
	nnoremap <leader>v V`]
	nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
	inoremap jj <ESC>
	"nnoremap <leader>w <C-w>v<C-w>l


"Highlight syntax
syntax on

" Use a mouse to select text in the terminal
set mouse=a

"Automatically indent files
"set cindent

"Define Tab widths
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


" Syntax Highlighting for golang files
au BufRead,BufNewFile *.go set filetype=go
au! Syntax go source $HOME/go/misc/vim/go.vim

filetype plugin on

set ignorecase		"Ignore case when searching
set smartcase		"Search case-sensitively if the user enters uppercase letters
set incsearch		"Search incrementally
set hlsearch		"Highlight search things

" Set leader keyto
let mapleader = ","

" Color Scheme
colorscheme delek
map <leader>de :colorscheme delek<CR>
map <leader>na :colorscheme navajo<CR>

" Git keyboard shortcuts
" These are just blind git push remote commands.  If you don't have the remotes
" added, in the git repo, they fail ungracefully.
map <leader>gC  :!git commit -a<CR>
map <leader>gpa :!git push web;git push hub;git push tester;git push gitter<CR>
map <leader>gpo :!git push<CR>
map <leader>gpw :!git push web<CR>
map <leader>gph :!git push hub<CR>
map <leader>gpH :!git push heroku<CR>
map <leader>gpt :!git push tester<CR>
map <leader>gpg :!git push gitter<CR>
map <leader>gp3 :!git push box3<CR>

" Mapped shortcuts to quickly move around split windows with
" control+capital_letter
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Shortcut to quickly fold a function while sitting on a line that ends in {
map <leader>fo $zfa}

" Shortcut to rapidly show/hide special chars like tab and newline
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=999

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>
map <leader>E :vert sp .<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
au FileType python set nocindent
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMDIFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>u :diffupdate<cr>
nnoremap <Leader>g :diffget<cr>
nnoremap <Leader>p :diffput<cr>

" Ruby folding bit
" FoldSearch-based folding.
" Copyright (C) 2005 Mauricio Fernandez <mfp@acm.org>
" Current version: http://eigenclass.org/hiki.rb?Usable+Ruby+folding+for+Vim
"
" Add this to your .vimrc and fold with :R. The default fold expression will
" work with Ruby scripts; you can specify where folds start with
" let b:foldsearchexpr = 'myexpression'
" e.g.
"  let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
" or so for Java.
" One way to have this buffer-local variable set is
" au Filetype java let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
"
" It is possible to have comments above a method/class/etc be included in the
" fold, by setting b:foldsearchprefix. All the lines above the detected fold
" matching b:foldsearchprefix will be included in said fold.
" For instance, for Ruby code:
"   let b:foldsearchprefix = '\v^\s*(#.*)?$'
" which can be automated with
"   au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'
"
" Changelog:
" 2005-12-12  1.1  use b:foldsearchprefix to prepend comments to a fold.

"{{{ set s:sid

map <SID>xx <SID>xx
let s:sid = maparg("<SID>xx")
unmap <SID>xx
let s:sid = substitute(s:sid, 'xx', '', '')

"{{{ FoldText
function! s:Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

execute 'set foldtext=' .  s:sid . 'MyNewFoldText()'
function! <SID>MyNewFoldText()
  let linenum = v:foldstart
  while linenum <= v:foldend
      let line = getline(linenum)
      if !exists("b:foldsearchprefix") || match(line, b:foldsearchprefix) == -1
    break
      else
    let linenum = linenum + 1
      endif
  endwhile
  if exists("b:foldsearchprefix") && match(line, b:foldsearchprefix) != -1
      " all lines matched the prefix regexp
      let line = getline(v:foldstart)
  endif
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let diff = v:foldend - v:foldstart + 1
  return  '+ [' . s:Num2S(diff,4) . ']' . sub
endfunction

"{{{~foldsearch adapted from t77: Fold on search result (Fs <pattern>)
"Fs pattern Fold search
"Vimtip put to good use by Ralph Amissah zxy@irc.freenode.net
"Modified by Mauricio Fernandez <mfp@acm.org>
function! Foldsearch(search)
  setlocal fdm=manual
  let origlineno = line(".")
  normal zE
  normal G$
  let folded = 0     "flag to set when a fold is found
  let flags = "w"    "allow wrapping in the search
  let line1 =  0     "set marker for beginning of fold
  if a:search == ""
      if exists("b:foldsearchexpr")
    let searchre = b:foldsearchexpr
      else
    "Default value, suitable for Ruby scripts
    "\(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
    let searchre = '\v(^\s*(def|class|module|attr_reader|attr_accessor|alias_method)\s' . 
                 \ '|^\s*\w+attr_(reader|accessor)\s|^\s*[#%"0-9]{0,4}\s*\{(\{\{|!!))' .
                 \ '|^\s*[A-Z]\w+\s*\='
    let b:foldsearchexpr = searchre
      endif
  else
      let searchre = a:search
  endif
  while search(searchre, flags) > 0
    let  line2 = line(".")
    while line2 - 1 >= line1 && line2 - 1 > 0 "sanity check
       let prevline = getline(line2 - 1)
       if exists("b:foldsearchprefix") && (match(prevline, b:foldsearchprefix) != -1)
           let line2 = line2 - 1
       else
           break
       endif
    endwhile
    if (line2 -1 >= line1)
      execute ":" . line1 . "," . (line2-1) . "fold"
      let folded = 1       "at least one fold has been found
    endif
    let line1 = line2     "update marker
    let flags = "W"       "turn off wrapping
  endwhile
  normal $G
  let  line2 = line(".")
  if (line2  >= line1 && folded == 1)
    execute ":". line1 . "," . line2 . "fold"
  endif
  execute "normal " . origlineno . "G"
endfunction

"{{{~folds Fold Patterns
" Command is executed as ':Fs pattern'"
command! -nargs=? -complete=command Fs call Foldsearch(<q-args>)
command! -nargs=? -complete=command Fold call Foldsearch(<q-args>)
"command! R Fs \(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
command! R Fs 
