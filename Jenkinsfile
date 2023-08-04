pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = 'mwholme202'
        REPO_URL = 'git@github.com:mholme202/Dev-Ops-CW2.git'
    }
    
    stages {
        stage('Clone') {
            steps {
                // Clone the repository
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: REPO_URL]]])
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Read Dockerfile content from the repository
                script {
                    def dockerfileContent = readFile "${REPO_URL}/Dockerfile"  // Replace with the actual path to your Dockerfile within the repository
                    sh "echo '''${dockerfileContent}''' > Dockerfile"
                }
                
                // Build the Docker image and tag it with the desired name
                script {
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        def imageName = 'mholme202/cw2devops'
                        
                        // Build the Docker image using the locally copied Dockerfile
                        sh "docker build -t ${imageName} ."
                        
                        // Remove the temporary Dockerfile
                        sh "rm Dockerfile"
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                // Push the Docker image to DockerHub
                script {
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        def imageName = 'mholme202/cw2devops'
                        sh "docker push ${imageName}"
                    }
                }
            }
        }
    }
}

