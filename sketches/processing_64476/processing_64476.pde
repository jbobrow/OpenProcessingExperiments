
float dim, angle;

void setup() {
  size(400, 400);
  background(0);
  dim = width/4;
  angle = 0;
}

void draw() {

  stroke(0);
  fill(0, 30);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  stroke(255);
  fill(0, 100);
  rotate(angle);
  rect(-dim/2, -dim/2, dim, dim);
  angle += 1.0f;
}


