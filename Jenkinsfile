pipeline {
    agent any
    parameters {
        choice(name: 'CHOICE', choices: ['create', 'destroy'] description: 'Pick something')
    }
    stages {
        stage('gitcheckout') {
            steps {
                git branch: 'main', url: 'https://github.com/gitarunhub/jenkin_sonar_nexus.git'
            }
        }
    }
}