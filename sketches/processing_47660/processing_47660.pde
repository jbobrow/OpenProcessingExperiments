
PImage img02;
PFont myFont;
  
void setup() {
  size(640, 480);
  background(255);
  smooth();
  img02 = loadImage("_MG_4268.jpg");

}

float mX;
float mY;
float Mspeed;

void draw () {
  mX = mouseX;
  mY = mouseY;
  background(255);
  image(img02, 0, 0);
  
  stroke(255, 140);
  line(mX, mY, width/2+40, height/2);
  line(mX, mY, mX*mX/width, mY*mY/height);
  line(mX, mY, abs(mX-(width/2))+40, abs(mY-(height/2)));
  line(mX, mY, abs(mX-width)+40, abs(mY-height)+40);
  
  line(mX/2+45, mY/2, width/2+40, height/2);
  line(mX/2+45, mY/2, mX, mY);
  line(mX/2+45, mY/2, mX*mX/width, mY*mY/height);
  line(mX/2+45, mY/2, abs(mX-(width/2))+40, abs(mY-(height/2)));
  line(mX/2+45, mY/2, abs(mX-width)+40, abs(mY-height)+40);
  
  line(mX*mX/width, mY*mY/height, width/2+40, height/2);
  line(mX*mX/width, mY*mY/height, abs(mX-(width/2))+40, abs(mY-(height/2)));
  line(mX*mX/width, mY*mY/height, abs(mX-width)+40, abs(mY-height)+40);
  
  line(abs(mX-width)+40, abs(mY-height)+40, abs(mX-(width/2))+40, abs(mY-(height/2)));
  line(abs(mX-width)+40, abs(mY-height)+40, width/2+40, height/2);
  
  line(abs(mX-(width/2))+40, abs(mY-(height/2)), width/2+40, height/2);
  //
  
  Mspeed=abs(mouseX-pmouseX);
  noStroke();
}

