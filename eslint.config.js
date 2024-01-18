import antfu from '@antfu/eslint-config'

export default antfu(
  {
    vue: true,
    formatters: true,
    typescript: true,
  },
  {
    rules: {
      'ts/no-redeclare': 'off',
    },
  },
)
