
float r = 0;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
  fill(0);
  rectMode(CENTER);
}
void draw() {
  background(255);

for (int i = 0; i<width+100; i+=100) {
  for (int j = 0; j<height+100; j+=100) {
  translate(i, j);
  rotate(r);
  rect(0, 0, 90, 90);
  resetMatrix();
  }
}
  r = r + 0.02;
}


