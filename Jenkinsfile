pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building Development Docker image'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" build --build-arg ENV_NAME=Development --build-arg BANNER_COLOR=green -t app-dev .'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing Docker image'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" image inspect app-dev'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Development container'

                bat returnStatus: true, script: '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" rm -f app-dev'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" run -d --name app-dev -p 3001:80 app-dev'
            }
        }
    }
}
