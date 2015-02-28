
class Flower {
  int x;
  int y;
  int w;
  int h;
  PImage img;

  Flower (int x, int y, PImage img) {
    this.x = x;
    this.y = y;
    this.w = img.width;
    this.h = img.height;
    this.img = img;
  }

  void draw() {
    image(img, x, y);
  }
}

