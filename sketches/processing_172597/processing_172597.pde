
import geomerative.*;
//import processing.opengl.*;
 
// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;
 
float d; //distance
float sp = 285; //points
float spr; //points random
float sdr; //distancerandom
float sd = 100; //distance
float sw = 1; //strokeweight
 
color nyan = color(200, 50, 50);
color sky = color(256, 256, 256);
 
String letter = "a";
 
 
 
void setup() {
  size(400, 560);
  frameRate(20);
 
  PFont font = loadFont("juice.vlw");
  textFont(font);
 
  background(256, 256, 256);
 
  // VERY IMPORTANT: Always initialize the library in the setup
  RG.init(this);
 
  // Enable smoothing
  smooth();
  strokeCap(SQUARE);
 
}

