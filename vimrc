set number
set rnu
syntax on
set mouse=a
set wildmenu
let g:user42 = 'cgross'
let g:mail42 = 'cgross@student.42lausanne.ch'
imap jj <Esc>

set clipboard=unnamed " yank (and put) accross windows

call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'NLKNguyen/papercolor-theme'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'vim-airline/vim-airline'
Plug 'blueyed/vim-diminactive'
Plug 'frazrepo/vim-rainbow'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'
Plug 'vim-syntastic/syntastic'
call plug#end()

let g:cpp_member_highlight = 1

"Papercolor options
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

"vim rainbow
let g:rainbow_active = 1
"
"syntastic
let g:syntastic_always_populate_loc_list = 1
" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['gcc'] "add norminette back
let g:syntastic_aggregate_errors = 1

" Set the path to norminette (do no set if using norminette of 42 mac)
let g:syntastic_c_norminette_exec = 'norminette'

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']

" Pass custom arguments to norminette (this one ignores 42header)
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'

" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 1

 "C++ Class Generator
 function! Class(ClassName)
    "==================  editing header file =====================
     let header = a:ClassName.".hpp"
     :vsp %:h/.h
     call append(0,"#ifndef ".toupper(a:ClassName)."_HPP")
     call append(1,"#define ".toupper(a:ClassName)."_HPP")
     call append(2," ")
     call append(3,"class ".a:ClassName )
     call append(4, "{")
     call append(5, "   public:")
     call append(6, "      ".a:ClassName."();")
     call append(7, "      virtual ~".a:ClassName."();")
     call append(8, "   protected:")
     call append(9, "   private:")
     call append(10, "};")
     call append(11,"#endif // ".toupper(a:ClassName)."_HPP")
     :execute 'write' header
   "================== editing source file ========================
     let src    = a:ClassName.".cpp"
     :vsp %:h/.cpp
     call append(0,"#include ".a:ClassName.".hpp")
     call append(1," ")
     call append(2,a:ClassName."::".a:ClassName."()")
     call append(3,"{")
     call append(4,"//constructor ")
     call append(5,"}")
     call append(6," ")
     call append(7," ")
     call append(8,a:ClassName."::~".a:ClassName."()")
     call append(9,"{")
     call append(10,"//destructor ")
     call append(11,"}")
     :execute 'write' src
endfunction

set background=dark
colorscheme PaperColor
