pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker {
          image 'schoolofdevops/node:4-alpine'
        }

      }
      steps {
        echo 'Building..'
        sh 'npm install'
      }
    }

    stage('Test') {
      agent {
        docker {
          image 'schoolofdevops/node:4-alpine'
        }

      }
      steps {
        echo 'Testing..'
        sh '''npm install
npm test'''
      }
    }

    stage('Package') {
      agent {
        docker {
          image 'schoolofdevops/node:4-alpine'
        }

      }
      steps {
        echo 'Packaging....'
        sh '''npm install
npm run package'''
        archiveArtifacts '**/distribution/*.zip'
      }
    }

    stage('error') {
      agent any
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin') {
            def dockerImage = docker.build("gowthams96/frontend:v${env.BUILD_ID}", "./")
            dockerImage.push()
            dockerImage.push("latest")
          }
        }

      }
    }

  }
  tools {
    nodejs 'NodeJS 4.8.6'
  }
}