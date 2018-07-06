'use strict';

module.exports = [
  {
    path: '/',
    method: 'GET',
    handler: () => `<h1>hapi server - home</h1>`,
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

