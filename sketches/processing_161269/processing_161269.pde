
void setup() {
  size(450, 450);
  background(165);
  smooth();
}
 
void draw() {
  rectMode(CORNER);
  noStroke();
  fill(162, 75);
  rect(21,21, width, height);
 
  pushMatrix();
  rectMode(CENTER);
  translate(200, 200);
  stroke(4);
  ellipse(0, 0, 150, 150);
  rotate(millis()/450.0);
  stroke(200, 75, 25);
  triangle(0, 100, 50, 0, 100, 100);
  triangle(0, -75, -25, 0, -75, -75);
  popMatrix();
  if (mousePressed) {
    filter(GRAY);
  }
  if (keyPressed) {
    filter(BLUR, 26);
  }
}

