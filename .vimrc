
set autoread		" 현재 사용하는 파일을 다른곳에서 오픈할 때 자동으로 읽기로 설정
set nowrapscan		" 찾기에서 파일의 맨 끝에 이르면 계속 찾지 않음
set title			" 타이틀 바에 현재 편집중인 파일 표시
set hlsearch
set nu				" 라인 번호
set autoindent		" 자동 들여쓰기
set ts=4			" 탭간격
set sts=4
set cindent			" c 자동 들여쓰기
set laststatus=2	" 하단 상태 정보 보여주기(1 ~ 2)
set shiftwidth=4	" 자동 들여쓰기 간격
set showmatch		" 괄호 반대쪽 보여주기
set expandtab		" tab을 space로 변환하기
set smartcase
set smarttab
set smartindent		" 자동 들여쓰기
set ruler			" 오른쪽 하단에 현재 커서 위치의 행, 열 표시
set wmnu			" 탭 눌렀을 때 자동완성 가능한 목록 확인
set mouse=a			" 커서 이동을 마우스로 가능하게 설정
set showcmd			" 사용자가 입력한 명령어 표시
set nopaste			" 복사한 내용을 붙여넣을 때, 자동 들여쓰기없이 복사(현재 적용안된 상태 <F2> 로 적용 가능
set pastetoggle=<F2>			" paste 옵션 적용 시 옵션을 온 오프하도록 설정
set backspace=eol,start,indent	" 라인의 시작과 끝의 들여쓰기를 백스페이스로 지움
set fileencodings=utf8,euc-kr	" 파일 인코딩
set clipboard=unnamed			" vim에서 복사한 내용 클립보드에 저장

if has("syntax")
	syntax on		" 문법 강조 기능
endif

" 라인 끝에 있는 공백문자 보이게 설정 -> 다른 vim plugin 때문에 동작 안됌 -> plugin 설치로 해결
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

" 특정 파일 타입에 따라 저장할 때 라인 끝 공백문자 제거
autocmd FileType c,cpp,java,python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

" 파일 마지막 수정 커서 위치 기억한 다음 다시 파일 열면 해당 위치에서 파일 시작하도록 설정
if has("autocmd")
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal g'\"" |
	\ endif
endif

set tags=$PWD/tags	" 현재 디렉토리의 ctags 설정

" cscope 파일 설정
set nocsverb
if filereadable("./cscope.out")
    cs add cscope.out
else
    cs add $PWD/cscope.out
endif
set csverb

" setting Vundle

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'				" vim 플러그인 관리
Plugin 'scrooloose/nerdtree'				" 폴더 구조를 트리 형태로 보여줌
Plugin 'scrooloose/nerdcommenter'			" 여러줄 한번에 주석 처리
Plugin 'vim-airline/vim-airline'			" 하단 상태 메뉴 더 자세히 + 꾸미기
Plugin 'altercation/vim-colors-solarized'	" vim 편집기 바탕 및 글색 설정
Plugin 'tomasr/molokai'						" vim 편집기 molokai 스타일 변경
Plugin 'nanotech/jellybeans.vim'			" vim 편집기 jellybeans 스타일 적용
"Plugin 'valloric/youcompleteme'			" 문자 완성 도움
Plugin 'scrooloose/syntastic'				" 문법 체크
Plugin 'terryma/vim-multiple-cursors'		" 멀티 커서
Plugin 'taglist.vim'						" 매크로, 함수, 변수 등의 리스트를 정렬하여 보여줌
Plugin 'Raimondi/delimitMate'				" 괄호 자동 완성
Plugin 'SirVer/ultisnips'					" 자동 완성
Plugin 'honza/vim-snippets'
Plugin 'ntpeters/vim-better-whitespace'		" 공백 체크

Plugin 'iamcco/markdown-preview.nvim'       " Markdown Viewer

call vundle#end()

" vim 편집기 스타일 변경
color jellybeans
"colorscheme molokai

" delimitMate
let delimitMate_expand_cr=1

" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping 다중 커서
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <F7> :NERDTree<CR>
nmap <F8> <ESC>:Tlist<CR>
nmap <F12> :noh<CR>
