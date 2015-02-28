
void setup() {
  size (400, 400);
  background(176,211,252);
}
 
void draw() {
  for (int j=10; j<=350; j+=50) {
    for (int i=25; i<=300; i+=60) {
      float r = random(8);
      if (r>1) {
        duck(i, j);
      }
      else {
        goose(i, j);
      }
    }
  }
  noLoop();
}
 
void duck (float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(7, 135, 173);
  rectMode(CENTER);
  rect(36, 35, 12, 15);
  fill(188, 122, 15);
  ellipseMode(CENTER);
  ellipse(45, 45, 30, 20);
  ellipse(33, 29, 20, 10);
  triangle(53, 55, 53, 38, 80, 45);
  fill(255, 161, 8);
  triangle(15, 35, 25, 30, 25, 35);
  popMatrix();
}
 
void goose (float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(0);
  rectMode(CENTER);
  rect(36, 28, 12, 27);
  fill(255);
  rect(36, 15, 12, 10);
  fill(0);
  ellipseMode(CENTER);
  ellipse(33, 10, 20, 10);
  fill(147, 128, 93);
  ellipse(45, 45, 30, 20);
  triangle(53, 55, 53, 38, 80, 45);
  fill(50);
  triangle(15, 15, 25, 8, 25, 15);
  popMatrix();
}


