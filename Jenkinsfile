pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        sh 'npm install'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing..'
        sh 'npm test'
      }
    }

    stage('Package') {
      steps {
        echo 'Packaging....'
        sh 'npm run package'
        archiveArtifacts '**/distribution/*.zip'
      }
    }

  }
}
