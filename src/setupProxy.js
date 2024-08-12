const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function(app) {
  app.use(
    '/api',
    createProxyMiddleware({
      target: 'http://67.207.86.85:8080',
      changeOrigin: true,
    })
  );
};