FROM python:3.7-alpine
MAINTAINER Hannah Gooding

# Tell python to run in unbuffered mode, so it does not buffer 
# the outputs so they are printed on the terminal in real time
ENV PYTHONUNBUFFERED 1

# Copy the application requirements file to the docker image and install them
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Make directory to store application source code
RUN mkdir /application
# Make it the default directory
WORKDIR /app
# Copy the local source code into the docker image
COPY ./app /app

# Create a user to run application only
RUN adduser -D user
# Switch to that user
USER user