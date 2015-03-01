
void setup() {
  size(600, 600);
  colorMode(HSB);
}
  void draw() {
    float c = random(0,255);
    fill(c,255,255);
    ellipse(random(width), random(height), 100, 100);
  }

