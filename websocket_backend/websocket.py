from sanic import Sanic
from sanic.response import text
from devtools import debug
from sanic import Request, Websocket

app = Sanic("MyHelloWorldApp")

@app.get("/")
async def hello_world(request):
    debug("Kicsi a kukkerádém")
    return text("Hello, world.")

@app.websocket("/feed")
async def feed(request: Request, ws: Websocket):
    while True:
        data = await ws.recv()
        print("Received: " + data)
        await ws.send("a szádba")
 
if __name__ == '__main__':
   app.run(host="0.0.0.0", port=8000, dev=True)
