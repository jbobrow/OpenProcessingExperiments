
float r;
float g;
float b;
float a;
float x;
float y= 0;

float speed = 0;
float gravity = 0.1;

float diam;

void setup() {
  size (1000,1000);
  background (0);
  smooth ();
}

void draw() {
  r=random(0-150);
  g=random(0-255);
  b=random(255);
  a=random(255);
  diam = random (20);
  x=random(width);
  stroke(0-255);
  fill (r,g,b,a);
  ellipse (x,y,diam,diam);
  
  y = y + speed;
  
  speed = speed + gravity;
  
  if (y>800) {
    speed = speed * - 0.95;
  }
}
  
  


