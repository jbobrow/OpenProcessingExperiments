
float angle = 0.01;
float offset = 250;
float scalar = 250;
float speed = 0.19;

void setup() {
  size(500,500);
  background(0);
}

void draw() {
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  fill(204,35,89);
  ellipse(x,y,50,40);
  angle += speed;
  translate(mouseX, mouseY);
  fill(0,89,89);
  triangle(0,-30,0,30,30,0);
}


