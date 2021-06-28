"////       GENERAL VIM SETTINGS        ////"

set nocompatible                      " not compatible with vi
filetype off                          " temporarily disable filetype detection for vundle

set number                            " show line numbers
set relativenumber                    " show relative line numbers
set tabstop=4                         " tab width
set shiftwidth=4                      " shift width
set softtabstop=4                     " soft tab stop
set noexpandtab                       " expand tab
set completeopt-=preview              " remove the default preview
set smartindent                       " smart indent the next line
set foldenable                        " enable code folding
set encoding=utf-8                    " default encoding
set scrolloff=3                       " always show 3 lines above and below cursor position
set sidescrolloff=3                   " always show 3 characters to the right of horizontal scroll
set nowrap                            " don't wrap the lines
set textwidth=0                       " don't wrap the lines
set wrapmargin=0                      " don't wrap the lines
set visualbell                        " don't beep at me
set ttyfast                           " better drawing
set backspace=indent,eol,start        " additional backspace functionality (as expected)
set laststatus=2                      " always show status line
set ignorecase                        " if all characters are lowercase, it will ignore sensitivity
set smartcase                         " if some characters are uppercase, it will be case sensitive
set incsearch                         " incremental search results
set fdo-=search                       " don't open folds when searching, just show a single hit
set hidden                            " let me navigate to other buffers without saving
set hlsearch                          " turn on highlighting for search
set clipboard=unnamed                 " yank and paste with clipboard support
set cursorline                        " highlight the current line
set lazyredraw                        " redraw only when we need to
set formatoptions+=j                  " better line joins with J
set shell=/bin/zsh                    " set default shell
set go-=T                             " hide macvim toolbar
set guioptions-=R                     " get rid of right macvim scrollbar
set guioptions-=L                     " get rid of left macvim scrollbar
set guioptions-=r                     " get rid of right macvim scrollbar
set guioptions-=l                     " get rid of left macvim scrollbar
set guioptions-=m                     " get rid of menu bar
set guioptions-=T                     " get rid of toolbar
set guifont=Hack:h14                  " set a better font



"////       PLUGIN CONFIGURATIONS       ////"

" setup vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle o_O
Plugin 'VundleVim/Vundle.vim'

" add bundles and their settings
" global variable definitions & keymaps related to the bundle are right below

Plugin 'mhinz/vim-startify'
let g:startify_skiplist = ['tags', 'bundle/.*/doc', 'COMMIT_EDITMSG']
let g:startify_files_number = 8
let g:startify_session_persistence = 1

Plugin 'morhetz/gruvbox'

Plugin 'tpope/vim-rails'

Plugin 'hail2u/vim-css3-syntax.git'

Plugin 'tpope/vim-markdown'

Plugin 'kien/ctrlp.vim.git'
" clear the control p cache (detect new files)
nnoremap <leader>p :ClearCtrlPCache<cr>
" always start from the working directory
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

Plugin 'Lokaltog/vim-easymotion.git'
" setup a very quick and easy way to use easymotion with 'w' and 'b'
map <leader>j <Plug>(easymotion-w)
map <leader>k <Plug>(easymotion-b)

Plugin 'mileszs/ack.vim.git'

Plugin 'scrooloose/nerdcommenter.git'

Plugin 'scrooloose/nerdtree.git'
" use F2 to toggle nerdtree
nnoremap <f2> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$', '\.swp$']

Plugin 'tobyS/vmustache'

Plugin 'tobyS/pdv'
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>
let g:pdv_template_dir = $HOME ."/.vim/custom_snippets/pdv"

Plugin 'Raimondi/delimitMate'
let delimitMate_expand_space=1

Plugin 'tpope/vim-fugitive.git'
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

Plugin 'tpope/vim-repeat.git'

Plugin 'tpope/vim-surround.git'

Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'
" Allow JSX in normal JS files
let g:jsx_ext_required = 0

Plugin 'vim-scripts/matchit.zip.git'

Plugin 'bling/vim-airline.git'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '[%s] '
let g:airline#extensions#whitespace#enabled = 0
" cycle through buffers
nnoremap <leader><tab> :bnext<cr>
nnoremap <leader><s-tab> :bprevious<cr>

Plugin 'scrooloose/syntastic.git'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='❯'
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
nnoremap <leader>e :Errors<cr>

Plugin 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plugin 'skwp/greplace.vim'
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

Plugin 'rizzatti/dash.vim'
nmap <leader>D <Plug>DashSearch

Plugin 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save = 1

