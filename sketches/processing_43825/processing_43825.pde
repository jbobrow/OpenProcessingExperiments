
PImage b;

void setup () {

  size(230, 310);
  b = loadImage ("igor.jpg");
}
void draw() {

  image(b, 0, 0, width, height);
  float r = map(mouseX, 0, 100, 0, 5);
  filter(BLUR, r);
}


