import http from "http";

const hostname = '0.0.0.0';

const server = http.createServer((req, res) => {
	res.statusCode = 200;
	res.setHeader('Content-Type', 'text/html'); //
	res.write('<h1>Hello Friend, this is first update!</h1>\n');
	res.end();
});

const port = 3000;
server.listen(port, () => {
	console.log(`Server running at http://${hostname}:${port}/`);
});
