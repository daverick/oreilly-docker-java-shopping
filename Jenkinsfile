#!/usr/bin/env groovy
node {
    stage ('build') {
        git url: 'https://github.com/daverick/oreilly-docker-java-shopping.git'
    }
    stage ('end-to-end tests') {
        timeout(time:60, unit:'SECONDS') {
            try {
                sh 'docker-compose up -d'
                waitUntil { //applicication is up
                def r=sh script: 'curl -s http://localhost:8010/health | grep "UP"', returnStatus:true
                return (r==0);
                }
                //conduct main test here
                sh 'curl http://localhost:8010 | grep "Docker Java"'
            } finally {
                sh 'docker-compose stop'
            }
        }

    }
    stage ('deploy') {
        //Deploy the containers/app here
    }
}
