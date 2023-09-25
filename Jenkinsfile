pipeline {
    agent any

    environment {
        DOCKERHUB_PUBLIC_REPO = 'kavitha06/dev_01' // Public Docker Hub repository
        DOCKERHUB_PRIVATE_REPO = 'kavitha06/prod_01' // Private Docker Hub repository
        DOCKER_IMAGE_TAG = 'latest' // Customize the Docker image tag

    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
stage('Stop and Remove Containers') {
            steps {
                // Stop and remove containers with the name 'web' (adjust as needed)
                sh 'docker stop web || true'
                sh 'docker rm web || true'
            }
        }
        stage('Build and Push Docker Image') {
            when {
                branch 'dev' // Build and push only if code is pushed to the 'dev' branch
            }
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x build.sh'

                // Build the Docker image using the build script
                sh './build.sh'

                // Log in to Docker Hub (public repository) using your credentials
                withCredentials([usernamePassword(credentialsId: 'kavi-docker', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD docker.io"
                }

                // Push the Docker image to the public Docker Hub repository
                sh "docker push $DOCKERHUB_PUBLIC_REPO:$DOCKER_IMAGE_TAG"
            }
        }

        stage('Deploy to Private Repository') {
            when {
                branch 'master' // Deploy to private repository when code is merged to 'master'
            }

steps {
                // Grant executable permissions to the deploy script
                sh 'chmod +x deploy.sh'

                // Build and push the Docker image to the private Docker Hub repository
                sh './deploy.sh'

                // Log in to Docker Hub (private repository) using your credentials
                withCredentials([usernamePassword(credentialsId: 'kavi-docker', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD docker.io"
                }

                // Push the Docker image to the private Docker Hub repository
                sh "docker push $DOCKERHUB_PRIVATE_REPO:$DOCKER_IMAGE_TAG"
            }
        }
    }
}


