
void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  noStroke();
  fill(35, 163, 212, 150);
  ellipse(random(1, 500), random(1, 500), random(1, 5), random(1, 5));

  fill(249, 95, 103, 150);
  ellipse(random(1, 500), random(1, 500), random(1, 5), random(1, 5));

  fill(245, 165, 66, 150);
  ellipse(random(1, 500), random(1, 500), random(1, 5), random(1, 5));

  fill(250, 74, 147, 150);
  ellipse(random(1, 500), random(1, 500), random(1, 5), random(1, 5));

  fill(61, 77, 92, 150);
  ellipse(random(1, 500), random(1, 500), random(1, 5), random(1, 5));
}
