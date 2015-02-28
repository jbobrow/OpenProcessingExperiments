
/*
  Ka Kit Cheong
 Collage Engine + Motion V2
 02/21/2012
 */

// objects
PImage myImage;
PImage [] copyImage = new PImage[20];

// global variables
float step = 0.0;
float theta = PI/180;
float sinVal;

void setup() {
  size(800, 250);
  noStroke();

  myImage = loadImage("back_flip.jpg");

  for (int i=0; i<copyImage.length; i++) {
    int gap = i *40;
    copyImage[i] = myImage.get(gap, 0, 40, height);
  }
  
  frameRate(4);
}

void draw() {
  image(myImage, 0, 0);
  
  for (int i=0; i<copyImage.length; i++) {
    pushMatrix();
    translate(random(40,width-40),0);
    image(copyImage[i],0, 0);
    popMatrix();
  }
}


