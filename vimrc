set nocompatible
set encoding=utf-8

" set for gui vim
" set lines=45 
" set columns=120 
" set font in linux set guifont=Monospace\ 14
" set font in windows
" set guifont=Consolas:h12

" for gvim
" set guioptions-=T  
" set guioptions-=m  
" colorscheme murphy 

" c coding indent, turn off when use python 
set ci

syntax on
set nu
set autoindent
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nobackup
set showcmd
set showmode 
set showmatch
filetype on
filetype plugin on 
filetype indent on

" insert # as comment
map <C-I> I# <ESC>

map <silent> <F5> :call Compile()<CR>
function! Compile()
	exec "w"

	if &filetype == "python"
		exec "!python2.7 %"
	endif

	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!g++ % -o test"
		exec  "!./test"
	elseif &filetype == 'cpp'
		exec "!g++ % -o test"
		exec "!./test"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		exec "!bash %"
	endif
endfunc


" Python default settings
" autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd

" when save python file, then delete redundant space
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

" when vimrc changed, thend auto load  with windows
"autocmd! bufwritepost _vimrc source %
" when vimrc changed, thend auto load  with linux
autocmd! bufwritepost .vimrc source %

" history account
set history=2000

let mapleader=","

autocmd FileType python set expandtab

set clipboard=unnamed

set laststatus=2
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly?

function! HighlightSearch()
	if &hls
		return 'H'
	else
		return ''
	endif
endfunction


" Use spaces instead of tabs
set expandtab

" Turn off expand tab in makefile
autocmd FileType make setlocal noexpandtab

" Indent 2 for html / css
autocmd BufNewFile,BufRead *.html,*.htm,*.css setlocal tabstop=2 shiftwidth=2

" Replace tab with space
nnoremap <leader><tab> :%s/\t/    /g<CR


" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
noremap <leader>M :%s/\r/\r/g<CR

" Auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Auto save and load fold setting
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview

" Hightlight from start of file
au BufEnter * :syntax sync fromstart

" set wait 1 second to autosave
set ut=1000
autocmd CursorHold,CursorHoldI * update

" Always show current position
set ruler

" When searching try to be smart about cases
set smartcase

" Daily routines
noremap <leader>z :w<CR><C-Z>
noremap <leader>w :w<CR>
noremap <leader>x :x<CR>
noremap <leader>q :q!<CR>