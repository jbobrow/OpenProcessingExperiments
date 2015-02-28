
/* building on previous point attractor exercise, this script  allows control of the same functionality but throught TouchOSC on ipad or iphone
using Simple interface page 3, the X&Y slider. Make sure on TouchOSC to setup the ipaddress similar to the one that will show up once you run, and the
port outgoing to 8000 or you can change that.
this will not work online, you will need to download it first*/
import oscP5.*;
import netP5.*;

OscP5 oscP5;

float s;
float cell=20;

float x1;
float y1;

void setup() {
  size(800, 400);
  background(255);

  oscP5 = new OscP5(this, 8000);
}

void oscEvent(OscMessage theOscMessage) {

  String addr = theOscMessage.addrPattern();
  float  val  = theOscMessage.get(0).floatValue();
  float  val1  = theOscMessage.get(1).floatValue();
  x1=(val*width);
  y1=(val1*height);
}


void draw() {
  background(255);

  for (int i=0; i<=width;i+=cell) {
    for (int j=0; j<=height;j+=cell) {
      s= dist(x1, y1, i, j);
      s=s/10;
      fill(0, 150, 255, 40);
      noStroke();
      ellipse(i, j, s, s);
    }
  }
}



