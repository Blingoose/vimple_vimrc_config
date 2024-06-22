"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"                                                                         "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                   "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                   "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                        "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                        "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                   "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                   "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ### NAVIGATION ###
" Press 'zo' to fold-open.
" Press 'zm' to fold-close.

" DEFAULTS ---------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" More powerful backspace.
set backspace=indent,eol,start

" enable mouse support. 
set mouse=a

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" To disable auto-comments permanently.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number

" Highlight cursor line underneath the cursor horizontally.
set nocursorline

" Highlight cursor line underneath the cursor vertically.
set nocursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search also [] {} and ().
set showmatch

" Auto indentation in new line.
set autoindent

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Enable fuzzy-finder (fzf install required first).
set rtp+=/opt/homebrew/opt/fzf

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
" **required for coc-nvim.
set encoding=utf-8

" Some servers have issues with backup files, see # 649.
" **required for coc-nvim.
set nobackup
set nowritebackup

" This allows you to undo changes to a file even after saving it.
set undodir=~/.vim/backup
set undofile  
set undoreload=10000

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" **required for coc-nvim.
set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" **required for coc-nvim.
set signcolumn=yes

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

" ** Color Schemes **
  Plug 'joshdick/onedark.vim'
" ** Functionality
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'tpope/vim-fugitive'
  Plug 'philrunninger/nerdtree-visual-selection'
  Plug 'airblade/vim-gitgutter'
call plug#end()

" }}}

" GENERAL MAPPING ---------------------------------------------------------------- {{{

" Set the ',' as the leader key.
let mapleader = ','

" Press \\ to jump back to the last cursor position.
nnoremap \\ ``

" Press <leader>h to turn off search highlighting.
nnoremap <silent> <leader>h :nohlsearch<CR>

" Type jk to exit insert mode quickly.
" inoremap jk <Esc>

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Fuzzy-finder files search. 
nnoremap <leader>p :Files<Cr>
" Fuzzy-finder git search.
nnoremap <leader>o :GFiles<Cr>

" Ripgrep within fuzzy-finder.
nnoremap <leader>i :Rg<Cr>

" Map the F4 key to run a Python script inside Vim.
" We map F4 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" python % executes the current file with Python.
nnoremap <f4> :w <CR> :!clear && python % <CR>
imap <f4> <Esc> :w <CR> :!clear && python %<CR>
" Run Node in separate buffer (See RUN PYTHON & NODE SCRIPT). 
nnoremap <silent> <f5> :call SaveAndExecutePython()<CR>
imap <silent> <f5> :<C-u>call SaveAndExecutePython()<CR>

" Map the F6 key to run a Node script inside Vim.
" We map F6 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" node % executes the current file with Node.
nnoremap <f6> :w <CR> :!clear && node % <CR>
imap <f6> <Esc> :w <CR> :!clear && node %<CR>
" Run Node in separate buffer (See RUN PYTHON & NODE SCRIPT).
nnoremap <silent> <f7> :call SaveAndExecuteNode()<CR>
imap <silent> <f7> :<C-u>call SaveAndExecuteNode()<CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>
nnoremap <silent> <C-Up> :resize +2<CR>
nnoremap <silent> <C-Down> :resize -2<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Quick quit
nnoremap <leader>q :q<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Exit to terminal Normal-mode.
tnoremap <leader>n <C-\><C-n>

" NERDTree specific mappings.
" Map the ± key to toggle NERDTree open and close.
nnoremap <silent> ± :NERDTreeToggle<CR>

" }}}

