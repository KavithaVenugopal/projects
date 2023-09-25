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
                anyOf {
                    branch 'dev' // Build and push if code is pushed to the 'dev' branch
                    branch 'master' // Build and push if code is pushed to the 'master' branch
                }
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

                // Tag the Docker image with the specified tag
                sh "docker tag kavitha001/react $DOCKERHUB_PUBLIC_REPO:$DOCKER_IMAGE_TAG"

                // Push the Docker image to the public Docker Hub repository with the specified tag
                sh "docker push $DOCKERHUB_PUBLIC_REPO:$DOCKER_IMAGE_TAG"
            }
        }
    }
}

