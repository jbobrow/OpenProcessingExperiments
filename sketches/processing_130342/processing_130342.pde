
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;
int r = 400;

// used to create font
PFont myFont;

void setup() {
  size(600, 600);
  background(127);
} //end setup

void draw() {
  background(127);
  stroke(255);
  noFill();
  ellipse(width/2, 300, radius*6, radius*6);
  // rotates rectangle around circle
  noStroke();
  fill(255);
  px = width/2 + cos(radians(angle))*(radius*3);
  py = width/2 + sin(radians(angle))*(radius*3);
  ellipseMode(CENTER);
  fill(0);
  ellipse(px, py, 15, 15);
  stroke(100);
  line(width/2, height/2, px, py);
  
  //continuously update the angle by the frequency
  angle += frequency;
  
} //end draw


