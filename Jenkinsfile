node {
	def app
	stage('Clone repository') {
		git 'https://github.com/2anizirong/BookMoa.git'
	}
	stage('Build image') {
		app = docker.build("kimian/test", "-f dockerfiles/Dockerfile .")
	}
	stage('Test image') {
		steps {
     			// 빌드된 이미지를 사용하여 직접 npm test 명령을 실행
        		sh "docker run --rm kimian/test npm test"
    }
	}
	stage('Push image') {
		docker.withRegistry('https://registry.hub.docker.com', 'kimian') {
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
	}
}
