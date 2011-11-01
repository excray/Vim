


set shiftwidth=2
set softtabstop=2
set expandtab

filetype plugin indent on

if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

    set nocompatible
    set bs=2 "set backspace to be able to delete previous characters”Enable line numbering, taking up 6 spaces
    set number

    "Turn off word wrapping
    set wrap!

    "Turn on smart indent
    set smartindent
    set tabstop=4 "set tab character to 4 characters
    set expandtab "turn tabs into whitespace
    set shiftwidth=4 "indent width for autoindent
    filetype indent on "indent depends on filetype

    "Shortcut to auto indent entire file
    nmap <F11> gg=G
    imap <F11> <ESC>1G=Ga

    "Turn on incremental search with ignore case (except explicit caps)
    set incsearch
    set ignorecase
    set smartcase

    "Informative status line
    set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

    "Set color scheme
     syntax enable

    "Enable indent folding
    "set foldenable
    "set fdm=indent

    "Set space to toggle a fold
    "nnoremap <space> za

    "Hide buffer when not in window (to prevent relogin with FTP edit)
    set bufhidden=hide

    "Have 3 lines of offset (or buffer) when scrolling
    set scrolloff=3
    let Tlist_Ctags_Cmd = "/usr/bin/ctags"
    let Tlist_WinWidth = 50
    map <F4> :TlistToggle<cr>
    map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    set tags=./tags,tags,~/Programs/llvm-2.9/tags,~/.vim/systags,~/.vim/stltags
    "map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    map <C-D> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

    " OmniCppComplete
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess = 1
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
    let OmniCpp_MayCompleteDot = 1 " autocomplete after .
    let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
    let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
    let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menuone,menu,longest,preview

    map <C-i> :set invnumber<CR>
    "set colorscheme desert 
    "set hi ctermfg=grey ctermbg=black
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

