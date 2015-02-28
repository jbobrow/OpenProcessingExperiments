
PImage bg;
PImage smell;

void setup () {
  size (400, 600);
  smooth ();
  bg = loadImage ("bg.jpg");
  smell = loadImage ("smell.png");
}

void draw () {
  image(bg, 0, 0, width, height);
}

void mouseMoved () {
  image (smell, mouseX, mouseY);
}

