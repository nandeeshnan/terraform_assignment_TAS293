pipeline {
    agent any

    environment {
        TERRAFORM_HOME = "/usr/bin/terraform" // Adjust as per your Terraform installation
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/nandeeshnan/terraform_assignment_TAS293.git' // Replace with your repo
            }
        }

        stage('Terraform Init') {
            steps {
                sh "${env.TERRAFORM_HOME} init"
            }
        }

        stage('Terraform Plan') {
            steps {
                sh "${env.TERRAFORM_HOME} plan -out=tfplan"
            }
        }

        stage('Terraform Apply') {
            steps {
                sh "${env.TERRAFORM_HOME} apply -auto-approve tfplan"
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed!'
        }
    }
}