Plugin 'sjl/gundo.vim.git'
nnoremap <leader>u :GundoToggle<CR>

Plugin 'junegunn/vim-easy-align.git'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" shortcut to format php docblocks (only visually highlight the @ items)
vnoremap <leader>df :EasyAlign 2\ { 'left_margin': 2, 'ignore_groups': ['String'] }<cr>gv:EasyAlign 3\ { 'left_margin': 2, 'ignore_groups': ['String'] }<cr>
vnoremap <leader>af :EasyAlign =<cr>

Plugin 'godlygeek/tabular.git'

Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" no more plugins
call vundle#end()



"////       FILETYPE SETTINGS       ////"

" must be called after all Vundle plugins are defined (not before)
filetype plugin indent on
syntax enable

" Enable omni completion and set spacing preferences per filetype
"autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS smartindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags smartindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS smartindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType php,php.wordpress setlocal omnifunc=phpcomplete#CompletePHP smartindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType ruby,haml,eruby,yaml,cucumber,ejs,coffee,json setlocal smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab



"////       HIGHLIGHT SETTINGS       ////"
" put highlight variables down here because of vundle load order
hi StartifyHeader ctermfg=46 guifg=#00ff00
colorscheme gruvbox
hi Search guibg=black guifg=white gui=underline ctermbg=black ctermfg=white cterm=underline



"////       TERMINAL SETTINGS       ////"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"



"////       CUSTOM MAPPINGS         ////"
" use <leader> for plugin mappings & shortcuts

" GENERAL MAPPINGS

" map spacebar to leader key
map <space> <leader>
" quick escape when in insert mode
imap jj <esc>
" use tab key to navigate between windows in normal mode
nnoremap <Tab> <C-W>w
" remap the vertical scroll to ctrl-j/k and horizontal scroll to ctrl-h/l
nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>
nnoremap <C-h> 4zh
nnoremap <C-l> 4zl
" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>
" map leader w as a quick save
nnoremap <leader>w :w<CR>
" map leader q as a quick quit
"nnoremap <leader>q :q<CR>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" SHORTCUTS

" cycle through buffers
nnoremap <c-tab> :bnext<cr>
nnoremap <s-c-tab> :bprevious<cr>
" source the settings
nnoremap <leader>sv :source $MYVIMRC<CR>

" COMPLEX COMMANDS

" shortcut to (f)old an html (t)ag
nnoremap <leader>ft Vatzf
" shortcut to (f)old (b)races, must be inside braces to fold
nnoremap <leader>fb zfa{
" do a (v)ertical (s)plit and go to window
nnoremap <leader>vs <C-w>v<C-w>l
" do a (h)orizontal (s)plit and go to window
nnoremap <leader>hs <C-w>s<C-w>j
" (r)efresh c(t)ags manually - note, i have a ~/.ctags with my preferences
nnoremap <leader>rt :! ctags -R --fields=+l --exclude=.git --languages=-javascript *<cr>
" clean up extra parens spacing
vnoremap <leader>( :s/( /(/g<cr>
" clean up extra parens spacing
vnoremap <leader>) :s/ )/)/g<cr>
" switch to php filetype mode
nnoremap <leader>1 :set filetype=php<cr>
" switch to php.wordpress filetype mode
nnoremap <leader>2 :set filetype=php.wordpress<cr>
" switch to html filetype mode
nnoremap <leader>3 :set filetype=html<cr>
" paste the buffer and drop the overridden contents into the black hole (preserves the buffer)
vnoremap p "_dP



"////              HEADER              ////"

let g:startify_custom_header = [
			\'',
\'           |~',
\'           |.---.',
\'          .`_____`. /\`',
\'          |~xxxxx~| ||',
\'          |_  #  _| ||',
\'     .------`-#-`-----.',
\'    (___|\_________/|_.`.',
\'     /  | _________ | | |',
\'    /   |/   _|_   \| | |',
\'   /   /X|  __|__  |/ `.|',
\'  (  --< \\/    _\//|_ |`.',
\'  `.    ~----.-~=====,:=======',
\'    ~-._____/___:__(``/| |',
\'      |    |      XX|~ | |',
\'       \__/======| /|  `.|',
\'       |_\|\    /|/_|    )',
\'       |_   \__/   _| .-`',
\'       | \ .`||`. / |(_|',
\'       |  ||.``.||  |   )',
\'       |  ``|  |``  |  /',
\'       |    |  |    |\/',
\'',
\'    IT''S ABOUT THE BOUNTY',
\'',
\]
