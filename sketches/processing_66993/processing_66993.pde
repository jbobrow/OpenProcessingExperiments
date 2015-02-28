
void setup() {
  size(600, 600);
  smooth();
  background(255);
}


void draw() {
  float x = random(width);
  float y = random(height);

  if (mousePressed) {
    for (int i=0; i < 100; i++) {
      strokeWeight(2);
      stroke(41, random(255), 0);
      line(x, y, x+random(50), y+random(50));
    }
  }

  if (keyPressed) {
    if (key == 'c') {
      count = 0;
      background(random(255));
    }
  }
}
