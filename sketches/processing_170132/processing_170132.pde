
/* @pjs preload="veg.jpg,eye.jpg"; */
PImage img1, img2;

void setup() {
  size(600,700);
  img1= loadImage("veg.jpg");
  img2= loadImage("eye.jpg");
}

void draw() {
  background(255);
  image(img1, 0, 0);
  //int my = constrain(MouseY, 0, 67);
  copy(img2, 0, 100, 100, 333, 160, 100, 300,333);
}



