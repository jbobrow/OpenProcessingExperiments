
/*
  MFADT BOOTCAMP Day04 HOMEWORK by Sherry Zhang
  An image of <Starry Starry Night> dims and becomes bright again. 
  There is also a parallax effect as mouse moves.  
 */


PImage bkg;
PImage moon1;
PImage moon2;
float posX;
float posY;
int tintAlpha = 255;
int tintVel = 1;

void setup() {
  bkg = loadImage("bkg.jpg");
  size(1120, 533);
}

void draw() {

  background(0);

  if (tintAlpha < 128 || tintAlpha > 255) {
    tintVel *= -1;
  } 
  tintAlpha += tintVel;
  tint(255, tintAlpha);

  posX = -(mouseX - posX) * 0.01;
  posY = -(mouseY - posY) * 0.01;
  image(bkg, posX, posY);
}


