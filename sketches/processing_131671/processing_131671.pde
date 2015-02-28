
//Nicolette Hashey
//2/3/2014
//trig
float radius=50;
float sradius=10;
float a=11;
float r=10;
float cx, cy;
float x=0;

void setup() {
  size(600, 200);
  background(0);
}



void draw() {
  //translate(0,0);
  background(0);
  noStroke();
  //draw initial ellipse
  fill(127);
  ellipse((width/8), 75, 2*radius, 2*radius);
  //circle point going around larger circle
  translate((width/8), 75);
  rotate(1+r);
  //second ellipse
  fill(255);
  ellipse(cos(a), sin(a)*radius, 10, 10);
  r+=.1;

  //this is supposed to draw a curve, but it draws a rotating line
  for (int i=0; i<width; i++) {
    strokeWeight(2);
    stroke(255);
    cx = width/8 +cos(a)*(radius);
    cy= 75 +sin(a)*(radius);
    point(width/8+radius+i, cy);
  }
}



