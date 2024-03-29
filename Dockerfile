FROM ubuntu:latest
WORKDIR /app

RUN apt update -y && apt upgrade -y && apt install tzdata -y

RUN echo "Europe/Berlin" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt purge nodejs -y

RUN apt install wget git curl -y

RUN export PORT=3000

RUN apt install make python gcc g++ python3-pip build-essential bash git ffmpeg libopus-dev libffi-dev libsodium-dev python3 python git -y

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs 

COPY . /app

RUN node -v 
RUN npm -v

RUN npm install

CMD ["bash","run.sh"]