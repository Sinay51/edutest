pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker image build -t "edutest" .'
            }
        }
        stage('Test') {
            steps {
                sh 'pip install -r requirements.txt'
                sh 'pip install -e .'
                sh 'pytest # to run tests'
                sh 'pylint src && flake8'
                sh 'bandit -r src'
            }
        }
    }
}
