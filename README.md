# caseStudy3-CICDarchitecture-Jenkins-SonarQube-Nexus-slack
caseStudy3-CICDarchitecture base on Jenkins-SonarQube-Nexus-slack

This project includes enhancements with the Jenkins CLI provisioning and REST API mechansim. Those mechanisms will provide integration flexibility with Docker and Kubernetes projects in the near feature.
The CLI example is aiming to explore the possiblilities for managing the on-going plugins, pipeline jobs and Jenkins services.   

1. Use the setup_jenkins.sh to install the Jenkins. Please make sure the Jenkins service is up and running. Troubleshoot to resolve any issue that prevent the Jenkins service from running.

2. Once the Jenkins is installed, login as root or admin to setup the server. You will need to download the jenkins-cli.jar which could be found at http://JenkinsIPorlocalhost:8080/manage/cli/ and API token file for authorized access.
1a. To download the jenkins-cli.jar and save it.
curl http://172.16.11.5:8080/jnlpJars/jenkins-cli.jar --output jenkins-cli.jar

1b. use the jenkins-cli.jar alone with API token for printing all install plugins.
java -jar jenkins-cli.jar -s http://172.16.11.5:8080/ -auth @jwang1568token list-plugins

1c. The REST API: https://www.jenkins.io/doc/book/using/remote-access-api/

curl JENKINS_URL/job/JOB_NAME/buildWithParameters \
  --user USER:TOKEN \
  --data id=123 --data verbosity=high

3. here is the example of CLI to provison the required plugins for this project

root@jenkins:~/proj# cat setup_jenkins_plugins.sh
#!/bin/bash
JenkinsPort=8080

java -jar jenkins-cli.jar -auth @jwang1568token -s http://localhost:$JenkinsPort/ install-plugin nexus-artifact-uploader sonar git pipeline-maven build-timestamp pipeline-utility-steps slack pipeline-stage-view

java -jar jenkins-cli.jar -auth @jwang1568token -s http://localhost:$JenkinsPort/ safe-restart
# Wait for Jenkins being up and running
sleep 15

4. You will carry out the reset of System Tools and other application integration from this point.

5. The following files are kept as references
jenkins-cli.jar - the downloaded client file

jenkins-cli.txt - The available CLI list

jenkins-installed-plugins.txt - The list of installed plugins

jwang1568token - API token file; you need to setup your own.

6. This project is based on https://github.com/jwang1568cicd/project-VM-Jenkins-Sonarqube-Nexus-Slack with the following enhancements.
6.1 Using the webhook mechansim to trigger the Jenkins pipeline execution upon the github project commit.
6.2 Using jenkins CLI to manually trigger the Jenkins pipeline:w execution or via shell scripting. 
6.3 Using the REST API to manually trigger the Jenkins pipeline execution or via other automation mechanism.
6.4 Using REST API to monitor and manage the services operation of Jenkins, Sonarqube, Nexus and slack. This will form a CICD with automated scripting scenario.


Event   \ Github project commit  \
driven--- Jenkins CLI, REST API --- Jenkins --- Sonarqube --- Nexus --- Slack   
job     / Web based GUI          /  Pipeline
