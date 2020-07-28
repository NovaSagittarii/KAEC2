const fs = require('fs');
const stdin = process.stdin;
let data = '';

stdin.setEncoding('utf8');
stdin.on('data', chunk => data += chunk);
stdin.on('end', function () {
  try {
    const json = JSON.parse(data.replace(/\u000a$/, ""));
    console.log(json.url);
    fs.appendFileSync("log/json-responses.log", json.url+'\n');
    fs.appendFileSync("log/url.log", data+'\n');
  } catch (e) {
    console.log(e);
    console.log(data);
  }
});
