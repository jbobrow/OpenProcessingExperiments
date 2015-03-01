
PImage img;

void setup() {
  size(800, 600);
  img =loadImage("http://fc00.deviantart.net/fs71/f/2013/027/0/e/hair_png_s_5_by_thy_darkest_hour-d5sz6m4.png");
}

void draw() {
  background(254);
  image(img, 0, 0);
  colorMode(HSB, 360, 100, 100);
  float hue = map(mouseX, mouseY, width, 250, 360);
  tint(hue, 100, 255);


  textSize(80);
  fill(0);
  text("Find Your Identity", 53, 553);

  textSize(80);
  fill(hue, hue, hue, hue);
  text("Find Your Identity", 50, 550);
}

