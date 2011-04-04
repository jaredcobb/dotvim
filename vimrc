"////       GENERAL VIM SETTINGS        ////" 

set nocompatible					" not compatible with vi
set number							" show line numbers
set hidden							" allow for closing windows and hiding the buffer
set number							" show line numbers
set tabstop=4						" tab width
set shiftwidth=4					" shift width
set softtabstop=4					" soft tab stop
set expandtab						" expand tab
set smartindent						" smart idnent the next line
set autoindent						" auto indent the next line
set wildmenu                        " enhanced command line completion
set wildmode=list:longest			" autocompletion
set foldenable						" enable code folding
set encoding=utf-8                  " default encoding
set scrolloff=3                     " always show 3 lines above and below cursor position
set sidescrolloff=3                 " always show 3 characters to the right of horizontal scroll
set nowrap                          " don't wrap the lines
set textwidth=0                     " don't wrap the lines
set wrapmargin=0                    " don't wrap the lines
set visualbell                      " don't beep at me
set ttyfast                         " better drawing
set backspace=indent,eol,start      " additional backspace functionality (as expected) 
set laststatus=2                    " always show status line
set undodir=~/.vimundo              " custom dir for vim undo files
set undofile                        " undo actions even after you close and reopen a file
set ignorecase                      " if all characters are lowercase, it will ignore sensitivity
set smartcase                       " if some characters are uppercase, it will be case sensitive
"set hlsearch                        " highlight search results
set autowrite                       " write file when switching between files
set incsearch                       " incremental search results
set go-=T                           " hide macvim toolbar
set completeopt=longest,menuone,preview

syntax on							" turn on syntax highlighting
colorscheme desert					" color scheme

" tweak autocompletion colors
highlight Pmenu guibg=#000000 guifg=#00d700

"////       PLUGIN CONFIGURATIONS       ////"

" setup pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" always open mini buffer explorer
let g:miniBufExplorerMoreThanOne=1
" use ctrl-tab to switch between buffers
let g:miniBufExplMapCTabSwitchBufs = 1
" customize the tab colors a little
hi MBEChanged guifg=red
hi MBEVisibleChanged guifg=red gui=bold
hi MBEVisibleNormal gui=bold
" setup sqlutilities for our standards
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_cmd_terminator = "\ngo"
let g:sqlutil_align_comma = 1
" setup easymotion leader key combo
let EasyMotion_leader_key='<leader>h'


"////       FILETYPE SETTINGS       ////"
filetype plugin indent on           " enable all filetypes


"////       CUSTOM MAPPINGS         ////"
" use <leader><leader> for shortcuts
" use <leader> for plugins

" use spacebar to trigger colon in normal mode
nnoremap <space> :
" quick escape when in insert mode
imap jj <esc>
" use tab key to navigate between windows in normal mode
nnoremap <Tab> <C-W>w
" remap the scroll to ctrl-j and ctrl-k
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" PLUGINS
" use F2 to toggle nerdtree
nnoremap <f2> :NERDTreeToggle<CR>
" use F3 to toggle taglist
nnoremap <f3> :TlistToggle<CR>
" flush and execute command-t
nnoremap <leader>t :CommandTFlush<cr>:CommandT<CR>
" shortcut for gundo
nnoremap <f5> :GundoToggle<CR>

" SHORTCUTS
" clear search highlight
nnoremap <leader><leader>c :nohlsearch<CR>
" shortcut to fold an HTML tag
nnoremap <leader><leader>ft Vatzf
" shortcut to fold braces (must be inside braces to fold)
nnoremap <leader><leader>fb zfa{
" split vertically and go to window
nnoremap <leader><leader>vs <C-w>v<C-w>l
" split horizontally and go to window
nnoremap <leader><leader>hs <C-w>s<C-w>j
" refresh ctags manually
nnoremap <leader><leader>rt :! ctags -R * <CR>
" easier to remember ctag 'go back' using other bracket
nnoremap <C-[> <C-t>
" trigger html tidy on the selected text
command -range=% -nargs=* Tidy <line1>,<line2>!tidy -quiet -indent --show-body-only true --show-warnings false --indent-spaces 4 -wrap 0
" shortcut for html tidy
vnoremap <leader><leader>hf :Tidy<cr>
" shortcut to remove all extra spaces in visual selection
vnoremap <leader><leader>J :g/^\s*$/d<CR>
" trigger autocomplete
inoremap <C-space> <C-x><C-o>
" make autocomplete behave a little better
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "<Tab>"
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"


"////       ABBREVIATIONS       ////"
iab lorem Lorizzle ipsum dolizzle my shizz amizzle, consectetuer adipiscing boofron. Check out this sapien velizzle, sizzle volutpat, suscipizzle shut the shizzle up, gravida vizzle, tellivizzle. Pellentesque mofo tortizzle. Sizzle erizzle. Fo shizzle its fo rizzle dolizzle dapibizzle turpis pizzle daahng dawg. Mauris pimpin' nibh izzle turpizzle. Owned izzle the bizzle. Pellentesque shizzle rhoncizzle phat. Yo mamma bling bling habitasse platea dictumst. Sizzle dapibizzle. Dawg tellus urna, pretizzle owned, mattizzle ac, eleifend , shizzle. Uhuh ... yih! phat. Integizzle semper nizzle sizzle pimpin'.
iab teh the
iab Teh the


"////       CUSTOM FUNCTIONALITY        ////"

if has("autocmd")
    " source the .vimrc file after we save it (no restartig macvim required)
	autocmd bufwritepost .vimrc source $MYVIMRC
    " remove autocomplete preview buffer on exit
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif
