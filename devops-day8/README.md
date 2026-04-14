# DevOps Day 8 - Data Persistence & Isolation

## Overview
In this task, I worked on ensuring that data inside a container is not lost even after the container is removed. I also learned how containers communicate securely using Docker networks.

## What I Did
- Ran a MongoDB container with a volume to store data on my local system  
- Created a custom Docker network so containers can communicate using names  
- Used docker-compose to manage multiple containers  
- Added a named volume for better data persistence  

## Experiment (Disaster Test)
I inserted some data into MongoDB and then stopped and removed the containers using `docker-compose down`.  
After restarting everything with `docker-compose up -d`, I checked the database again.

## Result
The data was still there.

## Why This Worked
Docker volumes store data outside the container. So even if the container is deleted, the data remains safe and can be accessed when the container is started again.

## Tools Used
Docker, Docker Compose, MongoDB, Nginx

## Author
Vaibhav Jadhav
