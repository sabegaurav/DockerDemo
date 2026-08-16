pipeline {
    agent any

    environment {
        MAVEN_HOME = 'C:\\apache-maven-3.9.16'
        PATH = "${MAVEN_HOME}\\bin;${env.PATH}"
    }

    stages {

        stage('Check Maven') {
            steps {
                bat '''
                    echo ===== MAVEN HOME =====
                    echo %MAVEN_HOME%

                    echo ===== WHERE MAVEN =====
                    where mvn

                    echo ===== MAVEN VERSION =====
                    mvn --version
                '''
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }
    }
}