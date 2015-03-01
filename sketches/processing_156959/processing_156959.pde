
int i, j;
float easing = .07;
float size;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  for(i = 0; i < 80; i++) {
    for(j = 0; j < 80; j++) {
        size = 50 - dist(mouseX, mouseY, i*40, j*40) * easing;
      noStroke();
      fill(random(mouseX), random(mouseY), 255);
      ellipse(i*40, j*40, size, size);
    }
  } 
}


