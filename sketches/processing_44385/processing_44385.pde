
int x;
int y;
int a;
int h = 0;
int m = 0;
int s = 0;
int dX = 10;

PImage jesus;

void setup() {
  size(384, 534);
}

void draw() {
  
  jesus = loadImage("jesus-1.gif");
  image(jesus, 0, 0);

  //HOURS
  h = (int)(hour() * 10.625 * 2) % 255;
  if (h >= 255) {
    dX = -1 *dX;
  }
  loadPixels();
  x = 0;
  while (x < 162) {
    y = 0;
    while (y < 534) {
      color ch = (int)red(get(x, y));
      pixels[(y * width) + x] = color(h, ch, x);
      y = y + 1;
    }
    x = x + 1;
  }
  updatePixels();
  
  //MINUTES
  m = (int)(minute() * 4.25) % 255;
  if (h >= 255) {
    dX = -1 *dX;
  }
  loadPixels();
  x = 162;
  while (x < 227) {
    y = 0;
    while (y < 534) {
      color cm = (int)red(get(x, y));
      pixels[(y * width) + x] = color(m, cm, x);
      y = y + 1;
    }
    x = x + 1;
  }
  updatePixels();
  
  //SECONDS
  s = (int)(second() * 4.25) % 255;
  if (h >= 255) {
    dX = -1 *dX;
  }
  loadPixels();
  x = 227;
  while (x < 384) {
    y = 0;
    while (y < 534) {
      color cs = (int)red(get(x, y));
      pixels[(y * width) + x] = color(s, cs, x);
      y = y + 1;
    }
    x = x + 1;
  }
  updatePixels();

}

