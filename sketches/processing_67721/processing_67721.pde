
import processing.video.*;
Capture cam;
PFont font;
int camw = 80;
int camh = 60;
int fps = 45;
int newx = 0; // my x
int newy = 0; // my y
int xjump = 8;
int yjump = 8;
int op = 50;

void setup() {
  background(0);
  noCursor();
  smooth();
  size(camw*xjump,camh*yjump, P2D);
  cam = new Capture(this, camw, camh, fps);
}

void draw() {
  background(242,204,47);
  cam.loadPixels();
  for(int y = 0; y < cam.height; y++) {
    for(int x = cam.width-5; x >= 0; x--) {
      int location = x + y * cam.width;
      color c = cam.pixels[location];
      // same as newx = new x + xjump
      drawPoints(c);
      //drawCurve(c);
      //drawArrow(c);      
      newx+=xjump;
    }
    newx = 0;
    newy+=yjump;
  }
  newy = 0;
  //let processing know that we're done playing with the pixel[] array    
  cam.updatePixels();
  
}

void drawPoints(color c) {
  float value = hue(c);
  tint(0, 0, 0,100);
  noFill();
  smooth();
  strokeWeight(10);
  float r = red(c);
  float g = green(c);  
  float b = blue(c);
  
  if (r < 100) {
    stroke(100, g, b);
} else if (r > 10) {
    stroke(160, b, g);
}

  if (g < 100) {
    stroke(r, 100, b);
} else if (g > 100) {
    stroke(r, 210, b);  
}

  if (b < 100) {
    stroke(r, g, 30);
} else if (b > 100) {
    stroke(r, g, 250);  
}

if (value > 100) {
  op = 400; } else
  { op = 0; } 

  stroke(r,g,b, op);
  point(newx, newy);
}

void captureEvent(Capture v) {
  v.read();}

