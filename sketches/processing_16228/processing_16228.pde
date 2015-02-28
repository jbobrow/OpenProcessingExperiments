
PImage a;

PFont f;

void setup() {
  size (500,500);
  a = loadImage("img1.png");
 
}
void draw() {
  a=loadImage("img1.png");

image(a,0,0,500,500);
  smooth();
  fill(0);
  ellipse(305,230, 80, 80);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  stroke(255);
  line(305,230,  cos(s) * 38 + 305, sin(s) * 38 + 230);
  line(305,230, cos(m) * 30 + 305, sin(m) * 30 + 230);
  line(305,230,  cos(h) * 25 + 305, sin(h) * 25 + 230); 
  fill(255);
   ellipse(155,230,80,80);
    float a = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float b= map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float c= map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  stroke(0);
  line(155,230, cos(a) * 38 + 155, sin(a) * 38 + 230);
  line(155,230, cos(b) * 30 + 155, sin(b) * 30 + 230);
  line(155,230, cos(c) * 25 + 155, sin(c) * 25 + 230); 
   
  
}



