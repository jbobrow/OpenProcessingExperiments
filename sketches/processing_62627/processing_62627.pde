
void setup(){
  size (500,500);
}

void draw(){
  background (255);
  float a=100;
  float b=100;
  a = a+mouseX/3;
  b = b+mouseY/3;
  ellipse (a, b, 100, 100);
  line (mouseX, mouseY, a, b);
}

