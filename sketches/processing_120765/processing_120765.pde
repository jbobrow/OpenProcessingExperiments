
int y=0;
PImage img, img2;

void setup() {
  size(300,300);
  img = loadImage ("smile.gif");
  img2 = loadImage ("HalloweenFace.gif");
}

void draw(){
  frameRate(60);
  background(57-y,159-y,234-y);
  imageMode(CENTER);
  image(img, height/2, width/2, 200-y,200-y);
  y+= 1.0;
  if (y > 200){
    frameRate(500);
    background(0);
    image(img2, height/2, 200, 50+y, 50+y);
    if (y > 600){
    y = 0;
  }
  }}
  




