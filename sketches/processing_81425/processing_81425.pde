

PImage img;
PImage sponge;

float x = -10;
float y = -5;
float angle1 = 0.0;
float segLength = 0;



void setup() {
  size(500,500);
  img = loadImage("tabletop.png");
  sponge = loadImage("sponge2.png");
}

void draw() {
  background(0);
  image(img,0,0);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  image(sponge,x,y);

}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x-30, y-30);
  rotate(a);
  line(-10, -10, segLength, 0);
  popMatrix();
}


