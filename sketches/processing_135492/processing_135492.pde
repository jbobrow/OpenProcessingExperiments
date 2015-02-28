
PImage myImg;

void setup() {
  size(400,400);
  background(0);
  myImg=loadImage("http://www.processing.org/reference/images/loadImage_1.png");
}

void draw() {
  if (mousePressed) { 
   drawImg(mouseX, mouseY);
  }
}

void drawImg(int x, int y) {
 int size=abs(x-y);
 image(myImg,x,y,size,size);
}
 
