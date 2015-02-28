
void setup() {
  size(1000, 800);
  background(255);
}

boolean run = true;

void draw() {
  if (run) {
    for (int r = 0; r < width; r = r + 10) {
      float q = map(r, 0, width, 0, 255);
      fill(200 + q, 255, 100 + q); 
      rectMode(CENTER);
      rect(width/2, height/2, width - r, height - r);
    }
    for (int r = 0; r < height; r = r + 5) {
      for (int y = 0; y < height; y = y + 10) {
        for (int x = 0; x < width; x = x + 40) {
          float w = map(r, 0, height, 0, 100);
          float q = random(-1000, 1000);
          line(x - q, y + 10 + q, x + 10 - q, y + q);
          line(x + 10 - q, y + q, x + 20 - q, y + 10 + q);
        }
      }
    }
    run = false;
  }
}
