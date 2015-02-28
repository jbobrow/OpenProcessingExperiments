
PImage sticker;

void setup() {
  size(800, 800);
  sticker = loadImage("sticker2.png");
}

void draw() {
  float ratio=0.5;
  image(sticker, mouseX, mouseY, sticker.width/2, sticker.height/2);
}

