
int numberOfCircles = 700;
void setup() {
  size(600, 400);
  background(0,0, 0);
  noStroke();
  frameRate(2);
}
void draw() {
  background(0, 0, 0);
  for (int i = 0; i < numberOfCircles; i++) {
    int px   = (int)random(0, width);
    int py   = (int)random(0, height);
    int raio = (int)random(5, 100);
    int r    = (int)random(0, 256);
    int g    = (int)random(0, 256);
    int b    = (int)random(0, 256);
    fill(r, g, b);
    ellipse(px, py, raio, raio);
  }
}
