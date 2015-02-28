
/**
 * KEYS
 * del, backspace      : clear screen
 * s                   : save png
 */

PImage img;
int x = 30;
PFont fontA;

//define sketch size, load image, load font
void setup() {
  size(1000, 600);
  background(255);
  smooth();
  img = loadImage("pic.png");
  image(img,0,0);
  fontA = loadFont("Helvetica-100.vlw");
  textFont(fontA, 100);
}

//draw elements
void draw() {
  int x1 = (int) random(0, width);
  int y1 = 0;

  int x2 = round(x1 + random(-10, 10));
  int y2 = round(random(-3, 3));

  int w = (int) random(15, 70);
  int h = height;

  copy(x1,y1, w,h, x2,y2, w,h);
 
  fill(232, 207, 14);
  text("i'd settle", x, 60);
  fill(232, 207, 14);
  text("for a", x, 95);
  fill(232, 207, 14);
  text("slowdown", x, 130);

}

void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(000);
    image(img,0,0);
  }
}

