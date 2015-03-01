
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/88531*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="JG1.jpg, JG2.jpg, JG3.jpg, JG4.jpg, JG5.jpg, JG6.jpg, JG7.jpg, JG8.jpg, JG9.jpg,
JG10.jpg, JG11.jpg, JG12.jpg, JG13.jpg, JG14.jpg, JG15.jpg"; */

int maxImages = 15;
int imageIndex = 0;
int backHue = 0;
int backSat = 0;
int backBri = 0;

PImage[] images = new PImage[maxImages];

void setup() {
  
  size (950, 800);
  for (int i=0; i < images.length; i ++) {
    images[i] = loadImage( "JG" + (i+1) + ".jpg" );
  }
colorMode(HSB, 360, 100, 100);
frameRate(10);
ellipseMode(CENTER);

}

void draw() {
  
  background(backHue, backSat, backBri);
  
  if (imageIndex == 0) {
    backSat = 100;
    backBri = 0;
  }
  else if (imageIndex == 2) {
    backSat = 0;
    backBri = 30;
  }
  else if (imageIndex == 3 || imageIndex == 4) {
    backSat = 0;
    backBri = int(random(0, 100));
  }
  else if (imageIndex == 5) {
    backSat = 0;
    backBri = 0;
  }
  else if (imageIndex == 7) {
    backHue = 223;
    backSat = 100;
    backBri = 50;
  }
  else if (imageIndex == 8 || imageIndex == 9) {
    backHue = 223;
    backSat = int(random(0, 100));
    backBri = int(random(0, 100));
  }
  else if (imageIndex == 10) {
    backHue = 0;
    backSat = 100;
    backBri = 100;
  }
  else if (imageIndex == 11) {
    fill(0, 0, 100);
    for (int i = 0; i < 100; i++) {
      ellipse (random(0, width), random(0, height), 30, 30);
    }
  }
  else if (imageIndex == 12) {
    stroke(0, 0, 100);
    strokeWeight(6);
    for (int i = 0; i < 100; i++) {
      line (random(0, width), 0, random(0, width), height);
    }
  }
  else if (imageIndex == 13) {
    backSat = 100;
    backBri = 50;
  }
  else if (imageIndex == 14) {
    backHue = 223;
  }
  
  image(images[imageIndex], 100, 100);
}

void mouseReleased() {
  if (imageIndex == 14) {
    imageIndex = 0;
  }
  else imageIndex ++;
}


