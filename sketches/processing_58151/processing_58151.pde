
/*
 Erica Zambrano, Creative Computing @ Parsons 
 3rd Assignment (For Loops)
 Some bars going up and down and changing colors.  
 
 */

int x=0;
float randomR = random(255);
float randomG = random(255);
float randomB = random(255);



void setup() {
  frameRate(10);   // don't turn this to 30... Too dizzy!
  size(800, 400);  
  noStroke();
  smooth();
}


void draw() {
  background(0);

  for (float x = 0; x < width; x+=10) {

    // here is the lower layer of gray bars (dark)
    for (float i = random(height/8,height); i < height; i+=10) {
      fill(50);
      rect (x, i, 10, 10);
    }
  }

  // here is the middle layer of gray bars (middle)
  for (float x = 0; x < width; x+=10) {
    for (float i = random(height*2/8,height); i < height; i+=10) {
      fill(100);
      rect (x, i, 10, 10);
    }
  }

  // here is the upper layer of gray bars (light)
  for (float x = 0; x < width; x+=10) {
    for (float i = random(height*3/8,height); i < height; i+=10) {
      fill(150);
      rect (x, i, 10, 10);
    }
  }

  // here is the layer with colored bars
  for (float x = 0; x < width; x+=10) {

    for (float i = random(height*4/8,height); i < height; i+=10) {
      fill(randomR, randomG, randomB);
      rect (x, i, 10, 10);
    }
  }

  x=0;
  randomR=random(255);
  randomG=random(255);
  randomB=random(255);
}


