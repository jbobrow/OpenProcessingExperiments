
void setup() {
  size(800, 600);
  background(0);
  smooth();
}
int cx = 10;
int cy = 10;


void draw() {
  float c;
  float rectWidth;
  float rectHeight;

  for (int i = 0; i < width; i = i + 40) {
    for (int j = 0; j < height; j = j + 40) {

  
      rectWidth = cx + random(mouseX/10);
      rectHeight = cy + random(mouseY/10);
      c = map(mouseX, 0, 500, 255, 0);
      fill(random(c, 255), random(c, 255), random(c, 255), 50);
      rect(i, j, rectWidth, rectHeight);
    }
  }
}
