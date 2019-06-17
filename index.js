'use strict';

require('dotenv').config();
const Hapi = require('hapi');
const constants = require('./src/config/constants');

console.log(process.env.NODE_ENV);

var routes = require('./src/routes');


const server = new Hapi.Server();
server.connection({port: constants.application.port});

for(var route in routes){
    server.route(routes[route]);
}

module.exports = server;

server.start(function(err){

    if (err) {
        throw err;
    }
    console.log('Server  running at:', server.info.uri);
});
