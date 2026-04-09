import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  base: '/mushroom-frontend/',
  plugins: [vue()],
  server: {
    port: 5174,
    hmr: {
      overlay: true
    },
    fs: {
      strict: false
    },
    proxy: {
      '/api': {
        target: 'http://localhost:3003',
        changeOrigin: true,
        timeout: 60000,
        headers: {
          'Connection': 'keep-alive'
        }
      },
      '/uploads': {
        target: 'http://localhost:3003',
        changeOrigin: true
      },
      '/mushrooms': {
        target: 'http://localhost:3003',
        changeOrigin: true
      }
    }
  },
  optimizeDeps: {
    include: ['vue', 'vue-router', 'pinia', 'element-plus', 'axios', 'echarts'],
    exclude: []
  },
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    minify: 'terser',
    sourcemap: false,
    rollupOptions: {
      output: {
        manualChunks: {
          'vue-vendor': ['vue', 'vue-router', 'pinia'],
          'element-plus': ['element-plus', '@element-plus/icons-vue'],
          'charts': ['echarts'],
          'utils': ['axios', 'dayjs', 'mitt', 'socket.io-client']
        },
        chunkFileNames: 'assets/js/[name]-[hash].js',
        entryFileNames: 'assets/js/[name]-[hash].js',
        assetFileNames: 'assets/[ext]/[name]-[hash].[ext]'
      }
    },
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true
      }
    },
    chunkSizeWarningLimit: 1000
  }
})