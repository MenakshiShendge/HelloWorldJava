pipeline{
    agent any
    tools {
        maven 'Maven'
    }
    stages{
        stage('Build maven'){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitinmanebsnl/vaibhavi_web.git']])
                bat 'mvn clean install'
            }
        }
        stage('build-doker-image'){
            steps{
                script{
                    bat 'docker build -t vedantk1610/docker-image .'
                }
            }
        }
        stage('push to docker'){
            steps{
                script{
                    bat 'docker login -u vedantk1610 -p VedantDocker@123'
                    bat 'docker push vedantk1610/docker-image '
                }
            }
        }
        }
    }
