
//idea initially inspired by Abe Pazos and his "Hamoid" channel
//on Youtube.

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int gamestate;

PFont font;

float oldx;
float oldy;
float a;
float w;
float c;
float s;
float Xdir;
float Ydir;

void reset() {
  oldx = width/2;
  oldy= height/2;
  a = random(TWO_PI);
  w = 1;
}

void setup() {
  gamestate=0;
  font = loadFont ("Consolas-48.vlw");
  textFont (font, 24);

  size(500, 500);
  background (0);
  colorMode(HSB, 100);
  smooth();
  noFill();
  frameRate(60);
  reset(); 
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */

  //NetAdress is my Computer Networks IP
  myRemoteLocation = new NetAddress("169.254.73.66", 10000);

  s= 100;
  c= 30;
}

void draw() {
  if (gamestate == 0) {
    text("Welcome to Squiggle Draw OSC", 70, height/2);
    text("Press 'D' to start drawing", 80, 400);
  }
  if (gamestate ==1) {


    //Squiggles//
    stroke(c, s, noise(w, a) * random(180));
    strokeWeight(w);
    float newx = oldx + Xdir;
    float newy = oldy + Ydir;
    line (oldx, oldy, newx, newy);
    oldx = newx;
    oldy = newy;
    a = a + random(-0.4, 0.4);
    w = w + 0.24;


    if (oldx < 0 || oldy < 0 || oldx > width || oldy > height) {
      reset();
    }
  }
}
//Things to do:
//Parse values for /3/xy1 to varibles in sketch
//Change OSC values from 0-1 to 0-500

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {


  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());

  //Get Values from X and Y locations in OSC

  //println(theOscMessage.get(0).floatValue());
  //  println(theOscMessage.get(1).floatValue());


  if (theOscMessage.checkAddrPattern("/accxyz")==true) {
    Xdir = map(theOscMessage.get(0).floatValue(), -1, 1, -5, 5);
    Ydir = map(theOscMessage.get(1).floatValue(), -1, 1, -5, 5);
  }

  if (theOscMessage.checkAddrPattern("/1/fader1")==true) {
    c = map(theOscMessage.get(0).floatValue(), 0, 1, 10, 100);
  }

  if (theOscMessage.checkAddrPattern("/1/fader2")==true) {
  }

  if (theOscMessage.checkAddrPattern("/1/fader3")==true) {
  }

  //oldxOSC = theOscMessage.get(0).floatValue();
  //oldyOSC = theOscMessage.get(1).floatValue();
}

void keyPressed() {
  if (key == 32) {
    save("Squiqqle" + int(random(1000)) + ".png");
  }
}
void keyReleased() {
  if (key == 'r') {
    background (0);
    reset();
  }
  if (key == 'd') {
    gamestate = 1;
    background(0);
  }
}


