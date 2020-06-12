" File              : init.vim
" Date              : 10.06.2020
" Last Modified Date: 10.06.2020

" func! config#after() abort
"     let g:ycm_global_ycm_extra_conf='/Users/neo/.cache/vimfiles/repos/github.com/grailbio/bazel-compilation-database/.ycm_extra_conf.py'
"     let g:ycm_server_python_interptreter='/Users/neo/.pyenv/shims/python3'
"     set norelativenumber
" endf

function! init#init() abort
    let g:neomake_open_list = 2
    let g:neomake_logfile = '/tmp/neomake.log'

    " custom key mapping
    call SpaceVim#custom#SPC('nnoremap', ['f', 'o'], ':Unite outline', 'Unite outline', 1)
    call SpaceVim#custom#SPC('nnoremap', ['f', 't'], ':VimFilerBufferDir', 'Toggle vimfiler', 1)
    call SpaceVim#custom#SPCGroupName(['k'], 'MyPlugin')
    call SpaceVim#custom#SPC('nnoremap', ['k', 'f'], ':SyncFile', 'Synchronize file', 1)
    call SpaceVim#custom#SPC('nnoremap', ['k', 'r'], ':SyncRepo', 'Synchronize repo', 1)
    call SpaceVim#custom#SPC('nnoremap', ['l', 't'], ':Pytest function', 'Pytest function', 1)

    "deoplete
    " let g:python3_host_prog = "/Users/neo/.pyenv/shims/python3"
    " let g:python2_host_prog = "/Users/neo/.pyenv/shims/python2"
    " ycm config
    let g:ycm_global_ycm_extra_conf = "/Users/neo/.cache/vimfiles/repos/github.com/grailbio/bazel-compilation-database/.ycm_extra_conf.py"
    let g:ycm_filetype_whitelist = {
                \ "c":1,
                \ "cpp":1,
                \ "h":1,
                \ "sh":1,
                \ "python":0,
                \ "zsh":1,
                \ }
    let g:ycm_show_diagnostics_ui = 0
    set completeopt=menu,menuone
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }
    " python highlight setting
    let g:python_highlight_all = 1
    " key mapping
    inoremap <C-f> <Right>
    inoremap <C-b> <Left>
    :set wrap
    " set numpy style for honza/vim-snippets
    let g:ultisnips_python_style = "numpy"
    " automately add the file head for alpertuna/vim-header
    "
    let g:header_auto_add_header = 0
    let g:header_max_size = 20
    let g:header_field_modified_timestamp = 0
    let g:header_field_author = 'Neo'
    let g:header_field_author_email = 'neo@neo1989.net'
    let g:header_field_timestamp_format = '%Y-%m-%d'
    " insert timestamp
    nmap <F4> i<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
    imap <F4> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
    " setting the lightline theme
    let g:lightline = {
                \ 'colorscheme': 'powerline',
                \ }
    " setting for neomake
    let g:neomake_python_enabled_makers = ['flake8']
    " setting the column color
    " set colorcolumn=100
    " setting for c language to avoid a bug Spacevim issue num: #1473
    let g:clamp_autostart = 0
    " jedi-vim
    let g:pymode_rope = 0
    let g:jedi#completions_enabled = 0
    let g:jedi#show_call_signatures = "2"
    let g:jedi#use_splits_not_buffers = "left"
    " expand region

    " map + <Plug>(expand_region_expand)
    " map _ <Plug>(expand_region_shrink)

    " gruvbox theme setting contrast
    set termguicolors
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_contrast_light = "hard"
    " tagbar setting
    " ultisnip setting, This is important to the plugin blow
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-p>'
    " tenfyzhong/CompleteParameter.vim setting, need ultisnip modigied key
    " mapping
    inoremap <silent><expr> ( complete_parameter#pre_complete("()")
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    " set relativenumber
    let g:spacevim_relativenumber = 0
    set relativenumber
    " set ericcurtin/CurtineIncSw.vim
    map <F5> :call CurtineIncSw()<CR>
    " AsyncRun setting
    let g:asyncrun_open = 6
    let g:asyncrun_bell = 1
    nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
    " nnoremap <silent> <F9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    " disable Raimondi/delimitMate and use jiangmiao/auto-pairs
    let loaded_delimitMate = 0


    " disable beep
    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=


    set showcmd             " 显示命令
    set backspace=eol,start,indent
    set incsearch       " 增量式搜索
    set hlsearch        " 高亮搜索
    set ignorecase      " 搜索时忽略大小写
    set magic           " 额，自己:h magic吧，一行很难解释
    set showmatch       " 显示匹配的括号
    set nobackup        " 关闭备份
    set nowritebackup
    set noswapfile      " 不使用swp文件，注意，错误退出后无法恢复
    set linebreak       " 在breakat字符处而不是最后一个字符处断行
    set cindent         " C/C++风格缩进
    set wildmenu    
    "set so=7
    "set signcolumn=auto
    set hidden
    set cmdheight=2
    set updatetime=300
    set shortmess+=c
    "set mouse=''

    set number              " 显示行号
    set relativenumber

    set ruler
    set cursorline
    set cursorcolumn

    " tab转化为4个字符
    set expandtab
    set smarttab
    set softtabstop=4
    set shiftwidth=4
    set tabstop=4
    set autoread     " 当文件在外部被修改时，自动重新读取

    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " insert mode
    imap <C-j> <Down>
    imap <C-k> <Up>
    imap <C-b> <Left>
    imap <C-f> <Right>

    highlight NonText ctermbg=NONE
    highlight Normal guibg=NONE ctermbg=NONE

    "  NERDTree
    " let NERDTreeQuitOnOpen = 1
    let g:nerdtree_tabs_open_on_console_startup=1
    let g:NERDChristmasTree=1
    let g:NERDTreeShowHidden          = 0
    let g:NERDTreeBookmarksFile       = $HOME.'/.vim/data/NerdBookmarks.txt'
    let g:NERDTreeShowBookmarks       = 1
    let g:NERDTreeShowFiles           = 1
    let g:NERDTreeShowLineNumbers     = 1
    let g:NERDTreeWinSize             = 30
    let g:NERDTreeMinimalUI           = 0
    let g:NERDTreeIgnore              = [
                \ '.*\.class',
                \ '.*\.pyc',
                \ '.*\.chm',
                \ '.*\.ttf',
                \ '.*\.lnk',
                \ '.*\.cproj',
                \ '.*\.exe',
                \ '.*\.dll',
                \ '.*\.out',
                \ '.*\.files',
                \ '.*\.zip',
                \ '.*\.rar',
                \ '.*\.gif',
                \ 'node_modules'
                \ ]
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
                \ }
    nmap tn :NERDTreeToggle<CR>
    "
    " NERDTress File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

    " TagBar
    let g:tagbar_width = 40
    nmap tb :TagbarToggle<CR>
    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }
endfunction
