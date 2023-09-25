pipeline {
    agent any

    environment {
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

        stage('Remove Existing Containers') {
            when {
                // Only run this stage if changes are merged into the master branch
                expression { currentBuild.changeSets.any { it.branch == 'origin/master' } }
            }
            steps {
                // Log in to Docker Hub (private repository) using your credentials
                withCredentials([usernamePassword(credentialsId: 'kavi-docker', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD docker.io"
                }

                // Stop and remove all containers with the same image
                sh "docker stop \$(docker ps -q --filter ancestor=$DOCKERHUB_PRIVATE_REPO:$DOCKER_IMAGE_TAG) || true"
                sh "docker rm \$(docker ps -aq --filter ancestor=$DOCKERHUB_PRIVATE_REPO:$DOCKER_IMAGE_TAG) || true"
            }
        }

        stage('Build and Push Docker Image') {
            when {
                // Only run this stage if changes are merged into the master branch
                expression { currentBuild.changeSets.any { it.branch == 'origin/master' } }
            }
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x build.sh'

                // Build the Docker image using the build script
                sh './build.sh'

                // Log in to Docker Hub (private repository) using your credentials
                withCredentials([usernamePassword(credentialsId: 'kavi-docker', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD docker.io"
                }

                // Tag the Docker image with the customized tag
                sh "docker tag kavitha001/react $DOCKERHUB_PRIVATE_REPO:$DOCKER_IMAGE_TAG"

                // Push the Docker image to the private Docker Hub repository with the customized tag
                sh "docker push $DOCKERHUB_PRIVATE_REPO:$DOCKER_IMAGE_TAG"
            }
        }

        stage('Deploy') {
            when {
                // Only run this stage if changes are merged into the master branch
                expression { currentBuild.changeSets.any { it.branch == 'origin/master' } }
            }
            steps {
                // Grant executable permissions to the deploy script
                sh 'chmod +x deploy.sh'

                // Execute the deploy script to handle deployment
                sh './deploy.sh'
            }
        }
    }
}



