
class Cannon {
  float x;
  float y;
  float w;
  float h;
  
void setupCannon() {
  x = width/2;
  y = height;
  w = 25;
  h = 50;
}
void drawCannon() {
  fill(0);
  PImage myImage = loadImage("cannon.png");
   image(myImage, x, y, w, h);
}

}

