import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vitejs.dev/config/
export default defineConfig({
  // plugins: [react()],
  // server: {
  //   port: 8010,  // Set Vite to run on port 8010
  //   proxy: {
    export default defineConfig({
      server: {
        port: 8010,  // Vite will listen on port 8010
        host: '0.0.0.0',  // Allow external connections
      },
    });
    
      // When the request starts with /api, it will be proxied to the target server
      '/api': {
        target: 'http://65.0.93.147:4050', // The target backend server
        changeOrigin: true,
        // rewrite: (path) => path.replace(/^\/api/, ''), // Optional: remove /api from the request path
      },
      // You can add more proxies here if needed
      // '/another-path': {
      //   target: 'http://another-server.com',
      //   changeOrigin: true,
      //   rewrite: (path) => path.replace(/^\/another-path/, ''),
      // },
    },
  },
})
