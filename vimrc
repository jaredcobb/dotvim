"////       GENERAL VIM SETTINGS        ////" 

set nocompatible					" not compatible with vi
set number							" show line numbers
set hidden							" allow for closing windows and hiding the buffer
set number							" show line numbers
set tabstop=4						" tab width
set shiftwidth=4					" shift width
set softtabstop=4					" soft tab stop
set noexpandtab						" expand tab
set smartindent						" smart indent the next line
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
set ignorecase                      " if all characters are lowercase, it will ignore sensitivity
set smartcase                       " if some characters are uppercase, it will be case sensitive
set autowrite                       " write file when switching between files
set incsearch                       " incremental search results
set go-=T                           " hide macvim toolbar
set shell=bash\ -l					" source .profile for vim shell
set completeopt=longest,menuone,preview


"////       PLUGIN CONFIGURATIONS       ////"

" setup pathogen
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
" always open mini buffer explorer
let g:miniBufExplorerMoreThanOne=1
" use ctrl-tab to switch between buffers
let g:miniBufExplMapCTabSwitchBufs = 1
" setup sqlutilities for our standards
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_align_comma = 1
" setup easymotion leader key combo
let EasyMotion_leader_key='<leader>h'
" override ultisnips trigers
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

" color scheme
syntax on							" turn on syntax highlighting
colorscheme ir_black				" color scheme
" tweak autocompletion colors
highlight Pmenu guibg=#000000 guifg=#00d700
" tweak minibufexplorer colors
hi MBEVisibleActive guifg=#E6E6FF guibg=#000099
hi MBEVisibleChangedActive guifg=#FFFFFF guibg=#CC2900
hi MBEVisibleNormal guifg=#CCCCFF guibg=#000000
hi MBEVisibleChanged guifg=#FF5C33 guibg=#000000
hi MBENormal guifg=#CCCCFF guibg=#000000
hi MBEChanged guifg=#FF5C33 guibg=#000000


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
nnoremap <C-j> 3<C-e>
nnoremap <C-k> 3<C-y>
nnoremap <C-l> 3zl
nnoremap <C-h> 3zh

" PLUGINS
" use F2 to toggle nerdtree
nnoremap <f2> :NERDTreeToggle<CR>
" use F3 to toggle taglist
nnoremap <f3> :TlistToggle<CR>
" map the debugger shortcuts
map <leader>1 :python debugger_resize()<cr>
map <leader>2 :python debugger_command('step_into')<cr>
map <leader>3 :python debugger_command('step_over')<cr>
map <leader>4 :python debugger_command('step_out')<cr>
map <leader>5 :python debugger_run()<cr>
map <leader>6 :python debugger_quit()<cr>
map <leader>9 :python debugger_context()<cr>
map <leader>0 :python debugger_property()<cr>
map <leader>9 :python debugger_watch_input("context_get")<cr>A<cr>
map <leader>0 :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>
map <leader>b :Bp<cr>
map <leader>e :python debugger_watch_input("eval")<cr>A
" setup gdbp settings
let g:debuggerMaxChildren = 128
let g:debuggerMaxData = 8192
let g:debuggerMaxDepth = 100
" tell the debugger that i'm using minibufexpl
let g:debuggerMiniBufExpl = 1
" disable default debugger mappings
let g:debuggerDisableDefaultMappings = 1
" disable the help menu for the debugger
let g:debuggerDisableHelpPane = 1

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
command! -range=% -nargs=* Tidy <line1>,<line2>!tidy -quiet -indent --show-body-only true --show-warnings false --indent-spaces 4 -wrap 0
" shortcut for html tidy
vnoremap <leader><leader>hf :Tidy<cr>
" shortcut to remove all extra spaces in visual selection
vnoremap <leader><leader>J :g/^\s*$/d<CR>
" clean up extra parens spacing
vnoremap <leader><leader>( :s/( /(/g<CR>
" clean up extra parens spacing
vnoremap <leader><leader>) :s/ )/)/g<CR>
" trigger autocomplete
inoremap <C-space> <C-x><C-o>
" make autocomplete behave a little better
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> [ pumvisible() ? "\<C-N>" : "["
inoremap <expr> ] pumvisible() ? "\<C-P>" : "]"
" switch to php filetype mode
nnoremap <leader><leader>1 :set filetype=php<CR>
" switch to html filetype mode
nnoremap <leader><leader>2 :set filetype=html<CR>
" clear the control p cache (detect new files)
nnoremap <leader><leader>p :ClearCtrlPCache<CR>
" php function docblock generator
nnoremap <leader><leader>d :exe PhpDoc()<CR>

" FILETYPE MAPPINGS
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=scss


"////       ABBREVIATIONS       ////"
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
iab teh the
iab Teh the


"////       CUSTOM FUNCTIONALITY        ////"
if has("autocmd")
    " source the .vimrc file after we save it (no restartig macvim required)
	autocmd BufWritePost ~/.vimrc source $MYVIMRC
    " remove autocomplete preview buffer on exit
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif
