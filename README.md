# Project :
This repository contains the Java application codebase that is built and tested automatically using Jenkins and Docker, following the Git Flow branching model.
# Tools Needed:
1- GitHub account. <br>
2- Git installed on the Jenkins. <br>
3- Jenkins.
# Setting Up the Jenkins Pipeline
1. Ensure Jenkins has the necessary plugins installed: <br>
-  Git plugin 
-  Docker plugin
2. Create a `Jenkinsfile` in the root directory of your GitHub repository with the following pipeline structure:
  ```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
 ```
3. Configure Jenkins:  <br>
 - connect Jenkins to GitHub.
   - Go to "Manage Jenkins" > "Manage Plugins" > "Available" and install "GitHub Integration Plugin".
   - Set up credentials in Jenkins for GitHub (username and token).  <br> 
 - Create a new pipeline job. 
   - Select "New Item", name your pipeline (e.g., "GitHub Pipeline"), and choose "Pipeline" as the type.
   - In the pipeline configuration, select "Pipeline script from SCM" and choose "Git" as the SCM.
   - Enter the repository URL and credentials.
   - Specify the branch to build (e.g., */develop).
   - In Build Triggers, Check "GitHub hook trigger for GITScm polling".
   - Save

4. Set up a webhook in GitHub to trigger Jenkins builds on code changes.
# Docker Integration
Docker is used to containerize the Java application. The Dockerfile should be placed in the root directory of the repository. Here’s an example Dockerfile:
```
FROM openjdk:8-jdk-alpineCOPY . /app
WORKDIR /app
RUN javac MyApp.java
CMD ["java", "MyApp"]
```
- docker buildx build --build-arg SKIP_TEST=-DskipTests=true -t java-app:latest .
 ![Screenshot 2024-05-01 215317](https://github.com/KhaledGhazy3/jenkins/assets/161209615/ecf12e98-88da-4c75-9bf8-2fd454e8afda)
 ![Screenshot 2024-05-01 215340](https://github.com/KhaledGhazy3/jenkins/assets/161209615/fec6edc4-7035-4461-9464-531e2b215407)
 ![Screenshot 2024-05-01 215401](https://github.com/KhaledGhazy3/jenkins/assets/161209615/15259c71-2d8e-453a-bbbe-21b4c6620275)

 
# Conclusion
This setup allows for continuous integration and delivery of the Java application, ensuring that all changes are automatically built, tested, and ready for deployment.

