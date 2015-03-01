
void setup() {
  size(600,600);
  colorMode(HSB);
}
void draw() {
 fill(random(255),255,255);
 ellipse(random(width),random(height),100,100);
}
