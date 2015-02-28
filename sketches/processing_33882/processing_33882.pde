
/*
Norman Diaz
August 11/2011
 Arrays HW
 */

int numSpinach = 50;
float[] xPos = new float[numSpinach];
float[] yPos = new float[numSpinach];
float[] xSpeed= new float[numSpinach];
float[] ySpeed= new float[numSpinach];
PImage popeye;
PImage spinach;

void setup () {
  size (400, 300);
  smooth();
  popeye = loadImage("popeye.jpg");
  spinach = loadImage("spinach.png");
  frameRate(10);
  imageMode (CENTER);

  for (int i =0; i < numSpinach; i++) {
    xPos [i] = round(random(25, 375));
    yPos [i] = round(random(25, 275));
    xSpeed[i] = random(-2, 2);
    ySpeed[i] = random(-2, 2);

  }
}



void draw() {
  
  image (popeye,200,150);



  for (int i =0; i < numSpinach; i++) {
    //scale(random(.1,1));
    image (spinach,xPos[i], yPos[i]);
    xPos[i] = xPos[i] + xSpeed[i];
    yPos[i] = yPos[i] + ySpeed[i];
  }
}


