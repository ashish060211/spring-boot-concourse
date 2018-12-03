#!/bin/sh
set -e
spring-boot-concourse/gradlew --build-file spring-boot-concourse/build.gradle build
ls
cp spring-boot-concourse/build/libs/*.jar build-output/