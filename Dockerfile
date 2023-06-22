# We will use python:3.10 inside ubuntu-base
FROM ubuntu
RUN apt-get update
RUN apt-get install -y --no-install-recommends python3.10 python3-pip
# It specifies the working directory where the Docker container will run
COPY . /app
USER www
WORKDIR /app
# Copying all the application files to the working directory
#RUN apt-get install python3-pip
# Install all the dependencies required to run the Flask application
RUN pip3 install -r requirements.txt
# Expose the Docker container for the application to run on port 5000
EXPOSE 5000
# The command required to run the Dockerized application
CMD ["flask", "run", "--host=0.0.0.0"]

