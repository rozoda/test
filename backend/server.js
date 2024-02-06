const express = require("express")
const app = express()
const port = 3000

const cors = require("cors")
app.use(cors())

process.on('uncaughtException', function (err) {
  console.log(err);
});

app.get("/", (req, res) => {
  const questions = [
    {
      message: "Hello from backend api !!!",      
    },
  ]

  res.json(questions)
})

app.listen(port, () => {
  console.log(`Backend Server running on port ${port}`)
})