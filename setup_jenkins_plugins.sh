#!/bin/bash
JenkinsPort=8080

java -jar jenkins-cli.jar -auth @jwang1568token -s http://localhost:$JenkinsPort/ install-plugin nexus-artifact-uploader sonar git pipeline-maven build-timestamp pipeline-utility-steps slack pipeline-stage-view

java -jar jenkins-cli.jar -auth @jwang1568token -s http://localhost:$JenkinsPort/ safe-restart
# Wait for Jenkins being up and running
sleep 15

