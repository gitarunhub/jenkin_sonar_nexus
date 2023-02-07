pipeline {
    agent any
    parameters {
        choice(name: 'CHOICE', choices: ['create', 'destroy'], description: 'Pick something')
        string(name: 'aws_region', defaultValue: 'ap-south-1', description: 'aws_region')
        string(name: 'cluster_name', defaultValue: 'demo-cluster', description: 'eks_clustername')

    }
    environment {
        ACESS_KEY = Credentials('access_key_ID')
        SECRET_KEY = Credentials('secret_access_key')
    }
    stages {
        stage('gitcheckout') {
            steps {
                git branch: 'main', url: 'https://github.com/gitarunhub/jenkin_sonar_nexus.git'
            }
        
        }
        stage(aws_connect) {
            steps {
                sh """
                aws configure set aws_access_key_id "$ACESS_KEY"
                aws configure set aws_secret_access_key "$SECRET_KEY"
                aws configure set region ""
                aws eks --region ${params.aws_region} update-kubeconfig --name ${params.cluster_name}
            }
        }
    }
}