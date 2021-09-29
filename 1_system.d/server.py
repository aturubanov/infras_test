from http.server import HTTPServer, BaseHTTPRequestHandler


class RequestHandler(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()

    def _html(self, message):
        content = f"<html><body><h1>{message}</h1></body></html>"
        return content.encode("utf8")
    
    def do_GET(self):
        self._set_headers()
        self.wfile.write(self._html('Hello, world!'))


def main():
    httpd = HTTPServer(
        ('', 8000), 
        RequestHandler
    )
    httpd.serve_forever()


if __name__ == '__main__':
    main()
