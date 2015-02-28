
PImage img;
int value1=0;
int value2=0;

void setup() {
  size(480, 360);
  background(0);
  img = loadImage("uu81f2xu.gif");
}

void draw() {

  image(img, value1, 0, 120, 90);
  image(img, value1, 90, 120, 90);
  image(img, value1, 180, 120, 90);
  image(img, value1, 270, 120, 90);


  value1=value1 + 120;
} 


