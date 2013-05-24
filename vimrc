"////       GENERAL VIM SETTINGS        ////" 

set nocompatible					" not compatible with vi
filetype off

set number							" show line numbers
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
set fdo-=search						" don't open folds when searching, just show a single hit
set completeopt=longest,menuone,preview


"////       PLUGIN CONFIGURATIONS       ////"

" setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" add bundles and their settings
Bundle 'cakebaker/scss-syntax.vim.git'

Bundle 'henrik/vim-qargs.git'

Bundle 'ervandew/supertab.git'
" override supertab defaults
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

Bundle 'flazz/vim-colorschemes.git'

Bundle 'git@github.com:jaredcobb/DBGp-Remote-Debugger-Interface.git'
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
map <leader>j :Bp<cr>:python debugger_run()<cr>:Bp<cr>
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

Bundle 'git@github.com:jaredcobb/minibufexpl.vim.git'
" always open mini buffer explorer
let g:miniBufExplorerMoreThanOne=1
" use ctrl-tab to switch between buffers
let g:miniBufExplMapCTabSwitchBufs = 1

Bundle 'groenewege/vim-less.git'

Bundle 'kien/ctrlp.vim.git'
" clear the control p cache (detect new files)
nnoremap <leader><leader>p :ClearCtrlPCache<CR>

Bundle 'Lokaltog/vim-easymotion.git'
" setup easymotion leader key combo
let EasyMotion_leader_key='<leader>h'

Bundle 'mileszs/ack.vim.git'

Bundle 'scrooloose/nerdcommenter.git'

Bundle 'scrooloose/nerdtree.git'
" use F2 to toggle nerdtree
nnoremap <f2> :NERDTreeToggle<CR>

Bundle 'SirVer/ultisnips'
" override ultisnips trigers
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

Bundle 'Townk/vim-autoclose.git'

Bundle 'tpope/vim-fugitive.git'

Bundle 'tpope/vim-repeat.git'

Bundle 'tpope/vim-surround.git'

Bundle 'vim-scripts/Align.git'

Bundle 'vim-scripts/JavaScript-Indent.git'

Bundle 'vim-scripts/matchit.zip.git'

Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim.git'
" php function docblock generator
nnoremap <leader><leader>d :exe PhpDoc()<CR>

Bundle 'vim-scripts/SQLUtilities.git'
" setup sqlutilities for our standards
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_align_comma = 1

Bundle 'vim-scripts/taglist.vim.git'
" use F3 to toggle taglist
nnoremap <f3> :TlistToggle<CR>



"////       FILETYPE SETTINGS       ////"
filetype plugin indent on
" turn on syntax highlighting
syntax on
" set color scheme
colorscheme ir_black
" enable scss syntax highlighting if using these extensions
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=scss



"////       HIGHLIGHT SETTINGS       ////"
" put highlight variables down here because of vundle load order

" use a custom color scheme for the breakpoint and current lines in debug mode
let g:useCustomColors = 1
hi DbgCurrent ctermbg=404040 guibg=#404040
hi DbgBreakPt ctermbg=404040 guibg=#404040

" tweak minibufexplorer colors
hi MBEVisibleActive guifg=#E6E6FF guibg=#000099
hi MBEVisibleChangedActive guifg=#FFFFFF guibg=#CC2900
hi MBEVisibleNormal guifg=#CCCCFF guibg=#000000
hi MBEVisibleChanged guifg=#FF5C33 guibg=#000000
hi MBENormal guifg=#CCCCFF guibg=#000000
hi MBEChanged guifg=#FF5C33 guibg=#000000



"////       CUSTOM MAPPINGS         ////"
" use <leader><leader> for shortcuts

" GENERAL MAPPINGS
" use spacebar to trigger colon in normal mode
nnoremap <space> :
" quick escape when in insert mode
imap jj <esc>
" use tab key to navigate between windows in normal mode
nnoremap <Tab> <C-W>w
" remap the scroll to ctrl-j and ctrl-k
nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>
nnoremap <C-l> 4zl
nnoremap <C-h> 4zh

" SHORTCUTS
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
" switch to php filetype mode
nnoremap <leader><leader>1 :set filetype=php<CR>
" switch to html filetype mode
nnoremap <leader><leader>2 :set filetype=html<CR>



"////       ABBREVIATIONS       ////"
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
iab teh the
iab Teh the



"////       CUSTOM FUNCTIONALITY        ////"
if has("autocmd")
    " source the .vimrc file after we save it (no restartig macvim required)
	autocmd BufWritePost ~/.vimrc source $MYVIMRC
endif
