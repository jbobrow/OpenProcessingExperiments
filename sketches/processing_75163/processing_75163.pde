
int r = 255;
int b = 255;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  for (int y = 0; y <= width; y = y + 30) {
    for (int x = 0; x <= width; x = x + 30) {
      fill(r-mouseY/2, 0, mouseY/2);
      noStroke();
      ellipse(x, y, 30, 30);
    } 
    for (int x = 0; x <= width; x = x + 10) {
      stroke(255);
      line(x, y, 200, mouseY);
    } 
    }
}
