node{
  stage("Scm checkout"){
    git 'https://github.com/Rootbie/helloworld.git'
  }
  
  stage("Maven build"){
    sh 'mvn clean package'
  }
  
  stage("Build docker image"){
    def DockerBuild = 'docker build -t trinh00thien/helloworld:v1 .'
    
    sshagent(['instanceForDocker']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${DockerBuild}'
    }
    
  }
  
  stage("Deploy docker image to Tomcat server"){
    def DockerRun = 'docker run -p 8109:8080 -d --name web-hello trinh00thien/helloworld:v1'
    
    sshagent(['instanceForDocker']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${DockerRun}'
    }
  }
}
