
PShape form01, form02, form03, form04, form05, form06;
PFont f, f2;
int w = 400;
int h = 400;
float r1, r2, r3;
float p1, p2, p3;
float bg;
float myScale;
int current_min;  // Values from 0 - 59
int last_min = 0;  // Values from 0 - 59

void setup() {
  size(400, 400);
  frameRate(30);
  f = loadFont("HelveticaNeue-UltraLight-48.vlw");      
  textFont(f, 150);
  loadShapes();
}

void draw() {
  current_min = second();

  if (current_min != last_min) {
    background(r1-50, r2-50, r3-50);
    forms();
  rect(20, 20, 300, 200);
  }
  last_min = current_min;

  fill(250);  
  text (current_min, 40, 200 ); 
}













