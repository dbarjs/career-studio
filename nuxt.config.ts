import { execaSync } from 'execa'

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: [
    '@vueuse/nuxt',
    '@unocss/nuxt',
    '@nuxtjs/color-mode',
    'floating-vue/nuxt',
    '@nuxtjs/seo',
    'nuxt-icon',
    '@nuxt/ui',
  ],
  colorMode: {
    classSuffix: '',
  },
  site: {
    url: 'https://learn-dev.nuxt.com',
  },
  ogImage: {
    defaults: {
      component: 'NuxtSeo',
      props: {
        colorMode: 'dark',
      },
    },
    componentOptions: {
      global: true,
    },
  },
  app: {
    head: {
      titleTemplate: '%s - Nuxt Tutorial',
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
    tsConfig: {
      include: [
        '../content/**/.template/**/*.ts',
      ],
    },
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
    enabled: true,
  },
  vite: {
    build: {
      minify: 'esbuild',
      cssMinify: 'esbuild',
    },
    server: {
      headers: {
        'Cross-Origin-Embedder-Policy': 'require-corp',
        'Cross-Origin-Opener-Policy': 'same-origin',
      },
    },
  },
  vue: {
    defineModel: true,
  },
})
