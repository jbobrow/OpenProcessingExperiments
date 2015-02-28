
int[] y = { 28, 32, 43, 70, 87 };

void setup() {
  size(100, 100);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  fill(0, 200, 50);
  rect(20, y[0], 20, 20);
  ellipse(50, y[3], 30, 30);  
  triangle(70, y[1], 90, y[2], 90, y[4]);
}
