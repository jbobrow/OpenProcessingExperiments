
// Beatriz Bukvic - February 10th, Creative Computing B, Benjamin Bacon

void setup() {
  size(700, 700);
  background(255);
  smooth();
}

void draw() {

  noStroke();
  rect(0, 0, 700, 700);

  stroke(188, 255, 198);
  strokeWeight(20);
  for (int i=-700; i<=700;i=i+70) {
    line(i, -40, mouseX+i, 350);
    line(mouseX+i, 350, i, 740);
  }
}



