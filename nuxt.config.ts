import { execaSync } from 'execa'

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: [
    '@vueuse/nuxt',
    '@nuxt/ui',
    '@pinia/nuxt',
  ],

  ui: {
    global: true,
    icons: ['logos', 'heroicons'],
  },

  colorMode: {
    preference: 'dark',
  },

  app: {
    head: {
      titleTemplate: '%s | Career Studio',
      htmlAttrs: {
        lang: 'en-US',
      },
      link: [
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
      ],
    },
  },

  typescript: {
    includeWorkspace: true,
  },

  features: {
    inlineStyles: false,
  },

  runtimeConfig: {
    public: {
      buildTime: Date.now(),
      gitSha: execaSync('git', ['rev-parse', 'HEAD']).stdout.trim(),
    },
    app: {
      devtools: {
        iframeProps: {
          allow: 'cross-origin-isolated',
          credentialless: true,
        },
      },
    },
  },

  devtools: {
    enabled: false,
  },

  vite: {
    build: {
      minify: 'esbuild',
      cssMinify: 'esbuild',
    },
  },

  vue: {
    defineModel: true,
  },
})
