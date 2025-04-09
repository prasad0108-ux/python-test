pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'make image'
            }
        }

        stage('Test Application') {
            steps {
                sh '''
                    python3 -m venv .venv
                    . .venv/bin/activate
                    export PYTHONPATH=$PWD
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    pytest tests/
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'your-dockerhub-creds
