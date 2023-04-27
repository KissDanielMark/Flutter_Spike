from sanic import Sanic
from sanic.response import text
from devtools import debug
#from sanic import Request, Websocket

app = Sanic("MyHelloWorldApp")

@app.get("/")
async def hello_world(request):
    debug("Kicsi a kukkerádém")
    return text("Hello, world.")

if __name__ == '__main__':
    app.run(dev=True)
