pipeline {
    agent any 
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gitarunhub/jenkin_sonar_nexus.git'
            }
        }
        stage('maven test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Integration testing') {
            steps {
                sh 'mvn verify -DskipUnitTests'
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('static code analysis') {
            steps {
                script {

                withSonarQubeEnv(credentialsId: 'sonar_api') {
                    sh 'mvn clean package sonar:sonar'
                }
              }
            }
        }  
        stage(Docker Image) {
            steps {
                sh 'docker build -t uber .'
            }
        }
   }
}
