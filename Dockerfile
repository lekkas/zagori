FROM resin/raspberrypi2-node

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json ./

RUN JOBS=MAX npm install --unsafe-perm --production && npm cache clean

COPY . ./

CMD npm start
