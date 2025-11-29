# ----------------------------------------------------
# Node.js/BookMoa 프로젝트용 Makefile
# ----------------------------------------------------

# 프로젝트 이름 및 주요 실행 파일 (실제 실행은 npm start로 함)
PROJECT_NAME = BookMoa

# 타겟 정의: make 실행 시 'all' 타겟이 기본으로 실행됩니다.
.PHONY: all install build test start clean

# 기본 타겟: 설치, 빌드, 테스트 순으로 실행 (개발 환경 준비)
all: install build test

# -----------------
# 1. 의존성 설치 타겟
# -----------------
install:
	@echo "Installing Node.js dependencies..."
	@npm install

# -----------------
# 2. 빌드 타겟 (대부분의 Node.js 프로젝트에서는 Transpiling/Bundling에 사용)
# -----------------
# BookMoa 프로젝트가 별도의 빌드 스크립트(예: Babel, Webpack)를 사용한다면 'npm run build'로 변경
build:
	@echo "No separate build step required for this project (using direct run)."

# -----------------
# 3. 테스트 타겟
# -----------------
test:
	@echo "Running tests..."
	@npm test

# -----------------
# 4. 실행 타겟
# -----------------
start:
	@echo "Starting the application..."
	@npm start

# -----------------
# 5. 클린 타겟
# -----------------
# node_modules 디렉토리 및 로그 파일, 아웃풋 파일 제거
clean:
	@echo "Cleaning up node_modules, logs, and build artifacts..."
	@rm -rf node_modules
	@rm -f *.log
	@rm -f *.out
	@rm -f output.log
