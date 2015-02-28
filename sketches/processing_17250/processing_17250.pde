
PImage img1, img2;

void setup () {
  size (400,400);
  img1 = loadImage ("franklin_eye.png");
  img2 = loadImage ("franklin.png");
  background (255);
}

void draw () {
  image (img1, (((mouseX+34)*0.07)+150), (((mouseY+34)*0.05)+90));
  image (img1, (((mouseX+34)*0.07)+274), (((mouseY+34)*0.05)+96));
  img2 = loadImage ("franklin.png");
  image (img2, 0, 0);
}

