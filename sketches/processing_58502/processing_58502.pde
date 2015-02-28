
 
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 150;
float segLength = 30;
PImage seed1;
PImage bg2;

void setup() {
  size(200, 200);
  smooth(); 
  strokeWeight(20.0);
  stroke(0, 100);
  seed1 = loadImage("seed.gif");
  bg2 = loadImage("bg2.jpg");
  }

void draw() {
  background(bg2);
  image(seed1,x-100,y,90,90);
  image(seed1,x-130,y,140,140);
  image(seed1,x-30,y+3,120,120);
  image(seed1,x-60,y+2,170,170);
  image(seed1,x-40,y+6,100,100);
  image(seed1,x-35,y+6,140,140);
  image(seed1,x+60,y+6,140,140);
  image(seed1,x+80,y+6,140,140);
  image(seed1,x+150,y+6,130,130);
  image(seed1,x+50,y-5,100,100);
  image(seed1,x+70,y+5,90,90);
  image(seed1,x+80,y+10,90,90);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  float angle1 = atan2(dy, dx);  
  
  float tx = mouseX - cos(angle1) * segLength;
  float ty = mouseY - sin(angle1) * segLength;
  dx = tx - x2;
  dy = ty - y2;
  float angle2 = atan2(dy, dx);  
  x = x2 + cos(angle2) * segLength;
  y = y2 + sin(angle2) * segLength;
  
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

