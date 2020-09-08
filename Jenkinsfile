pipeline {
  environment {
    registry = 'tskdochub/payslip'
    registryCredential = 'tskdochub'
    dockerImage = ''
  }
  agent {
    label 'linux'
  }
  tools {
    maven 'Maven-3.6.0'
  }
  stages {
//    stage('Cloning Git') {
 //     steps {
   //     git 'https://github.com/tskgit/Payslip.git'
     // }
     //}
    stage('Build the Packages') {
      steps {
        sh 'mvn package'
      }
    }
    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps {
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
