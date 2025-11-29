pipeline {
    // Pipeline 전체를 Node.js 이미지를 Agent로 사용하도록 설정
    agent {
        docker {
            image 'node:18-alpine'
            // Docker 데몬과의 통신을 위한 소켓 공유 설정 유지
            args '-v /var/run/docker.sock:/var/run/docker.sock' 
        }
    }
    
    // 환경 변수 블록 전체 제거

    stages {
        stage('Clone repository') {
            steps {
                // Git 인증 정보(credentialsId)를 제외한 기본 clone 명령
                // (주의: 이대로 실행하면 인증 문제로 다시 실패할 수 있습니다.)
                git 'https://github.com/2anizirong/BookMoa.git'
            }
        }

        stage('Build image') {
            steps {
                script {
                    // Dockerfile 경로 및 빌드 명령 유지
                    app = docker.build("kimian/test", "-f dockerfiles/Dockerfile .")
                }
            }
        }

        stage('Test image') {
            steps {
                // **Pipeline 에러 방지**: app.inside 대신 표준 'docker run'으로 대체
                // 빌드된 이미지 내부에서 npm test를 실행
                sh "docker run --rm kimian/test npm test"
            }
        }

        stage('Push image') {
            steps {
                // withRegistry에서 Credentials ID 제거
                // (주의: 이대로 실행하면 Docker Hub 인증 문제로 실패할 수 있습니다.)
                docker.withRegistry('https://registry.hub.docker.com') {
                    // 환경 변수 제거 후, 태그를 하드 코딩 또는 다른 방식 사용
                    app.push("latest")
                }
            }
        }
    }
}
