
float angle = 0.0;
float noiseval;

void setup() {
  size(400, 400);
  noiseval=0;
  frameRate(13);
  background(220, 45, 85);
}

void draw() {

  noiseval+=0.9;

  float valorSeno = sin (angle);
  float valorCoseno = cos (angle);
  float r = map(valorSeno, -1, 1, 0, 255);
  float g = map(valorCoseno, -1, 1, 0, 255);
  float grises = map(valorCoseno, -1, 1, 250, 255);

  noStroke();
  fill(r, g, 85, 220);
  rect(0, 0, random(1, 500), 500);

  fill(grises);
  ellipse(200, 200, noise(noiseval)*125, noise(noiseval)*125);

  stroke(grises);
  strokeWeight(random(1, 15));
  noFill();
  ellipse(200, 200, noise(noiseval)*250, noise(noiseval)*250);

  angle += 0.5;
}
