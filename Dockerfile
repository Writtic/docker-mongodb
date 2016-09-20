FROM       ubuntu:latest
MAINTAINER Writtic <writtic@gmail.com>

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | \
tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
# Update apt-get sources AND install MongoDB
apt-get update && apt-get install -y mongodb-org && \
# Create the MongoDB data directory
mkdir -p /data/db
# Expose port 27017 from the container to the host
EXPOSE 27017
# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]
