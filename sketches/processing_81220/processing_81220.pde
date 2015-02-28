
/*
RESOURCE: http://www.openprocessing.org/sketch/41149 - Charlie McDowell
*/


 PImage img;
// the tail of the shooting star
int[] shootX = new int[30];
int[] shootY = new int[30];
int METEOR_SIZE = 10; // initial size when it first appears
float meteorSize = METEOR_SIZE; // size as it fades
 
// distance a scratch moves each frame 
float ssDeltaX, ssDeltaY;
// -1 indicates no scratch
int ssTimer = -1;
// starting point of a new scratch, picked randomly
int startX, startY;
 
 
void setup() {
  size(750,500);
  img = loadImage("kat6edd.jpg");
  }

 
void draw() {
  background(img); 
   image(img, 0, 0);

  // draw the scratch
  if (mousePressed == true) 
  for (int i = 0; i < shootX.length-1; i++) {
    int shooterSize = max(0,int(meteorSize*i/shootX.length));
    // to get the tail to disappear need to switch to noStroke when it gets to 0
    if (shooterSize > 0) {
      strokeWeight(shooterSize);
      stroke(255);
    }
    else
      noStroke();
line(650, shootY[i], 650, shootY[i+1]);
    line(675, shootY[i], 675, shootY[i+1]);
    line(700, shootY[i], 700, shootY[i+1]);


    // ellipse(shootX[i], shootY[i], meteorSize*i/shootX.length,meteorSize*i/shootX.length);
  }
  meteorSize*=0.9; // shrink the scratch as it fades
 
  for (int i = 0; i < shootX.length-1; i++) {
    shootX[i] = shootX[i+1];
    shootY[i] = shootY[i+1];
  }
   
  if (ssTimer >= 0 && ssTimer < shootX.length) {
    shootX[shootX.length-1] = int(startX + ssDeltaX*(ssTimer));
    shootY[shootY.length-1] = int(startY + ssDeltaY*(ssTimer));
    ssTimer++;
    if (ssTimer >= shootX.length) {
      ssTimer = -1; // end scratch
    }
  }
 
  // create a new scratch with some random probability
  if (random(5) < 1 && ssTimer == -1) {
    newShootingStar();
  }
}
 
/*
  Starts a new scratch by randomly picking start and end point.
*/
void newShootingStar() {
  float endX, endY;
  startX = (mouseX);
  startY = (mouseY);
  endX = (mouseX+random(-20,20));
  endY = (mouseY+300);
  ssDeltaX = (endX - startX)/(float)(shootX.length);
  ssDeltaY = (endY - startY)/(float)(shootY.length);
  ssTimer = 0; // starts the timer which ends when it reaches shootX.length
  meteorSize = METEOR_SIZE;

  for (int i = 0; i < shootX.length; i++) {
    shootX[i] = startX;
    shootY[i] = startY;
  }
}

