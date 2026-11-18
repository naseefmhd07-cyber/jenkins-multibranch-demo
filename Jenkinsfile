pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building Production Docker image'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" build --build-arg ENV_NAME=Production --build-arg BANNER_COLOR=blue -t app-prod .'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing Production Docker image'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" image inspect app-prod'
            }
        }

        stage('Approval') {
            steps {
                input message: 'Approve deployment to Production?', ok: 'Deploy'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Production container'

                bat returnStatus: true, script: '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" rm -f app-prod'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" run -d --name app-prod -p 3000:80 app-prod'
            }
        }
    }
}
