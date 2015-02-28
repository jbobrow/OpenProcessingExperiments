
PImage img1, img2;

void setup() {
  size (900,900);
  img1 = loadImage("cecilcecil.jpg");
  img2 = loadImage("cecilcecil.jpg");
  img2.filter(POSTERIZE, 4);
}

void draw() {
  image(img1, 0, 0);
  image(img2, width/2, 0);
}


