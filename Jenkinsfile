pipeline {
    agent { label 'vbox' }

    options {
        ansiColor('xterm')
    }

    environment {
        VAGRANT_CLOUD_TOKEN = credentials('vagrant-cloud')
    }

    stages {
        stage('Clean') {
            steps {
                sh 'rm -rf output-virtualbox* boxes'
            }
        }
        stage('Build') {
            steps {
                sh 'packer build centos-7.json'
            }
        }
    }
}
