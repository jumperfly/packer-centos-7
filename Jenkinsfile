pipeline {
    agent any

    options {
        ansiColor('xterm')
    }

    stages {
        stage('Build Base') {
            steps {
                sh 'packer build centos-7-base.json'
            }
        }
    }
}
