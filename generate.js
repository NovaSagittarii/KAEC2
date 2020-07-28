const fs = require('fs');
const FILE = process.argv[2];
const CHUNK_SIZE = (process.argv[3] && parseInt(process.argv[3])) || 750000;
if(!FILE) throw "Invalid or missing filepath";

const template = fs.readFileSync('template.json', 'utf8');
const uid = Math.random().toString(36).slice(2)+"#";
const data = fs.readFileSync(FILE, {encoding: 'base64'});
fs.writeFileSync('./payload', "");
for(let i = 0; i < data.length; i += CHUNK_SIZE){
  fs.appendFileSync('./payload', './tmp/'+i+'\n', 'utf8');
  fs.writeFileSync('./tmp/'+i, template.replace("[[TITLE]]", uid+i).replace("[[CODE]]", data.substring(i, i+CHUNK_SIZE)), 'utf8')
  console.log(i, i+CHUNK_SIZE);
}
