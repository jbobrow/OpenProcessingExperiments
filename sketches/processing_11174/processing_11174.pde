
/*
 Much thanks for code and concepts from (Noise Wave) by Daniel Shiffman <http://www.shiffman.net< 
 Train window photo by Andrew Bulhak (http://flickr.com/photos/acb/27531047/) under CC license
 */

float yoff;
float yvalues;
PImage trainwindow; 
PImage maskImg;

void setup() { 
  size(400,300);
  stroke(0);

  // initial values
  yoff = 0.0;
  yvalues = width;

  // train window and mask
  trainwindow = loadImage("window.jpg"); 
  maskImg = loadImage("mask.gif"); 
  trainwindow.mask(maskImg); 
}

void draw() {
  // offset the landscape to position it through train widow
  pushMatrix();
  translate(0,-80);
  background(57, 60, 50); 
  moveLandscape();
  popMatrix();
  // draw the train window image
  image(trainwindow, 0, 0);
} 

void moveLandscape() {
  yoff += 0.01;
  float xoff = yoff * 6;

  for (int i = 0; i < yvalues; i++) {
    float movement1 = noise(xoff) * 80;
    float movement2 = noise(xoff) * 100;

    strokeWeight(10);
    stroke(60 + (i),124,155);
    line(i*2,(width/2) + movement1,i*10,0);

    strokeWeight(1);
    stroke(34,34,34,100);
    line(i,320,i,((width/2)-50) + movement2);

    xoff += 0.05;
  }
} 

