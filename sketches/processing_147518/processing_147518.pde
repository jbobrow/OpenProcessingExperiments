
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/147516*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage img1, img2;

void setup() {
  size (900,900);
  img1 = loadImage("cecilcecil.jpg");
  img2 = loadImage("cecilcecil.jpg");
  img2.filter(GRAY);
}

void draw() {
  image(img1, 0, 0);
  image(img2, width/2, 0);
}



