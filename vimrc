"////       GENERAL VIM SETTINGS        ////"

set nocompatible					" not compatible with vi
filetype off

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
set incsearch                       " incremental search results
set go-=T                           " hide macvim toolbar
set guioptions-=r					" get rid of right macvim scrollbar
set guioptions-=l					" get rid of left macvim scrollbar
set fdo-=search						" don't open folds when searching, just show a single hit
set hidden							" let me navigate to other buffers without saving
set completeopt=preview,longest,menuone



"////       PLUGIN CONFIGURATIONS       ////"

" setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" add bundles and their settings
" global variable definitions & keymaps related to the bundle are right below
Bundle 'cakebaker/scss-syntax.vim.git'

Bundle 'ervandew/supertab.git'
" use omnicompletion for the default type
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
let g:SuperTabClosePreviewOnPopupClose = 1

Bundle 'flazz/vim-colorschemes.git'

Bundle 'joonty/vdebug.git'
" use a compact version for the watch inspector
let g:vdebug_options = {
\	"watch_window_style" : "compact"
\}
" function keys are the debil on a mac!
let g:vdebug_keymap = {
\	"run_to_cursor" : "<leader>1",
\	"step_over" : "<leader>2",
\	"step_into" : "<leader>3",
\	"step_out" : "<leader>4",
\	"run" : "<leader>5",
\	"close" : "<leader>6",
\	"detach" : "<leader>7",
\	"set_breakpoint" : "<leader>b",
\	"get_context" : "<leader>9",
\	"eval_under_cursor" : "<leader>0",
\	"eval_visual" : "<leader>e",
\}

Bundle 'groenewege/vim-less.git'

Bundle 'kien/ctrlp.vim.git'
" clear the control p cache (detect new files)
nnoremap <leader><leader>p :ClearCtrlPCache<cr>
" always start from the working directory
let g:ctrlp_working_path_mode = 0

Bundle 'Lokaltog/vim-easymotion.git'
" setup easymotion leader key combo
let EasyMotion_leader_key='<leader>]'
" setup a very quick and easy way to use easymotion with 'w' and 'b'
nmap <s-cr> <leader>]b
nmap <cr> <leader>]w

Bundle 'mileszs/ack.vim.git'

Bundle 'scrooloose/nerdcommenter.git'

Bundle 'scrooloose/nerdtree.git'
" use F2 to toggle nerdtree
nnoremap <f2> :NERDTreeToggle<cr>

Bundle 'SirVer/ultisnips'
" override ultisnips trigers
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsListSnippets="<s-c-space>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

Bundle 'Townk/vim-autoclose.git'

Bundle 'tpope/vim-fugitive.git'

Bundle 'tpope/vim-repeat.git'

Bundle 'tpope/vim-surround.git'

Bundle 'pangloss/vim-javascript'

Bundle 'captbaritone/better-indent-support-for-php-with-html'

Bundle 'vim-scripts/matchit.zip.git'

Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim.git'
" php function docblock generator
nnoremap <leader><leader>d :exe PhpDoc()<cr>

" required by sql utilities plugin
Bundle 'vim-scripts/Align.git'

Bundle 'vim-scripts/SQLUtilities.git'
" setup sqlutilities for our standards
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_align_comma = 1

Bundle 'majutsushi/tagbar.git'
nnoremap <f3> :TagbarToggle<cr>

Bundle 'techlivezheng/vim-plugin-tagbar-phpctags.git'
let g:tagbar_phpctags_bin='~/bin/phpctags'

Bundle 'bling/vim-airline.git'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '[%s] '
" cycle through buffers
nnoremap <c-tab> :bnext<cr>
nnoremap <s-c-tab> :bprevious<cr>

Bundle 'scrooloose/syntastic.git'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='❯'
nnoremap <leader>] :lnext<cr>
nnoremap <leader>[ :lprev<cr>



"////       FILETYPE SETTINGS       ////"

filetype plugin indent on
syntax on
" set color scheme, ir_black is in flazz/vim-colorschemes.git
colorscheme ir_black
" enable scss syntax highlighting if using these extensions
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=scss



"////       HIGHLIGHT SETTINGS       ////"
" put highlight variables down here because of vundle load order



"////       CUSTOM MAPPINGS         ////"
" use <leader><leader> for shortcuts

" GENERAL MAPPINGS
" use spacebar to trigger colon in normal mode
nnoremap <space> :
" quick escape when in insert mode
imap jj <esc>
" use tab key to navigate between windows in normal mode
nnoremap <Tab> <C-W>w
" remap the vertical scroll to ctrl-j/k and horizontal scroll to ctrl-h/l
nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>
nnoremap <C-h> 4zh
nnoremap <C-l> 4zl

" SHORTCUTS
" shortcut to (f)old and html (t)ag
nnoremap <leader><leader>ft Vatzf
" shortcut to (f)old (b)races, must be inside braces to fold
nnoremap <leader><leader>fb zfa{
" do a (v)ertical (s)plit and go to window
nnoremap <leader><leader>vs <C-w>v<C-w>l
" do a (h)orizontal (s)plit and go to window
nnoremap <leader><leader>hs <C-w>s<C-w>j
" (r)efresh c(t)ags manually - note, i have a ~/.ctags with my preferences
nnoremap <leader><leader>rt :! ctags -R --exclude=.git --languages=-javascript *<cr>
" easier to remember ctag 'go back' using other bracket
nnoremap <C-[> <C-t>
" clean up extra parens spacing
vnoremap <leader><leader>( :s/( /(/g<cr>
" clean up extra parens spacing
vnoremap <leader><leader>) :s/ )/)/g<cr>
" switch to php filetype mode
nnoremap <leader><leader>1 :set filetype=php<cr>
" switch to html filetype mode
nnoremap <leader><leader>2 :set filetype=html<cr>
" kill the trailing (w)hite(s)pace in the entire file
nnoremap <leader><leader>ws :%s/\s\+$//e<cr>



"////       CUSTOM FUNCTIONALITY        ////"
if has("autocmd")
	" source the .vimrc file after we save it (no restartig macvim required)
	autocmd BufWritePost ~/.vimrc source $MYVIMRC
	" remove trailing whitespace before save
	autocmd BufWritePre * :%s/\s\+$//e
endif
