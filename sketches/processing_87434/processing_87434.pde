
/* @pjs preload="untitled0.jpg, untitled1.jpg, untitled2.jpg, untitled3.jpg, untitled4.jpg, untitled5.jpg, untitled6.jpg"; */

int imageIndex = 0;
boolean reverse = false;

PImage[] images = new PImage[6];

void setup() {
  size(500,500);
  for (int i = 0; i < 6; i ++) {
    images[i] = loadImage ( "untitled" + i + ".jpg");
  }
  frameRate(30);
}

void draw() {
  background(255);
  image(images[imageIndex],mouseX,mouseY);
  if (reverse == false){
    imageIndex+=1;
  }
  else {
    imageIndex-=1;
  }
  if (imageIndex==5) {
    reverse = true;
  }
  if (imageIndex==0) {
    reverse = false;
  }
}


