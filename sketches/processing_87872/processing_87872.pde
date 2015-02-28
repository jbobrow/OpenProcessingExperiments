
int j = 0;
void setup() {
  size(700, 700);
  colorMode(HSB);
  background(0);
  frameRate(-1);
}
void draw() {
  stroke(frameCount%(127)+105,255,255);
  noFill();
  translate(350, 350);
  rotate(frameCount);
    line((frameCount%(500)),(0),(0),(frameCount%(500)));
}
