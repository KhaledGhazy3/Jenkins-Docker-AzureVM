pipeline{
    agent any
    tools{
        maven 'v3.8.1'
    }
    environment{
        SKIP_TEST='-DskipTests=true'
    }
    stages{
        stage('Clean'){
            steps{
                sh "mvn clean"
            }
        }
        stage('Build JAR') {
            steps {
                  sh "mvn install ${SKIP_TEST}"
            }
        }
        stage('Artifacts JAR') {
            steps {
                 archiveArtifacts artifacts: 'target/*.jar'
            }
        }
        stage('Upload JAR to Nexus') {
            steps {
                sh """
                docker buildx build SKIP_TEST='-DskipTests=true' -t java-app .
                docker images
                """
            }
        }
    }
}

