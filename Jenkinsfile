pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building Staging Docker image'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" build --build-arg ENV_NAME=Staging --build-arg BANNER_COLOR=orange -t app-staging .'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing Staging Docker image'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" image inspect app-staging'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Staging container'

                bat returnStatus: true, script: '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" rm -f app-staging'

                bat '"C:/Users/Lenovo/AppData/Local/Programs/DockerDesktop/resources/bin/docker.exe" run -d --name app-staging -p 3002:80 app-staging'
            }
        }
    }
}
