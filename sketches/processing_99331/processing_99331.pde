
void setup() {
  size(640, 480); 
frameRate(7);
}

void draw() {
  for (int i = 0; i < width; i+= 15) {
    for (int j = 0; j < height; j+=15) {
      fill(random(250), random(250), random(180), random(80, 180));
      rect(i, j, 20, 20);
    }
  }
}
