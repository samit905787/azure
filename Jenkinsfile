pipeline {
        agent any
        environment {
            registryName = "diksha"
            registryUrl  = "diksha.azurecr.io"
            registryCredential = "ACR"
        }
        stages {
            stage ('Checkout'){
                steps {
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/iteindia/azure']]])
                    }
            }

        stage ('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build registryName
                }
            }
        }
        stage ('Upload image to ARC') {
            steps {
                script {
                docker.withRegistry( "http://${registryUrl}", registryCredential ) {
                dockerImage.push("${env.BUILD_NUMBER}")
                }
                }
            }
        }
    }
}
