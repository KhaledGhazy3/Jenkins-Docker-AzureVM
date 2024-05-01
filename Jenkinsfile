pipeline{
    agent{
        label 'agent-01-maven'
    }
    tools{
        maven 'mvn3.9.0'
    }
    environment{
        SKIP_TEST='-DskipTests=true'
        NEXUS_PASS=credentials('nexus-password')
        NEXUS_USER=credentials('nexus-username')
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
        // stage('Upload JAR to Nexus') {
        //     steps {
        //         sh """
        //         curl -v -u ${NEXUS_USER}:${NEXUS_PASS} --upload-file ${WORKSPACE}/target/*.jar http://192.168.205.141:8081/repository/demo-test/test/demo1-0.0.1-SNAPSHOT.jar
        //         """
        //     }
        // }
    }
}
