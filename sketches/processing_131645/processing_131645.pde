
void setup() {
  size(700, 240);
  noStroke();
  frameRate(77);
  smooth();
}

void draw() {
  fill(0,255,255);
  rect(0, 0, width, height);
  fill(255);
  ellipse(millis() % width, millis() % height, 20, 20);

}

