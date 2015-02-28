
PImage l;
PImage p;
PImage h;
PImage b;
PImage a;

PImage t;

void setup () {
  size (640, 480);
  smooth ();
  noStroke ();
  background (154, 214, 208);
  
  l = loadImage ("happylem.png");
  p = loadImage ("pineapple.png");
  h = loadImage ("honeydew.png");
  b = loadImage ("blueberry.png");
  a = loadImage ("apple.png");
  
  t = loadImage ("text.png");
}

void draw () {
  background (154, 214, 208);
  noTint();
  image (t, 382, 242);
  
  if (mouseX > 95) {
    tint (255, 100);    
    image (p, 31, 97);
  }
  if (mouseX > 165) {
    tint (255, 190);
    image (b, 135, 112);
  }
  if (mouseX > 270) {
    tint (255, 200);
    image (a, 240, 112);
  } 
  if (mouseX > 375) {
    tint (255, 220);
    image (h, 345, 110);
  }
  if (mouseX > 480) {
    noTint();
    image (l, 450, 118);
  }
}

