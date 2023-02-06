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
                sh 'sudo docker build -t ${JOB_NAME}.v1:${BUILD_ID} .'
                sh 'sudo docker image tag ${JOB_NAME}.v1:${BUILD_ID} aruntvm199/${JOB_NAME}.v1:${BUILD_ID}'
                sh 'sudo docker image tag ${JOB_NAME}.v1:${BUILD_ID} aruntvm199/${JOB_NAME}.v1:latest'
            }
        }
        stage(docker_login) {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker_credentials', variable: 'docker_credential')]) {
                        sh 'sudo docker login -u aruntvm1999 -p ${docker_credential}'
                        sh 'sudo docker image push aruntvm199/${JOB_NAME}.v1:latest '
                    }


                   } 
                }
            }
        }
    }
}
