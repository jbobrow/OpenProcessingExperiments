
float a=0;
float b=0;
float posX;
float posY;
float change=0.05;


void setup() {
  background(240);
  size(600, 600);
}


void draw() {

  fill(60, 200, 0);
  ellipse(a, b, 100, 100);

  posX = mouseX - a;
  posY = mouseY - b;

  a += posX*change;
  b += posY*change;
}



