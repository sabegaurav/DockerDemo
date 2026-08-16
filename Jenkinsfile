pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'gaurav122002/DockerDemo'
        DOCKER_IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .'
                sh 'docker tag ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ${DOCKER_IMAGE_NAME}:latest'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
                        docker push ${DOCKER_IMAGE_NAME}:latest
                        docker logout
                    '''
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh '''
                    docker rmi ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} || true
                    docker rmi ${DOCKER_IMAGE_NAME}:latest || true
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Image pushed to Docker Hub.'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}