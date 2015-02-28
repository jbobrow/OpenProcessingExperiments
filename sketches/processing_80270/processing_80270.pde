
int x = -55;
int y = 805;
int p = 805;
int k = -155;
int j = -155;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img7;
PImage img8;

void setup() {
 size(800, 550);
 smooth();
 img1 = loadImage("ant1.png");
 img2 = loadImage("fly.png");
 img3 = loadImage("antsmall.png");
 img4 = loadImage("vacuum1.png");
 img5 = loadImage("paper4.png");
 img7 = loadImage("paper3.png");
 img8 = loadImage("paper5.png");

}

void draw() {
 background(#F4F1E1);
 image(img4, 0, 0);
 image(img1, x, 430);
 image(img2, mouseX, mouseY);
 image(img5, 645, 460);
 image(img7, 150, 390);
  image(img3, y, 380);
 image(img8, 165, 475);
}

void mouseMoved() {
  x = x + 3;  
  if (x > 805) { 
    x = 0;       
  }
   y = y - 4;  
  if (y < 0) { 
    y = 805;       
  }
}

