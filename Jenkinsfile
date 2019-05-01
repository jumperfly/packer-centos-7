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
        stage('Build Guest Additions') {
            steps {
                sh 'packer build centos-7-guest-additions.json'
            }
        }
        stage('Build Ansible') {
            steps {
                sh 'packer build centos-7-ansible.json'
            }
        }
    }
}
