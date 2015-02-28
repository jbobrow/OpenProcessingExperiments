
void setup() {
  size(500, 500);
  smooth();
  fill(150,150);
  scale(.25);
  translate(300,300);
}
void draw() {
  for (int i =0;i<100;i+=5) {
    roRect(i*5, i*10, i*5, i*5, i*3);
  }
}

void roRect(float x, float y, float w, float h, float degree) {
  rectMode(CENTER);
  pushMatrix();
  translate(x, y);
  rotate(radians(degree));
  rect(0, 0, w, h);
  popMatrix();
}


