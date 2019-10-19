const http = require('http');
const crypto = require('crypto');
const exec = require('child_process').exec;

const SECRET = process.env.SECRET;

function pushOnMaster() {
    console.log("push event");
    exec("push.sh", (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);
        if (error !== null) {
            console.log(`exec error: ${error}`);
        }
    });
}


http.createServer((req, res) => {
    req.on('data', chunk => {
        const signature = `sha1=${crypto.createHmac('sha1', SECRET).update(chunk).digest('hex')}`;
        if (req.headers['x-hub-signature'] === signature) {
            if (JSON.parse(chunk).ref === 'refs/heads/master') {
                pushOnMaster();
            }
        }
    });
    res.end();
}).listen(process.env.PORT);