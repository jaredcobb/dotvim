"////       GENERAL VIM SETTINGS        ////"

set nocompatible                      " not compatible with vi
filetype off                          " temporarily disable filetype detection for vundle

set number                            " show line numbers
set relativenumber                    " show relative numbers
set tabstop=4                         " tab width
set shiftwidth=4                      " shift width
set softtabstop=4                     " soft tab stop
set noexpandtab                       " expand tab
set smartindent                       " smart indent the next line
"set wildmenu                          " enhanced command line completion
set wildmode=list:longest             " autocompletion
set completeopt=menu,menuone,longest
"set completeopt=longest,menuone
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
set go-=T                             " hide macvim toolbar
set guioptions-=r                     " get rid of right macvim scrollbar
set guioptions-=l                     " get rid of left macvim scrollbar
set fdo-=search                       " don't open folds when searching, just show a single hit
set hidden                            " let me navigate to other buffers without saving
set hlsearch                          " turn on highlighting for search
set clipboard=unnamed                 " yank and paste with clipboard support
set guifont=Hack:h11                  " set a better font
set cursorline                        " highlight the current line
set lazyredraw                        " redraw only when we need to



"////       PLUGIN CONFIGURATIONS       ////"

" setup vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle o_O
Plugin 'VundleVim/Vundle.vim'

" add bundles and their settings
" global variable definitions & keymaps related to the bundle are right below

Plugin 'mhinz/vim-startify'
let g:startify_skiplist = ['tags', '/usr/local/Cellar/macvim', 'bundle/.*/doc', 'COMMIT_EDITMSG']
let g:startify_files_number = 8
let g:startify_session_persistence = 1

Plugin 'hail2u/vim-css3-syntax.git'

Plugin 'ervandew/supertab.git'
" use omnicompletion for the default type
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

Plugin 'StanAngeloff/php.vim'

Plugin 'shawncplus/phpcomplete.vim'

Plugin 'dsawardekar/wordpress.vim'

Plugin 'flazz/vim-colorschemes.git'

Plugin 'kien/ctrlp.vim.git'
" clear the control p cache (detect new files)
nnoremap <leader>p :ClearCtrlPCache<cr>
" always start from the working directory
let g:ctrlp_working_path_mode = 0

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

Plugin 'SirVer/ultisnips'
" override ultisnips trigers
let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsListSnippets="<s-c-space>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

Plugin 'Townk/vim-autoclose.git'

Plugin 'tpope/vim-fugitive.git'

Plugin 'tpope/vim-repeat.git'

Plugin 'tpope/vim-surround.git'

Plugin 'pangloss/vim-javascript'

Plugin 'vim-scripts/matchit.zip.git'

Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim.git'
" php function docblock generator
nnoremap <leader>d :exe PhpDoc()<cr>

" required by sql utilities plugin
Plugin 'vim-scripts/Align.git'
" remap align shortcut to not interfere with my quick save
map <leader><leader>w= <Plug>AM_w=

Plugin 'vim-scripts/SQLUtilities.git'
" setup sqlutilities for our standards
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_align_comma = 1

Plugin 'majutsushi/tagbar.git'
nnoremap <f3> :TagbarToggle<cr>

Plugin 'techlivezheng/vim-plugin-tagbar-phpctags.git'
let g:tagbar_phpctags_bin='~/bin/phpctags'

Plugin 'bling/vim-airline.git'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '[%s] '
let g:airline#extensions#whitespace#enabled = 0
" cycle through buffers
nnoremap <c-tab> :bnext<cr>
nnoremap <s-c-tab> :bprevious<cr>

Plugin 'scrooloose/syntastic.git'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='❯'
let g:syntastic_aggregate_errors = 1
let g:syntastic_wordpress_phpcs_standard = "WordPress-VIP"
"let g:syntastic_php_checkers = ['php']
nnoremap <leader>] :lnext<cr>
nnoremap <leader>[ :lprev<cr>

Plugin 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plugin 'skwp/greplace.vim'
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

Plugin 'rizzatti/dash.vim'
nmap <leader>D <Plug>DashSearch

"Plugin 'dsawardekar/wordpress.vim'

Plugin 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save = 1

Plugin 'kchmck/vim-coffee-script'

Plugin 'sjl/gundo.vim.git'
nnoremap <leader>u :GundoToggle<CR>

Plugin 'junegunn/vim-easy-align.git'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" no more plugins
call vundle#end()



"////       FILETYPE SETTINGS       ////"

" must be called after all Vundle plugins are defined (not before)
filetype plugin indent on
syntax enable

" Enable omni completion and set spacing preferences per filetype
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS autoindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS autoindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP autoindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType scss sass setlocal autoindent shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType ruby,haml,eruby,yaml,cucumber,ejs,coffee,json setlocal autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" set color scheme, ir_black is in flazz/vim-colorschemes.git
colorscheme ir_black



"////       HIGHLIGHT SETTINGS       ////"
" put highlight variables down here because of vundle load order
hi StartifyHeader ctermfg=46 guifg=#00ff00



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

" SHORTCUTS

" easier to remember ctag 'go back' using other bracket
nnoremap <C-[> <C-t>
nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sl :SLoad<CR>
nnoremap <leader>sd :SDelete<CR>
nnoremap <leader>st :Startify<CR>
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
nnoremap <leader>rt :! ctags -R --exclude=.git --languages=-javascript *<cr>
" clean up extra parens spacing
vnoremap <leader>( :s/( /(/g<cr>
" clean up extra parens spacing
vnoremap <leader>) :s/ )/)/g<cr>
" switch to php filetype mode
nnoremap <leader>1 :set filetype=php<cr>
" switch to html filetype mode
nnoremap <leader>2 :set filetype=html<cr>
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
