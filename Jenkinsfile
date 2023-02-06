pipeline {
    agent any 
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gitarunhub/jenkin_sonar_nexus.git'
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage(docker_image_build) { 
            steps {
                sh 'sudo docker build -t $JOB_NAME:v1:$BUILD_ID .'
            }
        }
    }
}