" COC SETTINGS  ---------------------------------------------------------------- {{{

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
    inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <ctrl-tab> to trigger on/off completion
    inoremap <silent><expr> <Esc>[1;5I coc#pum#visible() ? coc#pum#stop() : coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Custom Addition

" Function to toggle the diagnostic float window
function! ToggleDiagnosticFloat() abort
    " Use `get()` to safely access g:diagnostic_float_open with a default value
    let l:is_open = get(g:, 'diagnostic_float_open', 0)

    if l:is_open
        call coc#float#close_all()
    else
        call CocActionAsync('diagnosticInfo')
    endif

    " Toggle the state
    let g:diagnostic_float_open = !l:is_open
endfunction

" Map to toggle the diagnostic float window
nnoremap <silent> <leader>d :call ToggleDiagnosticFloat()<CR>

" }}}

" GENERAL VIM SCRIPT ---------------------------------------------------------------- {{{

" Inspect $TERM instead of hardcoding t_Co=256.
if &term =~ '256color'
  " Enable true (24-bit) colors instead of (8-bit) 256 colors.
  " :h true-color
  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    set background=dark
    colorscheme onedark 
  endif
endif

" Pum completions colors
hi CocMenuSel ctermbg=39 guibg=#000000
hi CocSearch ctermfg=12 guifg=#F16B0F

" Auto-resize splits when Vim get resized.
function! ResizeWindows()
    let savetab = tabpagenr()
    tabdo wincmd =
    execute 'tabnext' savetab
endfunction
autocmd VimResized * call ResizeWindows()

augroup FiletypeSettings
    autocmd!
    " Enable the marker method of folding.
    autocmd FileType vim setlocal foldmethod=marker
    " If the current file type is HTML, set indentation to 2 spaces.
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

augroup PythonFile
    autocmd!
    " Remove trailing whitespace from Python files on save.
    autocmd BufWritePre *.py :%s/\s\+$//e
    " Remove blank lines at the end of the file.
    autocmd BufWritePre *.py :%s/\(\n\)\+\%$//e
augroup END

" }}}

" NERDTREE EXPLORER ---------------------------------------------------------------- {{{

" Hide nerdtree statusline
let g:NERDTreeStatusline= -1
" Show hidden files
let g:NERDTreeShowHidden = 1
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Group autocommands for NERDTree cursorline handling
augroup NERDTreeCursorLine
    autocmd!
    " If filetype is (i.e if we focused on) NERDTree show cursorline
    autocmd BufEnter * if &filetype == 'nerdtree' | setlocal cursorline | endif
    " If filetype is not NERDTree hide cursorline
    autocmd BufLeave * if &filetype == 'nerdtree' | setlocal nocursorline | endif
augroup END

" Exit Vim/Close Tab when NERDTree is the last window left
augroup NERDTreeExitVim
    autocmd!
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
augroup END
" }}}

" RUN PYTHON & NODE SCRIPT ---------------------------------------------------------------- {{{

" #####RUN PYTHON IN BUFFER WITH F5 #####
" https://stackoverflow.com/questions/18948491/running-python-code-in-vim
function! SaveAndExecutePython() abort
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    " setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    set laststatus=0
    setlocal readonly
    setlocal nomodifiable
    if (line('$') == 1 && getline(1) == '')
      q!
    endif
    silent execute 'wincmd p'
endfunction

" #####RUN NODE IN BUFFER WITH F7 #####
" https://stackoverflow.com/questions/18948491/running-python-code-in-vim
function! SaveAndExecuteNode() abort
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Node"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    " setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!node " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    set laststatus=0
    setlocal readonly
    setlocal nomodifiable
    if (line('$') == 1 && getline(1) == '')
      q!
    endif
    silent execute 'wincmd p'
endfunction

" }}}

" STATUS LINE ---------------------------------------------------------------- {{{

" Always display the status line
set laststatus=2

" Initialize variables to store git branch name and number of changes
let g:git_branch = ''
let g:git_files_changed = 0

" Configuration for the Lightline plugin
let g:lightline = {
\   'colorscheme': 'solarized',  
\   'active': {
\    'left' :[ [ 'mode', 'paste' ],  
\              [ 'readonly', 'filename', 'modified' ],  
\              [ 'gitstatus', 'gitcurrentchanges' ]  
\            ],
\    'right':[ [ 'percent', 'lineinfo' ],  
\              [ 'filetype' ],  
\              [ 'cocstatus_error', 'cocstatus_warning', 'cocstatus_info', 'cocstatus_hint' ]  
\            ]
\   },
\   'separator': {
\     'left': '', 'right': ''  
\   },
\   'subseparator': {
\     'left': '', 'right': ''  
\   },
\   'component_function': {
\     'mode': 'LightlineMode', 
\     'percent': 'LightlinePercent',
\     'filename': 'LightlineFilename',
\     'lineinfo': 'LightlineLineinfo',  
\     'readonly': 'LightlineReadonly',  
\     'modified': 'LightlineModified',  
\     'filetype': 'LightlineFiletype',  
\     'gitstatus': 'LightlineGitInfo',
\     'gitcurrentchanges': 'GetCurrentGitChanges'
\   },
\   'component_expand': {
\     'cocstatus_error': 'LightlineDiagnosticError',  
\     'cocstatus_warning': 'LightlineDiagnosticWarning',  
\     'cocstatus_hint': 'LightlineDiagnosticHint',  
\     'cocstatus_info': 'LightlineDiagnosticInfo',
\   },
\   'component_type': {
\     'cocstatus_error': 'error',  
\     'cocstatus_warning': 'warning',  
\     'cocstatus_info': 'info',  
\     'cocstatus_hint': 'hint',
\   }
\}

" Helper function to get diagnostic count with icon
function! s:GetDiagCountWithIcon(type, icon)
    let l:info = get(b:, 'coc_diagnostic_info', {})
    return has_key(l:info, a:type) && l:info[a:type] > 0 ? a:icon . ' ' . l:info[a:type] : ''
endfunction

" Refactored functions using helper
function! LightlineDiagnosticError() abort
    return s:GetDiagCountWithIcon('error', '')
endfunction

function! LightlineDiagnosticWarning() abort
    return s:GetDiagCountWithIcon('warning', '')
endfunction

function! LightlineDiagnosticInfo() abort
    return s:GetDiagCountWithIcon('information', '')
endfunction

function! LightlineDiagnosticHint() abort
    return s:GetDiagCountWithIcon('hint', '')
endfunction

" Function for filename section in Lightline
function! LightlineFilename()
    if &filetype == 'nerdtree'
        return 'NERDTree'
    elseif &buftype == 'terminal'
        return 'Terminal'
    endif
    return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" Function to get line information for Lightline
function! LightlineLineinfo() abort
    if index(['nerdtree', 'gitcommit'], &filetype) != -1 || &buftype == 'terminal' || winwidth(0) < 76
        return ''
    endif
    return line('.') . '/' . line('$')
endfunction

" Function to display the percent component for Lightline
function! LightlinePercent() abort
    if index(['nerdtree', 'gitcommit'], &filetype) == -1 && &buftype != 'terminal'
        return line('.') * 100 / line('$') . '%'
    endif
    return ''
endfunction

" Function to indicate if the buffer is modified
function! LightlineModified() abort
    return &buftype != 'terminal' && &modified ? '●' : ''
endfunction

" Function to display the mode for Lightline
function! LightlineMode() abort
    if &filetype == 'nerdtree'
        return ''
    elseif &buftype == 'terminal'
        return ''
    endif
    return lightline#mode()
endfunction

" Function to display read-only status for Lightline
function! LightlineReadonly() abort
    return &readonly ? get({'nerdtree': ''}, &filetype, '') : ''
endfunction

" Function to display file type for Lightline
function! LightlineFiletype() abort
    if index(['nerdtree'], &filetype) != -1 || &buftype == 'terminal'
        return ''
    endif

    if !exists('*WebDevIconsGetFileTypeSymbol')
        return &filetype
    endif

    let l:icon = WebDevIconsGetFileTypeSymbol()
    return winwidth(0) > 76 ? (&filetype . ' ' . l:icon) : l:icon
endfunction

" Function to update the Lightline status line
function! UpdateLightline() abort
    call lightline#update()
endfunction

" Function to get the current git branch
function! GetCurrentGitBranch() abort
    let l:head = FugitiveHead()
    return empty(l:head) ? '' : " \uf126 " . l:head
endfunction

" Function to check if the current directory is a git repository
function! IsGitRepo() abort
    let l:current_dir = expand('%:p:h')
    let l:git_check = systemlist('git -C ' . l:current_dir . ' rev-parse --is-inside-work-tree 2>/dev/null')
    return !empty(l:git_check) && l:git_check[0] ==# 'true'
endfunction

function! GetCurrentGitChanges() abort
    if index(['nerdtree', 'gitcommit'], &filetype) != -1 || &buftype == 'terminal' || empty(g:git_branch)
        return ''
    endif
    
    let [a, m, r] = GitGutterGetHunkSummary()
    return a + m + r > 0 ? printf('[+%d ~%d -%d]', a, m, r) : ''
endfunction

function! ClearGitStatus()
    let g:git_branch = ''
    let g:git_files_changed = 0
    call lightline#update()
endfunction

" Function to update git information
function! UpdateGitInfo() abort
    if index(['help', 'quickfix', 'nofile', 'terminal'], &buftype) != -1 || &filetype == 'gitcommit'
        call ClearGitStatus()
        return
    endif

    if executable('git') && IsGitRepo()
        let new_branch = GetCurrentGitBranch()
        let new_changes = GetGitFilesChanged()
        if new_branch != g:git_branch || new_changes != g:git_files_changed
            let g:git_branch = new_branch
            let g:git_files_changed = new_changes
            call lightline#update()
        endif
    else
        call ClearGitStatus()
    endif
endfunction

" Function to get the number of files changed but not committed to git
function! GetGitFilesChanged() abort
    return len(filter(systemlist('git -C ' . expand('%:p:h') . ' status --porcelain 2>/dev/null'), 'v:val !=# ""'))
endfunction

" Function to display git information in Lightline
function! LightlineGitInfo() abort
    if index(['nerdtree', 'gitcommit'], &filetype) != -1 || &buftype == 'terminal'
        return ''
    endif
    return (g:git_files_changed > 0 ? '+' . g:git_files_changed : '') . g:git_branch
endfunction

augroup GitIntegration
    autocmd!
    autocmd BufEnter,TabEnter,BufWritePost * call UpdateGitInfo()
augroup END

augroup CocDiagnostic
    autocmd!
    autocmd User CocDiagnosticChange call UpdateLightline()
augroup END

" }}}
