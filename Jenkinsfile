pipeline {
    agent any
      environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-cred')
        AWS_SECRET_ACCESS_KEY = credentials('aws-cred')  
        DOCKERHUB_CREDENTIALS = credentials('ghosh23')
        registry = "398330996337.dkr.ecr.ap-south-1.amazonaws.com/jenkin-pipeline-demo"
    }
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sumanto-23/docker-ecr.git']]])
            }
        }
        stage(test){
         steps{
             script{
             sh '''
             chmod +x ./suman.sh
             chmod +x ./work.sh
             ./suman.sh
             '''
           }
         }
        }
        
        
         stage('Pushing to ECR') {
     steps{  
         script {
                sh  'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 398330996337.dkr.ecr.ap-south-1.amazonaws.com'
                sh  'docker push 398330996337.dkr.ecr.ap-south-1.amazonaws.com/jenkin-pipeline-demo:latest'
         }
        }
      }
    
          stage('stop previous containers') {
         steps {
            sh 'docker ps  -qa | xargs --no-run-if-empty docker container stop'
            sh 'docker container ls -qa | xargs -r docker container rm'
         }
       }
    
        stage('Docker Run') {
     steps{
         script {
                sh 'docker run -itd -p 80:51666 --name welm1  398330996337.dkr.ecr.ap-south-1.amazonaws.com/jenkin-pipeline-demo:latest'
            }
      }
    }
    } 
    
    
}
