
PImage alphaImg;

void setup () {
  size(800, 531);
  alphaImg = loadImage("byeone.png");
  background(0);
}

void draw() {
  int ix = mouseX - alphaImg.width/2;
  int iy = mouseY - alphaImg.height/2;
  image(alphaImg, ix, iy);
}

