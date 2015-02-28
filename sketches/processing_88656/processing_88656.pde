
void setup() {
  size (640, 480);
  smooth();
}

void draw() {
  background(150, 20, 20);

  fill(255);

  arc(300, 240, 40+mouseX, 200, PI/2, 3*PI/2);
  arc(300, 240, 50, 200, -PI/2, PI/2);
  arc(400, 240, 40+mouseX, 200, PI/2, 3*PI/2);
  arc(400, 240, 50, 200, -PI/2, PI/2);

  fill(145, 215, 45);
  ellipseMode(CENTER);
  ellipse(310-mouseX/2, 240, 50, 60);
  ellipse(410-mouseX/2, 240, 50, 60);
  fill(0);
  ellipse(310-mouseX/2, 240, 30, 50);
  ellipse(410-mouseX/2, 240, 30, 50);
}



