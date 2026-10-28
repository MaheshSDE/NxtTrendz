pipeline {
    agent any
    environment {
        DOCKER_ID  = 'pmahesh59'
        BACKEND    = "${DOCKER_ID}/nxttrendz-backend"
        FRONTEND   = "${DOCKER_ID}/nxttrendz-frontend"
    }
    stages {
        stage('Checkout') { steps { git branch: 'master', url: 'https://github.com/MaheshSDE/NxtTrendz' } }
        stage('Build') { steps {
            sh 'docker build -t $BACKEND:$BUILD_NUMBER ./backend'
            sh 'docker build -t $FRONTEND:$BUILD_NUMBER ./frontend'
        } }
        stage('Push') { steps {
            withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                sh 'docker push $BACKEND:$BUILD_NUMBER'
                sh 'docker push $FRONTEND:$BUILD_NUMBER'
            }
        } }
    }
}