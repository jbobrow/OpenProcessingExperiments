
void setup () {
  size(800, 800);
  PImage background2 = loadImage("background.jpg");
  image(background2, 0, 0);
}

void draw() {
  PImage windows = loadImage("windows.jpg");
  image(windows, mouseX, mouseY);
}


