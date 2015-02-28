
/*
Animated archimedean spiral
Translated from Pascal into processing by Silvia Rothen, Switzerland
Special Thanks to Max Kleiner and his maXbox
*/
int myHeight = 700;
int myWidth = 700;
int cx = 0;
int cy = 0;
float FValueA = 3.0;
float FValueB = 1.4;
float angle = 0.0;
float x1 = 0.0;
float x2 = 0.0;
float y1 = 0.0;
float y2 = 0.0;
int myDelay = 25;
int lastTime = 0;
boolean odd = false;
int refresh = 0;
boolean continued = true;


void setup() {
  size(myWidth, myHeight);
  strokeWeight(1);
  fill(255, 255, 255);
  stroke(255, 255, 255, 5);
  background(0, 0, 0);
  cx = myWidth / 2;
  cy = myHeight / 2;
  frameRate(1000/myDelay);
}

/* toggle drawing with left mouse button 
   restart drawing with right mouse button
*/
void mousePressed() {
  if ( mouseButton == LEFT) {
    continued = !continued;
  }
  if ( mouseButton == RIGHT) {
    FValueB = 1.4;
    background(0, 0, 255);
    stroke(255);
    x1 = 0.0;
    x2 = 0.0;
    y1 = 0.0;
    y2 = 0.0;
    continued = true;
  } 
}


void draw() {
  if (continued) {
    FValueB = FValueB + 0.001;
    refresh = refresh + 1;
    background(0, 0, 204);
  
    stroke(255, 255, 0);
    for (int i = 42; i >= 0; i = i-1) {
      angle = FValueB * i;
      x2 = cx + (FValueA + FValueB * angle) * cos(angle);
      y2 = cy + (FValueA + FValueB * angle) * sin(angle);
      if (i == 42) {
        x1 = x2;
        y1 = y2;
      } else {
        line(x1,y1,x2,y2);
        x1 = x2;
        y1 = y2;
      }
    }
  }
}
