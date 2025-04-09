pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-imp', url: '']) {
                        // Authentication happens here
                    }
                }
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
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    pytest tests/
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-imp', url: '']) {
                        sh 'make push'
                    }
                }
            }
        }

        stage('Deploy App') {
            steps {
                sh 'docker run -d --rm -p 5000:5000 prasads01/python-webapp:latest'
            }
        }
    }
}
