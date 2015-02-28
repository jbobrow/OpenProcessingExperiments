
PImage pic;
PImage pic1;
PImage pic2;
PImage pic3;

void setup() {
  background (0);
  size(615,300);
  pic = loadImage ("3.jpg");
  pic1 = loadImage ("l.jpg");
  pic2 = loadImage ("g.jpg");
  pic3 = loadImage ("a.jpg");
}

void draw() {
  image (pic,40,50);
  image (pic1,150,50);
  image (pic2,260,50);
  image (pic3,370,50);
  tint (150,150,150,150);
}

