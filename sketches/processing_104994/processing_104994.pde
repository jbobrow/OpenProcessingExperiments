
void setup() {
  size(640, 360);
  background(102);
  fill(255, 255, 255);
  textSize(24);
  text("click for spud.", 250, 300);
}

void draw() {
  if (mousePressed == true) {
    background(102);
    stroke(255, 125, 30);
    fill(255, 125, 30);
    ellipse(320 + random(-10, 10), 180 + random(-10, 10), 100 +
      random(-50, 50), 100 + random(-50, 50));
    ellipse(320 + random(-10, 10), 180 + random(-10, 10), 100 +
      random(-50, 50), 100 + random(-50, 50));
    ellipse(320 + random(-10, 10), 180 + random(-10, 10), 100 +
      random(-50, 50), 100 + random(-50, 50));
    ellipse(320 + random(-10, 10), 180 + random(-10, 10), 100 +
      random(-50, 50), 100 + random(-50, 50));
    ellipse(320 + random(-10, 10), 180 + random(-10, 10), 100 +
      random(-50, 50), 100 + random(-50, 50));
    stroke(200, 75, 30);
    fill(200, 75, 30);
    ellipse(320 + random(-50, 50), 180 + random(-50, 50), random(5), random(5));
    ellipse(320 + random(-50, 50), 180 + random(-50, 50), random(5), random(5));
    ellipse(320 + random(-50, 50), 180 + random(-50, 50), random(5), random(5));
    ellipse(320 + random(-50, 50), 180 + random(-50, 50), random(5), random(5));
    ellipse(320 + random(-50, 50), 180 + random(-50, 50), random(5), random(5));

    fill(255, 255, 255);
    textSize(24);
    text("click for spud.", 250, 300);
  }
}
