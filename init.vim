:set shell=zsh
":!/home/bishan/.zshrc

call plug#begin(stdpath('data') . '/plugged') 
" General

Plug 'bishan-batel/gooselang.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'sainnhe/everforest'
Plug 'fratajczak/one-monokai-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sainnhe/edge'
Plug 'phanviet/vim-monokai-pro'
Plug 'dunstontc/vim-vscode-theme'
Plug 'tomasiser/vim-code-dark'

Plug 'camspiers/animate.vim'
"Plug 'camspiers/lens.vim'

Plug 'github/copilot.vim'


Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'voldikss/vim-floaterm'

Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/SyntaxComplete'
" Dashboard
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'glepnir/dashboard-nvim'

" IDEA IDE
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'beeender/Comrade'

" personal

Plug 'bishan-batel/banalang.vim'
Plug 'bishan-batel/bf-syntax'
Plug 'bishan-batel/celloscript'

Plug 'fladson/vim-kitty'
Plug 'bfrg/vim-cpp-modern'
Plug 'tikhomirov/vim-glsl'

" Nerd Tree
Plug 'preservim/nerdcommenter'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

" Go
"Plug 'fatih/vim-go'

Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'sheerun/vim-polyglot'

" Rust
Plug 'pest-parser/pest.vim'
Plug 'cespare/vim-toml'

" Java
Plug 'uiiaoo/java-syntax.vim'

" Web Development
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
"Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'trkw/yarn.vim'
Plug 'mboughaba/i3config.vim'

call plug#end()

" Map Leader -------------------------------------------------------------------
let mapleader = "m"

" Theming ----------------------------------------------------------------------
autocmd vimenter * ++nested colorscheme dark_plus

" Palenight
let g:airline_theme = "codedark"
let g:palenight_terminal_italics=1

" Everforest
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_transparent_background = 0
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_better_performance = 1

" One Monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Edge
let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 0
let g:edge_transparent_background = 0
let g:edge_current_word = 'bold'

if has('termguicolors')
    set termguicolors
endif


" Custom Commands
command! -nargs=0 Config source ~/.config/nvim/init.vim | :echom "Resourced from ~/.config/nvim/init.vim"
command! -nargs=0 EditConfig tabedit ~/.config/nvim/init.vim 
command! -nargs=0 Jojo echo "Hi Jojo\n\n\n\n\n:)"
command! -nargs=0 JOJO Jojo
command! -nargs=0 Funny echo "\n\n\n\n\n\n\n\n\n\nFUNNY NUMBER 69 420 FUNNY\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

nnoremap <leader><S-c> :nohl<CR><C-l>


"----- Dashboard ----------------------
let g:dashboard_default_executive ='clap'
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'm s l',
\ 'find_history'       : 'm f h',
\ 'find_file'          : 'm f f',
\ 'new_file'           : 'm c n',
\ 'change_colorscheme' : 'm t c',
\ 'find_word'          : 'm f a',
\ 'book_marks'         : 'm f b',
\ }

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR> nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
      \'     ⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
      \'   ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
      \'   ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
      \'   ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
      \'   ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
      \'   ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
      \'   ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
      \'   ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
      \'   ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
      \'   ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
      \'   ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
      \'   ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
      \'   ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  ',
      \ ]



autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" Only starts dashboard if no file was specified
function DashboardIfEmpty() 
    if @% == ""
        Dashboard
    else
        NERDTree
    endif
endfunction
autocmd VimEnter * call DashboardIfEmpty()



"----- Neovide ------------------------
source $VIMRUNTIME/mswin.vim
let g:neovide_cursor_vfx_mode = "ripple"
let g:neovide_transparency=0.96

function OpenNeovide()
    :!neovide .
    :qa!
endfunction

command! -nargs=0 Neovide call OpenNeovide()

"set guifont=monospace:18
"set guifont=FantasqueSansMono\ Nerd\ Font\ Mono:h16
set guifont=agave:h15

" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>



" Airline
let g:airline_powerline_fonts = 1

"-----Nerd Tree-----------------------------------------
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'

let g:NERDTreeWinPos = "right"

" Start NERDTree and put the cursor back in the other window.

nnoremap <C-b> :NERDTreeToggle<CR>
"nnoremap <C-b> :Hexplore <CR>

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"----- Tabs ------
nnoremap <leader><S-n> :tabnew<CR>

nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>

noremap <leader><S-h>  :-tabmove<cr>
noremap <leader><S-l> :+tabmove<cr>

"--------Coc-----------------------
command! -nargs=0 Format :call CocAction('format')
nnoremap <leader><f> :Format

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

set updatetime=300



if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else 
    set signcolumn=yes
endif
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
nmap <leader><f> :Fold

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" GoTo code navigation.
nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" JSX Highlighting 
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" -----------------------------------------------------------------------------
"  YATS (Typescript highlighter)
" -----------------------------------------------------------------------------
let g:yats_host_keyword = 1
set re=0

"let g:typescript_conceal_function             = "ƒ"
let g:typescript_conceal_null                 = "ø"
let g:typescript_conceal_undefined            = "¿"
let g:typescript_conceal_this                 = "@"
let g:typescript_conceal_return               = "⇚"
let g:typescript_conceal_prototype            = "¶"
let g:typescript_conceal_super                = "Ω"

set conceallevel=1 
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Code Folders
command! -nargs=* CF cd ~/code/<args> | :NERDTree | CD | :windcmd H 
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" GLSL 
" -----------------------------------------------------------------------------
set omnifunc=glsl#CompleteFunc
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Hexdump
" -----------------------------------------------------------------------------
command! -nargs=0 Hex set ft=xxd | :%!xxd
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Terminal 
" -----------------------------------------------------------------------------
command! -nargs=* T :sp | :wincmd J | term <args>
set shell=/usr/bin/zsh
" -----------------------------------------------------------------------------

:tnoremap <Esc> <C-\><C-n>

" -----------------------------------------------------------------------------
" Carbon
" -----------------------------------------------------------------------------
let g:carbon_now_sh_options = { 
  \ 'ln': 'true',
  \ 'fm': 'JetBrains Mono',
  \ 't': 'material',
  \ 'ds': 'false',
  \ 'wt': 'none',
  \ 'pv': '0',
  \ 'ph': '0',
  \ 'lh': '110%'
\}

" -----------------------------------------------------------------------------
" Copilot
" -----------------------------------------------------------------------------
let g:copilot_filetypes = {
    \ 'goose': v:true,
    \ '.goose': v:true}

let g:copilot_node_command ="~/.nvm/versions/node/v16.15.0/bin/node"

" Generic
filetype plugin indent on
syntax on
set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set expandtab
set spelllang=en_us

"set smartindent
set modifiable

set number
set rnu

set encoding=UTF-8
set showmatch
set linebreak
set ignorecase
set smartcase
"set clipboard+=unnamedplus
set mouse=a

" Spellchecker
map <leader>s :setlocal spell!<CR> 

