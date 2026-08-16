pipeline {
    agent any

    stages {

        stage('Check Maven') {
            steps {
                bat '''
                    echo ===== JAVA =====
                    java -version

                    echo ===== JAVA HOME =====
                    echo %JAVA_HOME%

                    echo ===== MAVEN HOME =====
                    echo %MAVEN_HOME%

                    echo ===== PATH =====
                    echo %PATH%

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