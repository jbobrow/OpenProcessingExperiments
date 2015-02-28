
void setup() {
  size(365, 365);
  background(255);
  strokeWeight(70);
  smooth();
  for (float x=30; x<= width-35; x=x+60) {
    for (float y=30;y<=height-35;y=y+60) {
      stroke(0);
      point(x, y);
    }
  }
}
