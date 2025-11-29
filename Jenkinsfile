pipeline {

    agent {
        docker {
            image 'node:18-alpine'

            args '-v /var/run/docker.sock:/var/run/docker.sock' 
        }
    }
    

    stages {
        stage('Clone repository') {
            steps {

                git 'https://github.com/2anizirong/BookMoa.git'
            }
        }

        stage('Build image') {
            steps {
                script {

                    app = docker.build("kimian/test", "-f dockerfiles/Dockerfile .")
                }
            }
        }

        stage('Test image') {
            steps {

                sh "docker run --rm kimian/test npm test"
            }
        }

        stage('Push image') {
            steps {

                docker.withRegistry('https://registry.hub.docker.com') {
  	              app.push("latest")
                }
            }
        }
    }
}
