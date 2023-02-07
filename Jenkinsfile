pipeline {
    agent any
    parameters {
        choice(name: 'option', choices: ["create", "destroy"], description: "to create or destroy cluster")
        string(name: 'aws_region', defaultValue: 'ap-south-1', description: 'aws_region')
        string(name: 'cluster_name', defaultValue: 'demo_cluster', description: 'eks_clustername')

    }
    environment {
        ACESS_KEY = credentials('access_key_ID')
        SECRET_KEY = credentials('secret_access_key')

    }
    
    stages {
            stage('gitcheckout') {
            steps {
                git branch: 'main', url: 'https://github.com/gitarunhub/jenkin_sonar_nexus.git'
            }
        
        }
        stage('aws_connect') {
            steps {
                sh """
                aws configure set aws_access_key_id "$ACESS_KEY"
                aws configure set aws_secret_access_key "$SECRET_KEY"
                aws configure set region ""
                aws eks --region ${params.aws_region} update-kubeconfig --name ${params.cluster_name}
                """
           }
        }
         stage(eks_create) {
            when {
                expression { params.option == "create"}
            }
            steps {
                script {
                    def apply = false
                    try {
                        input message: 'please confirm', ok: 'Ready to apply'
                        apply = true
                    }
                    catch(err) {
                        apply = false
                        CurrentBuild.result= "UNSTABLE"
                    }
                    if(apply) {
                        sh """
                        kebectl apply -f .
                        """
                    }
                }
            }
         }
    }
}