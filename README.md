# jdev-setting
my development environment setting repo

### 설치 방법

```
$ chmod +x install.sh
$ ./install.sh
```

이후에 vi 편집기 열어서 아래 명령어 실행하여 vim plugin 설치

```
$ vi
:PluginInstall
```

### 설치 내용 설명

- vim, ctags, cscope 설치
- vundle 설치
- vimrc 설정
- root/home/bin 디렉터리 생성
  - bin : 사용자 명령어 모음 디렉터리
- bin 디렉터리에 사용자 명령어 추가
- 사용자 커스텀 명령어 현재 유저 스크립트에 추가

### 추가할 내용
- 사용자 커스텀 명령어 추가
	- git 명령어 축약
	- 시스템 명령어 축약
	- 모니터링 명령어 축약
- vim plugin 설정 추가하기
	- nerdcommenter
	- youcompleteme

