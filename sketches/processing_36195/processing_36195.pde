
int x1=0;
int y1=0;
int x2=width;
int y2=0;
int x3=0;
int y3=0;

void setup() {
  size(700, 400);
  smooth();
}



void draw() {
  background(255);
  if (mouseButton == RIGHT)
  {
    background(50,200,200);
  }
  if (mouseButton == LEFT)
  {
    background(50,200,60);
  }
  triangle();
  
  
}

void mouseDragged() 
{
  x3=mouseX;
  y3=mouseY;
}

void triangle() {
  fill(255,100);
  x2=width;
  triangle(x1, y1, x2, y2, x3, y3);
}


