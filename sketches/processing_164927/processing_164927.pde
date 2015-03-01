
final static String PATH = "http://www.openprocessing.org/sketch/164924";

PImage imgFinal;

int numImages = 14;
PImage[] img = new PImage[numImages];
int randomVal = 0;

void setup() {
  size(640, 480);
  for (int i=0; i<numImages; i++) {
    img[i] = loadImage(PATH + i +".png");
  }
}

void draw() {
  image(img[randomVal], 0, 0);
}

void keyReleased() {
  if (keyCode == ENTER) {
    randomVal = (int) random(0, numImages);
    //println(randomVal);
  }
}



