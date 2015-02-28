
float angle = 0.0;
float noiseval;
float scalar = 0.5;
float xpos;

void setup() {
  size(400, 400);
  background(240, 240, 240);
  noiseval=0;
}

void draw() {

  noiseval+=0.9;
  xpos++;

  stroke(120, 103, 87, 150);
  strokeWeight(random(1, 2));
  noFill();
  ellipseMode(CORNER);
  ellipse(xpos, 200, noise(noiseval)*12*scalar, noise(noiseval)*12*scalar);

  stroke(26, 15, 13, 150);
  strokeWeight(random(1, 2));
  noFill();
  rect(xpos, 200, random(1, 5)*scalar, random(1, 8)*-scalar);

  if (xpos > width) {
    xpos = -20;
  }

  scalar += 0.01;
}
