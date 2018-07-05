'use strict'

const Hapi = require('hapi')
const routes = require('./routes')

const server = Hapi.server({
  host: '0.0.0.0',
  port: '8128',
})

server.route(routes)

async function start() {
  try {
    await server.start()
  }
  catch (err) {
    console.log(err)
    process.exit(1)
  }

  console.log(`Server running at: ${server.info.uri}`)
}

start()

