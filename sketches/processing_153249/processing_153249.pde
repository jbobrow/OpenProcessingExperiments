
float theta, sz=300, x, y;
int num=20;

void setup() {
  size(500, 500);
  noFill();
  stroke(255);
  smooth(8);
  background(0);
  strokeWeight(2);
  x = width/2;
  y = height/2;
}

void draw() {
  background(0);
  pushMatrix();
  translate(x, y);
  for (int i=0; i<num; i++) {
    rotate(theta);
    stroke(255);
    arc(0, 0, sz-i*10, sz-i*10, 0, PI);
  }
  popMatrix();
  theta += 0.0523/2;
}

