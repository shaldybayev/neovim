call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'sickill/vim-monokai'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'othree/html5.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim', {'branch': 'main', 'tag': 'one-dark-warm'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-tree/nvim-web-devicons' " для иконок файлов
Plug 'wfxr/minimap.vim'
Plug 'preservim/tagbar'
Plug 'thalib360/vim-live-server'
" Using Vim-Plug
Plug 'navarasu/onedark.nvim'
"Plug 'tpope/vim-django'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'terryma/vim-smooth-scroll'
call plug#end()

"bufferline
lua << EOF
require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant", -- стиль разделителя, можно поменять на "thin", "slant", или другой
    show_buffer_close_icons = true,
    show_close_icon = false,
    always_show_bufferline = true,
  }
}
EOF

nnoremap <silent> <Tab> :BufferLineCycleNext<CR>
nnoremap <silent> <S-Tab> :BufferLineCyclePrev<CR>

"MinimapToggle 
let g:minimap_width = 10  " Ширина мини-карты
let g:minimap_auto_start = 1  " Автозапуск мини-карты
let g:minimap_auto_start_win_enter = 1
"Клавиша F8 вкл/выкл minimap
"nnoremap <F8> :MinimapToggle<CR>

" Tagbar
nnoremap <F7> :TagbarToggle<CR>

" StartLiveServer
command! StartLiveServer !live-server %:p:h

" Автосохранение через определённое время (например, 2 секунды)
set updatetime=2000  " время в миллисекундах
autocmd CursorHold,CursorHoldI * silent! write

let g:indentLine_char = '┆'   " Символ для отображения полосок отступа
let g:indentLine_enabled = 1   " Включение плагина

" Привязка F5 для запуска текущего JavaScript файла
"autocmd FileType javascript nnoremap <buffer> <F5> :w<CR>:!node %<CR>

" Привязка F5 для запуска JavaScript (Node.js)
autocmd FileType javascript nnoremap <buffer> <F5> :w<CR>:!node %<CR>

" Привязка F5 для запуска Bash-скриптов
autocmd FileType sh nnoremap <buffer> <F5> :w<CR>:!bash %<CR>

" Привязка F5 для запуска Python
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python %<CR>


"colorschemes
"colorscheme monokai
colorscheme onedark
"colorscheme onedark-warm


syntax on
syntax enable

filetype plugin indent on
set background=dark
set number
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set noshowmode
set colorcolumn=79

inoremap qw <esc>

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
inoremap <C-o>( (
inoremap <C-o>[ [
inoremap <C-o>{ {
inoremap <C-o>' '
inoremap <C-o>" "


"Активируйте плагин после загрузки плагинов
autocmd VimEnter * CocStart
autocmd FileType javascript,json,yaml,yml,lua,html,typescript,tsx,css,scss,lua setl formatexpr=CocAction('formatSelected')

" Prettier
let g:prettier#config#autoformat = 1
let g:prettier#config#arrow_parens = 'always'

autocmd BufWritePre *.js,*.jsx,*.json,*.yaml,*.scss,*.md,*.vue,*.html Prettier
let g:prettier#exec_cmd_path = 'usr/local/bin/prettier'

" Активация Colorizer
autocmd VimEnter * silent! lua require'colorizer'.setup()
autocmd FileType css,scss,html,vue,js silent! ColorizerAttachToBuffer

" Включить автокомплит тегов при вводе
let g:html5_close_autocomment = 1
let g:html5_event_handler = "1"
" Дополнительные настройки для подстветки синтаксиса HTML
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
" Дополнительные настройки для CSS
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab


set list
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
"mappings

map <C-n> :NERDTreeToggle<CR>

" EMMET config
let g:user_emmet_leader_key=','

" Переназначение клавиш для Emmet
nmap <C-y>,/ <Plug>(emmet-comment)


" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e




"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


highlight LspCxxHlSymField guifg=#E06C75
highlight LspCxxHlSymNamespace guifg=#E06C75



" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Переназначить ключи 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Разделение настроек окон
set splitright
set splitbelow




" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
