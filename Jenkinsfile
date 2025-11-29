node {
        def app
        stage('Clone repository') {
                git 'https://github.com/2anizirong/BookMoa.git'
        }
       stage('Build Docker image') {
            steps {
                script {
                    echo "Building Docker image..."
                    app = docker.build("kimian/test:${env.BUILD_ID}", "-f dockerfiles/Dockerfile .")
                }
            }
        }
        stage('Test image') {
            steps {
                echo "Running tests inside the image..."
                sh "docker run --rm kimian/test:${env.BUILD_ID} npm test"
            }
        }
        stage('Push image') {
                docker.withRegistry('https://registry.hub.docker.com', 'kimian') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                }
        }
}
