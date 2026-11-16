import { renderToString } from 'react-dom/server'
import { describe, expect, it } from 'vitest'
import App from './App'

describe('App', () => {
  it('muestra el título del proyecto', () => {
    const html = renderToString(<App />)
    expect(html).toContain('CI/CD con Docker')
  })

  it('muestra la versión "dev" cuando no se construye en GitHub', () => {
    const html = renderToString(<App />)
    expect(html).toContain('dev')
  })

  it('muestra el contador empezando en 0', () => {
    const html = renderToString(<App />)
    expect(html).toMatch(/Count is (<!-- -->)?0/)
  })
})
