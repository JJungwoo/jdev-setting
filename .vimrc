
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
set ruler			" 오른쪽 하단에 현재 위치의 행, 열 표시
set fileencodings=utf8,euc-kr	" 파일 인코딩
syntax on			" 문법 강조 기능

" 라인 끝에 있는 공백문자 보이게 설정
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" 특정 파일 타입에 따라 저장할 때 라인 끝 공백문자 제거
autocmd FileType c,cpp,java,python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

set tags=$PWD/tags	" 현재 디렉토리의 ctags 설정

" cscope 파일 설정
if filereadable("./cscope.out")
  cs add cscope.out
endif
set csverb

