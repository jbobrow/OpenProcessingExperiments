
PImage sourceImage;
PImage displayImage;
int range = 30;

void setup() {
  sourceImage = loadImage("image.png");
  displayImage = loadImage("blur.png");
  size(220, 335);
}

void draw() {
  image(displayImage, 0, 0);
}

void mouseDragged() {
  int x = mouseX - (range / 2);
  int y = mouseY - (range / 2);
  displayImage.copy(sourceImage, x, y, range, range,
                                 x, y, range, range);
}


