pipeline {
    agent any

    stages {
        stage('Build Base') {
            steps {
                sh 'packer build centos-7-base.json'
            }
        }
    }
}
