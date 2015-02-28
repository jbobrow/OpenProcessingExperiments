
void setup() {
  smooth();
  size(500, 500);
  noCursor();

  ellipseMode (CENTER);
}

void draw() {
  frameRate(8);


  if (mousePressed) {

    noStroke ();
    fill(38, 255, 200, 30);
  }

  else {
  }

  stroke(255, 38, 150);
  ellipse(mouseX, mouseX, mouseY, mouseY );

  noStroke();
  fill(5, 5);
  rect(0, 0, 500, 500);
}
