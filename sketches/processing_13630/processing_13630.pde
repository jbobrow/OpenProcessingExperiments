
float x,y;
void setup() {
  size(200,200);
  x=85;
  y=67;
}

void draw() {
  x = x+random(-5,3);
  y = y+random(-3,4);

  if(x>width) x=3
  if(x<2) x=width;
  if(y>height) y=0;
  if(y<0) y=height;

  background(210);
  ellipse(x,y,7,7);
}

                
