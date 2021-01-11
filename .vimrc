
set autoread		" 현재 사용하는 파일을 다른곳에서 오픈할 때 자동으로 읽기로 설정
set nowrapscan		" 찾기에서 파일의 맨 끝에 이르면 계속 찾지 않음
set title			" 타이틀 바에 현재 편집중인 파일 표시
set hlsearch
set nu				" 라인 번호
set autoindent		" 자동 들여쓰기
set ts=4			" 탭간격
set sts=4
set cindent			" c 자동 들여쓰기
set laststatus=4
set shiftwidth=4	" 자동 들여쓰기 간격
set showmatch		" 괄호 반대쪽 보여주기
set smartcase
set smarttab
set smartindent		" 자동 들여쓰기
set ruler			" 오른쪽 하단에 현재 커서 위치의 행, 열 표시
set fileencodings=utf8,euc-kr	" 파일 인코딩
set wmnu			" 탭 눌렀을 때 자동완성 가능한 목록 확인
set mouse=a			" 커서 이동을 마우스로 가능하게 설정
set showcmd			" 사용자가 입력한 명령어 표시
set clipboard=unnamed			" vim에서 복사한 내용 클립보드에 저장
set paste			" 복사한 내용을 붙여넣을 때, 자동 들여쓰기없이 복사
set pastetoggle=<F2>			" paste 옵션 적용 시 옵션을 온 오프하도록 설정
syntax on			" 문법 강조 기능

" 라인 끝에 있는 공백문자 보이게 설정
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

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
if filereadable("./cscope.out")
  cs add cscope.out
endif
set csverb

" setting Vundle

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

nmap <F9> :NERDTree<CR>
nmap <F10> :TlistToggle<CR>
nmap <F12> :noh<CR>
