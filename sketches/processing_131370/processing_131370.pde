
float theta = 90;

void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(255);
  fill(0);
  stroke(0);
  float x = (sin(theta) + 1) * width/2;
  theta += 0.01;
  ellipse(width/2,height/2,x/2,x/2);
}


