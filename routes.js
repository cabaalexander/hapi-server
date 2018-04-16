'use strict';

module.exports = [
  {
    method: 'GET',
    path: '/',
    handler: () => `<h1>hapi server - home</h1>`,
  },

  {
    method: 'GET',
    path: '/hello',
    handler: () => `hello world`,
  },

  {
    method: 'GET',
    path: '/cors',
    options: {
      cors: true,
    },
    handler: () => `You should access this via XHR`
  }
]

