pipeline {
    agent { label 'AWS-EC2' },

    stages {
        stage('Saving build..') {
            steps {
                echo 'Getting new push from git'
                git credentialsId: 'github', url: 'https://github.com/harshKLAD/node_express_ci_cd'
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                sh '''
                      rm -rf node_CI_CD*.zip
                      npm install
                      zip -r node_CI_CD-${BUILD_NUMBER}.zip node_modules app.js package.json Dockerfile Jenkinsfile
                   '''
            }
        }
        stage('Zipping Archive') {
            steps {
                echo 'Zipping....'
                archiveArtifacts artifacts: 'node_CI_CD*.zip', followSymlinks: false
                sh '''
                      cp node_CI_CD-${BUILD_NUMBER}.zip /
                   '''
            }
        }
    }
}
