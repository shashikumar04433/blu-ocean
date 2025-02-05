#!/groovy
def dockerImageRepo = 'shashikumar023/blueocean'
def dockerImageTag
def dockerImage
def dockerRegistry = 'hub.docker.com'

pipeline {
    agent any
    stages {
        stage('Cleaning the WorkSpace') {
            steps {
                deleteDir()
                echo "the build number is ${currentBuild.number}"
                echo 'Cleanup Done'
            }
        }

        stage('CheckOut latest Code') {
            steps {
                checkout scm
                script {
                    dockerImageTag = "${dockerImageRepo}:${BUILD_NUMBER}"
                    echo "Created a Tag for uploading an Image to Registry based on Build_Number : $dockerImageTag"
                }
            }
        }

        stage('Build the Image') {
            steps {
                script {
                    echo 'Starting the Image Building'
                    dockerImage = docker.build("${dockerImageTag}")
                    sh 'docker images'
                    sh 'docker ps -a'
                    echo "$dockerImage"
                }
            }
        }

        stage('Publish Docker Images to DockerHub') {
            steps {
                echo "Pushing Docker image to Registry"
                script {
                    sh 'docker login --username="shashikumar023" --password="Anand987@123" ${dockerRegistry}'
					dockerImage.push()
                    }
            }
        }
    }
}
