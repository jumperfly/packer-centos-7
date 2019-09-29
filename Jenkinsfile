pipeline {
    agent any

    options {
        ansiColor('xterm')
    }

    environment {
        VAGRANT_CLOUD_TOKEN = credentials('vagrant-cloud')
        CENTOS_MAJOR_MINOR = "7.7"
        BASE_BOX_REVISION = "3"
        BASE_BOX_VERSION = "${CENTOS_MAJOR_MINOR}.${BASE_BOX_REVISION}"
    }

    stages {
        stage('Clean') {
            steps {
                sh 'rm -rf output-virtualbox-ovf'
            }
        }
        stage ('Download Base Box') {
            when { 
                expression { return !fileExists("$HOME/.vagrant.d/boxes/jumperfly-VAGRANTSLASH-centos-7-base/$BASE_BOX_VERSION/virtualbox/box.ovf") }
            }
            steps {
                sh "vagrant box add jumperfly/centos-7-base --box-version $BASE_BOX_VERSION"
            }
        }
        stage('Build') {
            steps {
                sh 'packer build centos-7.json'
            }
        }
    }
}
