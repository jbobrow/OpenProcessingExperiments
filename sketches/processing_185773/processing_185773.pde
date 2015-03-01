
int x_list[]=new int[50];
int y_list[]=new int[50];

void setup() {
  size(600,600);
  frameRate(1.5);
}

void draw() {
  background(10);
  stroke(#8DB6CD);
  strokeWeight(5);
  noFill();
  beginShape();
  for (int i = 0; i < 50; i++) {
  float rx = random(600);
  float ry = random(600);
  vertex(rx, ry);
  }
  endShape(CLOSE);
}
