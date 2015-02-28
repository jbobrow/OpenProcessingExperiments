
import processing.net.*;

Server myServer;
int port = 5205;
int val = 0;

void setup() {
  size(200, 200);
  // Starts a myServer on port 5205
  myServer = new Server(this, port);
}

void draw() {
  background(val);
  myServer.write(val);
  val = 0;
}
void mouseClicked() {
  if (val == 0) { 
  //blink 
    val = 1;
    } else {
    val = 0;
    }
}
