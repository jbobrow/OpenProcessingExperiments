
PImage myImage;

void setup() {
  size(970, 730);
  myImage = loadImage("EarthView.jpg");

  smooth(4);
  frameRate(1200);
}

void draw() {

  int g = frameCount%485;
  int h = frameCount/485;

  color myFillSeq = myImage.get(g, h);
  stroke(myFillSeq);
  point(485+g, h);

  int i = (int) random(485);
  int j = (int) random(730);  

  color myFillRand = myImage.get(i, j);
  stroke(myFillRand);
  point(i, j);
}



