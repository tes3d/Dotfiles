" Need to execute the PluginInstall command if this variable is settings to 1.
let is_need_plugin_install=0

" Disable viminfo file.
set viminfo=

" Disable backup files.
set nobackup

" Disable swap file creation.
set noswapfile

" Disable startup messages.
set shortmess+=I

" Set the character encoding.
set encoding=utf-8

" Display line numbers.
set number

" Set the vertical rulers.
set colorcolumn=80

" Enable extended command line completion.
set wildmenu

" Turn off IME input of insert mode at startup.
set iminsert=0

" Turn off IME input of search function at startup.
set imsearch=0

" Enable insensitive search.
set ignorecase

" Insert space characters whenever tab key is pressed.
set expandtab

" Set the number of space characters that will be inserted when tab key is
" pressed.
set softtabstop=2

" Set the number of space characters that will be inserted at the time of the
" automatic indentation.
set shiftwidth=2

" Automatically inserts one extra level of indentation in some cases.
set smartindent

" Indent even for wrapped lines.
set breakindent

" Allow opening a new file when the current buffer has unsaved changes.
set hidden

" Disable error sounds and screen flashing.
set noeb vb t_vb=

" Enable color syntax highlighting.
syntax on

" Automatically deletes whitespace at the end of each line.
au BufWritePre * :%s/\s\+$//ge

" Disable the automatic insertion of line break to end of file.
au BufWritePre * :set binary noeol

" Key maps for switching to the previous buffer.
nnoremap<Space>n :bprevious<CR>

" Key maps for switching to the next buffer.
nnoremap<Space>m :bnext<CR>

" Key maps for closing the current buffer.
nnoremap<Space>, :bdelete<CR>

" Key maps for creating the new buffer.
nnoremap<Space>. :enew<CR>

" If Vundle is not installed, getting from GitHub.
if !isdirectory($HOME.'/.vim/bundle/Vundle.vim')
  !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
  let is_need_plugin_install=1
endif

" Set the runtime path to include Vundle.
set rtp+=~/.vim/bundle/Vundle.vim

" Initialize the Vundle.
call vundle#begin()

" Let Vundle manage self.
Plugin'VundleVim/Vundle.vim'

" Let Vundle manage file finder.
Plugin'ctrlpvim/ctrlp.vim'
let ctrlp_by_filename=1
let ctrlp_cache_dir='~/.vim/cache'
let ctrlp_clear_cache_on_exit=1
let ctrlp_working_path_mode='c'

" Let Vundle manage color scheme.
Plugin'morhetz/gruvbox'

" Let Vundle manage swift syntax.
Plugin'apple/swift',{'rtp':'utils/vim','name':'swift-syntax'}
au BufRead *.swift set filetype=swift

" Let Vundle manage wonderful statusline.
Plugin'vim-airline/vim-airline'
let airline_left_sep=''
let airline_right_sep=''
let airline#extensions#tabline#enabled=1

" Finalize the Vundle.
call vundle#end()

" Execute the PluginInstall command if needed.
if is_need_plugin_install==1
  exe 'PluginInstall'
  q
endif

" Set the color scheme.
set background=dark
colorscheme gruvbox