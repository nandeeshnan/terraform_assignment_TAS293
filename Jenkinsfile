pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-credentials')
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch:'main', url:'https://github.com/nandeeshnan/terraform_assignment_TAS293.git' // Replace with your repo
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
