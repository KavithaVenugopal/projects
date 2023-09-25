pipeline {
    agent any

    environment {
        DOCKERHUB_PUBLIC_REPO = 'kavitha06/dev_01' // Public Docker Hub repository
        DOCKER_IMAGE_TAG = 'latest' // Customize the Docker image tag
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x build.sh'

                // Build the Docker image using the build script
                sh './build.sh'

                // Log in to Docker Hub (public repository) using your credentials
                withCredentials([usernamePassword(credentialsId: 'kavi-docker', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD docker.io"
                }

                // Tag the Docker image with the customized tag
                sh "docker tag kavitha001/react $DOCKERHUB_PUBLIC_REPO:$DOCKER_IMAGE_TAG"

                // Push the Docker image to the public Docker Hub repository with the customized tag
                sh "docker push $DOCKERHUB_PUBLIC_REPO:$DOCKER_IMAGE_TAG"
            }
        }

        stage('Deploy') {
            steps {
                // Grant executable permissions to the deploy script
                sh 'chmod +x deploy.sh'

                // Execute the deploy script to handle deployment
                sh './deploy.sh'
            }
        }
    }
}

