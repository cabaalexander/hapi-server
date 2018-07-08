'use strict'

require('make-promises-safe')

const Hapi = require('hapi')
const routes = require('./routes')

const server = Hapi.server({
  host: process.env.NODE_HOST || '0.0.0.0',
  port: process.env.NODE_PORT || '8128',
})

server.route(routes)

const init = async () => {
  await server.register({
    plugin: require('hapi-pino'),
    options: {
      prettyPrint: true,
      logEvents: ['response'],
    },
  })

  await server.start()
  console.log(`Server running at: ${server.info.uri}`)
}

init()

