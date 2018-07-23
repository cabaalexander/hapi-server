'use strict';

module.exports = [
  {
    path: '/',
    method: 'GET',
    handler: (request, h) => `<h1>hapi server - home</h1>`,
  },

  {
    path: '/post',
    method: 'POST',
    handler: (request, h) => {
      const json = JSON.stringify(request.payload, null, 2)
      console.log(`:: Payload ::\n\n${json}\n\n:: Payload ::`)

      return 'I did something (200)\n'
    },
  },

  {
    path: '/hello',
    method: 'GET',
    handler: () => `hello world`,
  },

  {
    path: '/cors',
    method: 'GET',
    options: {
      cors: true,
    },
    handler: () => `You should access this via XHR`
  },
]

