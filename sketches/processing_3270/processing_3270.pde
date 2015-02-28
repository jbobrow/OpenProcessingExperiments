
int maxDots = 700;
float g; //golden ratio
float gAng;
float rad;
float rgrowth;
float cur = 0;
float rot = 0;
float x,y;
float w = 2;
float h = 2;
float deg = 0.9992;
float colorInc;

void setup() {
  size(800,800);
  background(0);
  smooth();
  noFill();
  colorMode(HSB);
  strokeWeight(0.2);
  frameRate(80);
  
  g = 1/1.618033989;
  gAng = 360-360 * g + 0; //change this value for varying effects
  rad = 5;
  rgrowth = 1.004;
}

void draw() {
  cur++;
  rot += gAng;
  rot -= int(rot/360) * 360;
  rad *= rgrowth;
  stroke(g*cur/3,g*cur/3,255);
  x = cos(rot * PI/180) * rad + width/2;
  y = sin(rot * PI/180) * rad + height/2;
  ellipse(x,y,w,h);
  
  w+=g/14;
  h+=g/14;
}

