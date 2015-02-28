
int x;
int y;
PImage img;
String loadPath;

void setup() {
  size(800, 600, P3D);
  background(255, 255, 255);
  loadPath = selectInput();
}

void draw() {
  img = loadImage(loadPath);
  img.resize(800, 0);
  image(img, 0, 0);
  loadPixels();
  x = 0;
  while (x < width/2) {
    y = 0;
    while (y < height) {
      color c = get(x, y);
      set(width-x*2, y, c*2);
      y = y + 1;
    }
    x = x + 1;
  }
}

