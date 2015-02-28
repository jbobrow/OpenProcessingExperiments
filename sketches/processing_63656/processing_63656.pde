
  float a=100;
  float b=100;

void setup(){
  size (500,500);
}

void draw(){
  background (255);

  a = a+((mouseX-a)/5.0);
  b = b+((mouseY-b)/5.0);
  ellipse (a, b, 50, 50);
  line (mouseX, mouseY, a, b);
}

