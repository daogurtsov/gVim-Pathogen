" .vimrc File
" Maintained by:Dmitry Ogurtsov
" daogurtsov@gmail.com
" daogurtsov.github.com
"

"Pathogen
" call pathogen#runtime_append_all_bundles() 
execute pathogen#infect()

"Forget compatibility with Vi. Who cares.
set nocompatible

"Enable filetypes
filetype plugin indent on
syntax on

"length
set lines=57
"columns
set columns=100

"scrolling offset
set scrolloff=15

"Write the old file out when switching between files.
set autowrite

"Backspace all line.
set backspace=indent,eol,start

"Default flag for substitution
set gdefault

"Display current cursor position in lower right corner.
set ruler

"Cursor line ruler
set cursorline

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeout
set timeoutlen=700
set ttimeoutlen=100

"Rip out swap file
set swapfile

"Switch between buffers without saving
set hidden

"Set the color scheme. Change this to your preference. 
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
colorscheme wombat256mod 

"Color column
set colorcolumn=80
"Set font type and size. Depends on the resolution. Larger screens, prefer h15
set guifont=Courier\ New:h11

"Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
set shiftround

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
"set relativenumber"

"Indent stuff
set smartindent
set autoindent
set linebreak
"Auto indent
autocmd BufRead, BufWritePre *.html normal gg=G
"Force encode
set fileencoding=utf-8
set encoding=utf-8

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping 
set wrap
set textwidth=60
set formatoptions=qrn1
set showbreak=>\

"Search
"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" "Switch on magic mode for regex
nnoremap / /\v
vnoremap / /\v

nnoremap ? ?\v
vnoremap ? ?\v

" case insensitive search
set ignorecase
set smartcase

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

" Create dictionary for custom expansions
set dictionary+=C:\Program\ Files\ \(x86\)\Vim\vimfiles\dict.txt

" C-Space seems to work under gVim on both Linux and win32
"inoremap <C-Space> <C-n>

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow              

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"Map a change directory to the desktop - win specific
nmap ,d :cd c:\Users\daogu_000\Desktop<cr>:e.<cr>
"nmap ,d :cd ~/Desktop<cr>:e.<cr>

"Shortcut for editing  vimrc file in a new tab
nmap ,ev :tabedit $MYVIMRC<cr>

"Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<c-z>'


"Faster shortcut for commenting. Requires T-Comment plugin
map ,c <c-_><c-_>

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
inoremap c<tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
         \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
         \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
endif
"
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap <C-n>t :NERDTreeToggle

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"launch current file in chrome
cnoreabbrev cr !start cmd /k chrome %:p<CR>
"in firefox
cnoreabbrev ff :!start cmd /k "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" %:p<cr>


"Peep open
if has("gui_macvim")
   macmenu &File.New\ Tab key=<nop>
   map <c-o> <Plug>PeepOpen
end
"Auto php
"au BufRead, BufNewFile *.php setfiletype php

"Line ends charater
" set list 
set listchars=eol:¬

"set folding method and marker
set fdm=marker
set foldmarker=[[,]]

"yank full file path to buffer
let @+=expand("%:p")

"easymotion leader remapping
let g:EasyMotion_leader_key = ','

"copy directly to clipboard
set clipboard=unnamed

"copy directly to clipboard vi-mode

:set go+=a
"jsbeautify
let g:jsbeautify = {"indent_size": 4, "indent_char": "\t"} 


"sorround plugin change inside parentheses
onoremap p i(


"hebrew
imap <f2> <c-o>:call ToggleHebrew()<cr>
map <f2> :call ToggleHebrew()<cr>

"undofile use local history
set undofile
"hebrew keymap on
" func! ToggleHebrew()
"   if &rl
"     set norl
"     set keymap=
"   else
"     set rl
"     set keymap=hebrew
"   end
" endfunc
"current keymap and rtl on


func! ToggleHebrew()
  if &rl
    set norl
    set keymap=
  else
    set rl
  end
endfunc

"smart tab compleation
function! InsertTabWrapper()
   let col = col(".") - 1
   if !col || getline(".")[col - 1] !~ "\k"
      return "\<tab>"
   else
      return "\<c-n>"
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>
