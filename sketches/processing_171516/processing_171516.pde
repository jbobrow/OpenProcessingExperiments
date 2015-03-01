
void setup() {
  size(464, 600);
  background(200, 200, 200);
}

void draw() {
  if (mousePressed == true) {
    background(200, 200, 200);
  }
  if (keyPressed == true) {
    noStroke();
    fill(255, random(100), random(100), 10);
    ellipse(random(464), random(600), 100, 100);
    ellipse(random(464), random(600), 100, 100);
    ellipse(random(464), random(600), 100, 100);
    fill(random(100), 255, random(100), 10);
    ellipse(random(464), random(600), 100, 100);
    ellipse(random(464), random(600), 100, 100);
    ellipse(random(464), random(600), 100, 100);
    fill(random(100), random(100), 255, 10);
    ellipse(random(464), random(600), 100, 100);
    ellipse(random(464), random(600), 100, 100);
  }
}


