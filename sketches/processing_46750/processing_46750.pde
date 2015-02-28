
void setup() {
  size(800, 600);
  loop();
}

void draw() {
  for (int x = 0; x < width; x+=10) {
    for (int y = 0; y < height; y+=10) {
     //fill(x/5, y/6, x/5); //con color
      rect(x * random(-10, 10), y * random(- 10, 10), random(20), random(20));
    }
  }
}


