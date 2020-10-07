let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'

if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path . 
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugins')
    Plug 'tpope/vim-fugitive'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'ghifarit53/tokyonight.vim'
    Plug 'embark-theme/vim', { 'as': 'embark' }

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'ryanoasis/vim-devicons'
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

" colorscheme deus
set termguicolors
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
let g:tokyonight_disable_italic_comment = 1
colorscheme tokyonight

set number
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=UTF-8

let mapleader = ","

imap jj <ESC>
imap jk <ESC>

nnoremap <leader>w :w<ESC>
nnoremap <leader>q :q<ESC>
nnoremap <leader>c :tabc<ESC>
nnoremap <leader>e :tabn<ESC>
nnoremap <leader>p :tabp<ESC>
nnoremap <leader>b :bn<ESC>

nnoremap E $
nnoremap B ^ 
nnoremap j gj
nnoremap k gk

nnoremap <C-p> :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <leader>fu :CocCommand fzf-preview.ProjectMruFiles<CR>
nnoremap <leader>fgr :CocCommand fzf-preview.ProjectGrep<Space>

nnoremap <leader>fb :CocCommand fzf-preview.Buffers<CR>
nnoremap <leader>fa :CocCommand fzf-preview.AllBuffers<CR>

nnoremap <leader>fm :CocCommand fzf-preview.Bookmarks<CR>

nnoremap <leader>fgf :CocCommand fzf-preview.GitFiles<CR>
nnoremap <leader>fga :CocCommand fzf-preview.GitActions<CR>
nnoremap <leader>fgs :CocCommand fzf-preview.GitStatus<CR>
nnoremap <leader>fpr :CocCommand fzf-preview.BlamePR<CR>

" map <C-n> :NERDTreeToggle<CR>
map <C-n> :CocCommand explorer --width 30<CR>

" reload config file
nnoremap <leader>0 :source ~/.config/nvim/init.vim<CR>

" highlight! EndOfBuffer ctermfg=bg ctermbg=bg guibg=bg guifg=bg

autocmd FileType python map <buffer> <leader>; :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

let g:airline_theme='base16'
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_use_dev_icons = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile

