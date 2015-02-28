

void setup() {
  size(600, 600);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  fill(240, 200, 190);
  rect(80, 200, 200, 200);
  fill(80, 150, 0);
  ellipse(450, 300, 200, 200);

  if ( ( mouseX > 80) && ( mouseX < 280)) {
    background(240, 200, 190);
    fill(0);
    rect(80, 200, 200, 200);
    ellipse(450, 300, 200, 200);
  }
  if ( ( mouseX > 350 ) && ( mouseX < 550 )) {
    background(80, 150, 0);
    fill(0);
    rect(80, 200, 200, 200);
    ellipse(450, 300, 200, 200);
  }
}



