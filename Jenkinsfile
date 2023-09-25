pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Check out your source code from your Git repository
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            when {
                // Run this stage only if changes are pushed to the 'dev' branch
                expression {
			 echo "Branch Name: ${currentBuild.branch}"
	                 return currentBuild.branch == 'origin/dev'
                   
                }
            }
            steps {
                script {
                    def dockerImage = 'kavitha06/kavitha001/react'
                    def dockerHubCredentials = credentials('dockerhub-kavi')

                    // Run your custom build script
                    sh './build.sh'

                    // Log in to Docker Hub
                    sh "docker login -u ${dockerHubCredentials.username} -p ${dockerHubCredentials.password}"

                    // Push the Docker image to Docker Hub
                    sh "docker push ${dockerImage}"
                }
            }
        }

        stage('Deploy') {
            when {
                // Run this stage only if changes are pushed to the 'dev' branch
                expression {
                    echo "Branch Name: ${currentBuild.branch}"
                    return currentBuild.branch == 'origin/dev'
                    
                }
            }
            steps {
                script {
                    // Run your custom deploy script
                    sh './deploy.sh'
                }
            }
        }
        
        // Add more stages for additional deployment or testing steps as needed
    }
    
    post {
        failure {
            echo "pipeline failed"
        }
    }
}


