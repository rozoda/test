const express = require("express")
const app = express()
const port = 80
const https = require('https');
const http = require('http');

const cors = require("cors")
app.use(cors())

app.get("/", (req, res) => {
  const result = [
    {
      Status: "Working",
    },
  ]

  res.json(result)
})

app.get("/test", async (req, res) => {
  try {
    const options = {
      hostname: 'backend.karfaskm-dev',  //'backend'
      port: 5001,
      path: '/',
      method: 'GET',
    };

    const request = http.request(options, response => {
      console.log(`statusCode: ${response.statusCode}`);

      let data = '';
      response.on('data', chunk => {
        data += chunk;
      });

      response.on('end', () => {
        try {
          const result = JSON.parse(data);
          res.json(result);
        } catch (error) {
          console.error(error);
          res.status(500).send('Error parsing response data');
        }
      });
    });

    request.on('error', error => {
      console.error(error);
      res.status(500).send('Error making request to backend server');
    });

    request.end();
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal server error');
  }
});

app.listen(port, () => {
  console.log(`Frontend running on port ${port}`)
})
