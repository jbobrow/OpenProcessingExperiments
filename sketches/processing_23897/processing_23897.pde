
PImage img;

void setup() {
  size(800, 533);
  background(255);
  img = loadImage("bathtime.jpg");
  image(img,0,0);
}

void draw() {
  int x1 = (int) random(0, width);
  int y1 = 0;

  int x2 = round(x1 + random(-10, 5));
  int y2 = round(random(-5, 5));

  int w = (int) random(3,0);
  int h = height;

  copy(x1,y1, w,h, x2,y2, w,h);
}

void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,0);
  }
}


