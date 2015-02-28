
PImage slowpoke;

void setup() {
  size(1000, 400);
  background(0);
  smooth ();
  noStroke ();
  slowpoke = loadImage("079Slowpoke.png");
}
void draw() {
  if (mousePressed) {
  image(slowpoke, mouseX - 120, mouseY - 170);
  tint( 200, mouseX, mouseY, 20);
}
}


