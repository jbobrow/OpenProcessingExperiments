
void setup() {
  size(600, 400);
  colorMode(HSB);
}
void draw() {
  background(80, 92, 255);
  for (int i = 0; i<600; i=i+5) {
    for (int u=0;u<400; u=u+5) {
      noStroke();
      fill(80, random(0, mouseX), 180);
      rect(i, u, 5, 5);
    }
  }
}

