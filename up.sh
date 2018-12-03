#!/bin/sh
echo "### Booting up concourse"
mkdir vagrant && cd vagrant
vagrant init concourse/lite && vagrant up
sleep 60
cd ..
echo "### Setting up pipeline"
fly -t lite login --concourse-url http://ec2-13-233-175-12.ap-south-1.compute.amazonaws.com:8080
fly -t tutorial sync
yes | fly -t lite set-pipeline -p concourse-gradle-spring-boot -c concourse/pipeline.yml
fly -t lite unpause-pipeline -p concourse-gradle-spring-boot
echo "### Finished. Concourse available on: http://ec2-13-233-175-12.ap-south-1.compute.amazonaws.com:8080/"