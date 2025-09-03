pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/seshuadi969/deployer.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t deployer-app .'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh '''
                    # Remove old container if it exists
                    if [ "$(docker ps -aq -f name=deployer-container)" ]; then
                      docker rm -f deployer-container
                    fi

                    # Run new container on port 9090 (host) -> 8080 (container)
                    docker run -d -p 9090:8080 --name deployer-container deployer-app
                    '''
                }
            }
        }
    }
}
