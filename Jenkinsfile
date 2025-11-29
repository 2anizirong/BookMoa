node {
	def app
	stage('Clone repository') {
		git 'https://github.com/2anizirong/BookMoa.git'
	}
	stage('Build image') {
		app = docker.build("kimian/test")
	}
	stage('Test image') {
		app.inside {
			sh 'make test'
		}
	}
	stage('Push image') {
		docker.withRegistry('https://registry.hub.docker.com', 'kimian') {
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
	}
}
