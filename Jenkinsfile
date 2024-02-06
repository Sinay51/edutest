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
               docker.image('edutest').withRun('-d=true -p 80:5000') {c ->
                    docker.image('edutest').inside{
                        sh "ls"
                        sh 'pytest # to run tests'
                        sh 'pylint src && flake8'
                        sh 'bandit -r ./src'
                     }
                }
            }
        }
    }
}
