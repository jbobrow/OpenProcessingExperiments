
//based on the 3_5 example, returns more blue/green colours except when mousePressed 
float r;
float g;
float b;
float a;
float diam;
float x;
float y;

void setup() {
  size(200,200);
  background(255);
  smooth();
}
void draw() {
  r = random(125);
  g = random(250);
  b = random(255);
  a = random(200);
  diam = random(20);
  x = random(width);
  y = random(height);
  noStroke();
  
  if (mousePressed == true) {
    fill (255,55,55,120);
  } 
  else {
    fill (r,g,b,a);
  }
  ellipse(x,y,diam,diam);
}

