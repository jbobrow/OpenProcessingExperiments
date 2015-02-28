
ivoid setup() { 
  size(500, 500);
  background(255);
}

void draw() { 
  noStroke();
  triangle(random(500), random(500), random(500), random(500), random(500), random(500));
  fill(0, 0, random(50, 255), random(255));
  triangle(random(500), random(500), random(500), random(500), random(500), random(500));
  fill(250, random(255));
  if (mousePressed) {
    filter(DILATE);
  }
}
