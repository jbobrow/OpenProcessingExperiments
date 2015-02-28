
float x1=0;


void setup() {
  size(400,400);
  background(255);
}

void draw() {
  x1=x1+1;
  background (0);
  fill(255,0,0);
  ellipse(250,250,x1,x1);
  fill (255,255,255);
  ellipse(250,250,x1-20,x1-20);
  fill(255,0,0);
  ellipse(250,250,x1-60,x1-60);
  fill (255,255,255);
 ellipse(250,250,x1-140,x1-140);
}
