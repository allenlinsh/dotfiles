" Specify a directory for plugins
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.nvim/plugged')

" Smart completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File Navigator
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" Git support
Plug 'airblade/vim-gitgutter'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Quick comment
Plug 'scrooloose/nerdcommenter'

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'

" LaTeX
Plug 'lervag/vimtex'

" Snippet support
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax validator
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" Code formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Initialize plugin system
call plug#end()

" Initialize default formatter
call glaive#Install()

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

" clear status
inoremap jj <ESC> inoremap kk <ESC>
nnoremap <silent> <ESC> :noh<CR><ESC>

" make j/k/0/$ move through line wrap
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap q g$
vnoremap j gj
vnoremap k gk
vnoremap 0 g0
vnoremap q g$

" remap h/j/k/l
nnoremap gj j
nnoremap gk k
nnoremap g0 0
nnoremap gq $
vnoremap gj j
vnoremap gk k
vnoremap g0 0
vnoremap gq $

" remap 0 and $
nnoremap g0 0
nnoremap gq $
vnoremap g0 0
vnoremap gq $

" extend 0/q functions
nnoremap dq dg$
nnoremap dgq d$
nnoremap d0 dg0
nnoremap dg0 dg0

" quit nvim
cnoremap Q qa!
cnoremap W wq

" code formatter
nnoremap <silent> <C-f> :FormatCode<CR>

" vim tabs
nnoremap <silent> gtt :tabnew<CR>:NERDTree<CR>
nnoremap <silent> gtn :tabnext<CR>
nnoremap <silent> gtx :tabclose<CR>

" vim windows
nnoremap <silent> gwn <C-w>w
nnoremap <silent> gws <C-w>v
nnoremap <silent> gwv <C-w>s
nnoremap <silent> gwx <C-w>q

" nerdtree navigator
nnoremap <silent> <C-n> :NERDTreeToggle %:p:h<CR>

" toggle comments
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" move lines (arrow keys)
nnoremap <silent> <C-Up> :m .-2<CR>==
nnoremap <silent> <C-Down> :m .+1<CR>==
inoremap <silent> <C-Up> <ESC>:m .-2<CR>==gi
inoremap <silent> <C-Down> <ESC>:m .+1<CR>==gi
vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv

" move lines (j/k)
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <ESC>:m .+1<CR>==gi
inoremap <silent> <A-k> <ESC>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" jump between words (h/l)
function! <SID>GotoPattern(pattern, dir) range
    let g:_saved_search_reg = @/
    let l:flags = "We"
    if a:dir == "b"
        let l:flags .= "b"
    endif
    for i in range(v:count1)
        call search(a:pattern, l:flags)
    endfor
    let @/ = g:_saved_search_reg
endfunction
nnoremap <silent> <A-l> :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9_]', 'f')<CR>
nnoremap <silent> <A-h> :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9_]', 'b')<CR>

" set the maximum number of modified directories
" stored in the histroy file
let g:netrw_dirhistmax = 0

" interface
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" scroll offset
set scrolloff=3

" letter case
set ignorecase
set smartcase
set backspace=indent,eol,start

" disable swap files
set noswapfile

" tabs
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2

" indentation
filetype plugin indent on
set autoindent

" split pane
set splitbelow splitright

" colorscheme
colorscheme afterglow
set background=dark

" line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd FocusGained,InsertLeave * set relativenumber
  autocmd FocusLost,InsertEnter   * set norelativenumber
augroup END

" ---------------------------------------------------------------------------
" NERDTree
" ---------------------------------------------------------------------------

let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['^node_modules$']

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" ---------------------------------------------------------------------------
" NERDTree
" ---------------------------------------------------------------------------

" Devicons settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:DevIconsEnableFoldersOpenClose = 1

" ---------------------------------------------------------------------------
" Spell Check
" ---------------------------------------------------------------------------

" check english spelling
"set spelllang=en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" change spellcheck color
"hi clear SpellBad
"hi SpellBad cterm=underline ctermfg=red

" ---------------------------------------------------------------------------
" Prettier
" ---------------------------------------------------------------------------

"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" ---------------------------------------------------------------------------
" CtrlP
" ---------------------------------------------------------------------------

let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height

" ---------------------------------------------------------------------------
" Airline
" ---------------------------------------------------------------------------

let g:airline_theme = 'afterglow'
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '??'
let g:airline_left_sep = '???'
let g:airline_right_sep = '??'
let g:airline_right_sep = '???'
let g:airline_symbols.linenr = '???'
let g:airline_symbols.linenr = '???'
let g:airline_symbols.linenr = '??'
let g:airline_symbols.paste = '??'
let g:airline_symbols.paste = '??'
let g:airline_symbols.whitespace = '??'

" powerline symbols
let g:airline_left_sep = '???'
let g:airline_left_alt_sep = '???'
let g:airline_right_sep = '???'
let g:airline_right_alt_sep = '???'
let g:airline_symbols.branch = '???'
let g:airline_symbols.readonly = '???'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '???'
let g:airline_symbols.dirty='???'

" tabline
function! AirlineInit()
  let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
  let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
  let g:airline#extensions#tabline#tabs_label = ''       " can put text here like TABS to denote buffers
  let g:airline#extensions#tabline#buffers_label = ''    " can put text here like BUFFERS to denote tabs
  let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
  let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
  let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
  let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
  let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
  let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                   
  let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird orange arrow on the tabline
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" ---------------------------------------------------------------------------
" VimTeX
" ---------------------------------------------------------------------------

let g:tex_flavor="latex"
let g:vimtex_view_method="zathura"
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
hi clear Conceal

" Run latexmk in a tmux session
function! TmuxSend()
    let tex_file = expand('%:p')
    let tex_cmd = 'latexmk -pdf -interaction=nonstopmode -cd ' . tex_file
    let tmux_cmd = 'tmux send-keys -t vim_output.0 "' . tex_cmd . '" ENTER'
    let output = system(tmux_cmd)   
endfunction
autocmd BufWrite *.tex :call TmuxSend()

" ---------------------------------------------------------------------------
" UltiSnips
" ---------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger= pumvisible() && "<CR>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" ---------------------------------------------------------------------------
" CoC
" ---------------------------------------------------------------------------

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
set hidden
set undofile
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <ESC> pumvisible() ? "\<C-g>u\<ESC>" : "\<ESC>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR> 

" Reload webdevicons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
