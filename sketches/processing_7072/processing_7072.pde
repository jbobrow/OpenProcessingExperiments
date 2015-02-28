
PImage bg, fg;
long lastMillis;
int wait = 250;

void setup() {
  size(600, 600, P2D);
  bg = randomImage(width, height);
  fg = randomImage(100, 100);
  swap();
  noCursor();
}

void draw() {
  image(bg, 0, 0);
  image(fg, getX(), getY());
  
  int curMillis = millis();
  if(curMillis - lastMillis > wait) {
    swap();
    lastMillis = curMillis;
  }
}

void mouseMoved() {
  lastMillis = millis();
}

PImage randomImage(int w, int h) {
  PImage img = createImage(w, h, ARGB);
  img.loadPixels();
  for(int i = 0; i < w * h; i++)
    img.pixels[i] = color(random(1) > .5 ? 255 : 0);
  img.updatePixels();
  return img;
}

int getX() {
  return constrain(mouseX - fg.width / 2, 0, width - fg.width);
}

int getY() {
  return constrain(mouseY - fg.height / 2, 0, height - fg.height);
}

void swap() {
  fg.loadPixels();
  bg.loadPixels();
    
  // copy fg to bg
  int xOff = getX();
  int yOff = getY();
  for(int y = 0; y < fg.height; y++) {
    for(int x = 0; x < fg.width; x++) {
      int fgi = y * fg.height + x;
      int bgi = (y + yOff) * bg.height + xOff + x;
      if(alpha(fg.pixels[fgi]) != 0) {
        bg.pixels[bgi] = fg.pixels[fgi];
      }
    }
  }
  bg.updatePixels();
  
  // copy bg to fg
  int s = (int) random(25, 250);
  fg = createImage(s, s, ARGB);
  xOff = getX();
  yOff = getY();
  for(int y = 0; y < fg.height; y++) {
    for(int x = 0; x < fg.width; x++) {
      int fgi = y * fg.height + x;
      int bgi = (y + yOff) * bg.height + xOff + x;
      fg.pixels[fgi] = bg.pixels[bgi];
      if(dist(fg.width / 2, fg.height / 2, x, y) > fg.width / 2)
        fg.pixels[fgi] = color(0, 0);
    }
  }
  fg.updatePixels();
}

