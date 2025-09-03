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
                     # Stop old container if running
                     if [ "$(docker ps -q -f name=deployer-container)" ]; then
                       docker stop deployer-container
                     docker rm deployer-container
                      fi

                     # Run new container on port 9090 (since 8080 is taken by Jenkins)
                     docker run -d -p 9090:8080 --name deployer-container deployer-app
                     '''

                }
            }
        }
    }
}
