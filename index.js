const express = require('express')

const app = express()
const port = 4000
const url = `http://localhost:${port}`

app.get('/', (req, res) => {
  return res.json({
    message: 'hello world'
  })
})

app.listen(port, () => {
  console.log(`[x] Server run on ${url}`)
})