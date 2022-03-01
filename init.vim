set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

syntax on

" require a lua file
"lua require("plugins")
"lua require("mappings")

"source ~/.vimrc
"======================================================
                    "MISC TIPS"
"======================================================
":mertical resize +10 or -10 to resize vertical splits 
":source % to reload the .vrimrc file and to see changes any configuration changes immediately 
":below terminal to open a terminal in a horizontal split
":checkhealth to see if there are any missing packages (nvim)
"
" To Comment Out Multiple Lines
" ctrl + v to begin selection
" number of lines to select (ex: 10j)
" shift + i to insert the commment character (ex #)
" esc to apply to all lines
" 
" To jump to a variable/functions definition, go to the start of the word and
" then type 'gd'. It will highlight the first occurance of it
"
"======================================================
                "CUSTOM KEY REBINDS
"=====================================================
"imap jj <Esc>""
"**VERTICAL SPLIT KEYBINDS
"in macOS Ctrl+Down is already mapped to 'application windows' 
"(under the mission control section of keyboard shortcuts) disable mac shortcut to use c-down
nnoremap <silent> <C-down> :vertical resize +3 <CR>
nnoremap <silent> <C-up> :vertical resize -3 <CR>

"**copy selected text to the system clipboard with shift + y
nnoremap Y "+y
vnoremap Y "+y
nnoremap yY ^"+y$
nnoremap <silent> <C-b> :NERDTreeToggle <CR>
nnoremap <silent> <C-`> :below terminal <CR>
xnoremap <Leader>r :s///gc<Left><Left>
" ensures that nerdtree (file tree) reloads automatically when focusing it
autocmd BufEnter NERD_tree_* | execute 'normal R'
" ensures clear highlighting on esc from using * to highlight all instances of
" a word
nnoremap <esc> :nohl<Enter>
"=======================================================
            "VIM DEFAULT SYSTEM SETTINGS
"======================================================
set noerrorbells "removes annoying error sounds"
set belloff=all
set tabstop=2 
set softtabstop=2
"controls how many spaces text will shift when using (shift + << or shift + >>)
set shiftwidth=2
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set breakindent
set splitright "automatically splits vertial splits to the right"
set guioptions+=a
set relativenumber
" ensures terminals hide instead of exit
set hidden

"=======================================================
                "VIM-PLUG PLUGINS
            "(TO INSTALL RUN ':PlugInstall')
"=======================================================
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'git@github.com:kien/ctrlp.vim.git' 
    Plug 'preservim/nerdtree'
    "ruby syntax highlighting and snippets
    Plug 'vim-ruby/vim-ruby'
    Plug 'morhetz/gruvbox'
    "js and react syntax highlighting
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'https://github.com/tpope/vim-rails.git'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'honza/vim-snippets'
    Plug 'vim-airline/vim-airline'
    Plug 'alvan/vim-closetag'
    Plug 'akinsho/toggleterm.nvim'
call plug#end()


"========================================================
                "MISC CONFIGURATION
"========================================================
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = '0'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:ctrlp_custom_ignore = 'node_modules'


"========================================================
                    "COC CONFIG
"(to install each of the extensions, add an extension to the list
"and relaunch vim or type :CocInstall followed by the each extension name)
"=========================================================
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-snippets',
    \ ]

"========================================================
                    "MISC TWEAKS
"MAKE SNIPPETS TAB AUTO COMPLETE LIKE VS CODE START
"========================================================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"MAKE SNIPPETS TAB AUTO COMPLETE LIKE VS CODE END

"=========================================================
"VIM-CLOSETAG CONFIG
"========================================================
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html.erb, *.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.js,*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


"=========================================================
            "DO SOMETHING WHEN VIM STARTS
"=========================================================
"autocmd VimEnter * NERDTree 
autocmd Vimenter * ++nested colorscheme gruvbox
"colorscheme atom-dark-256
