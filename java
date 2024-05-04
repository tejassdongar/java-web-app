pipeline {
    agent any
    
    stages {
        stage('checkout code') {
            steps {
                git branch: 'main', url: 'https://github.com/tejassdongar/java-web-app.git'
            }
        }
        stage('build code') {
            steps {
                sh '/opt/maven/bin/mvn clean package'
            }
        }
        stage('Deployment'){
			steps{
				deploy adapters: [ tomcat9(url: 'http://13.232.169.67:8080/', credentialsId: 'tomcat-creds')], war:'target/*.war'
			}
		}
    }
}

