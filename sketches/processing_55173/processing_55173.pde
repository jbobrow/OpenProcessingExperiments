
// call image
PImage img;

// these are x and y values for levels
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int x4;
int y4;
int x5;
int y5;
int x6;
int y6;
//create an array
int barrelCount = 50;
// barrelCount can be changed to any number here
// x and y values for an ellipse
float[] xPos = new float[barrelCount];
float[] yPos = new float[barrelCount];
float[] w = new float[barrelCount];
float[] h = new float[barrelCount];
float[] rad = new float[barrelCount];
float[] spdX = new float[barrelCount];
float[] spdY = new float[barrelCount];
float[] wind = new float[barrelCount];
float[] gravity = new float[barrelCount];

boolean[] cp1 = new boolean[barrelCount];
boolean[] cp2 = new boolean[barrelCount];
boolean[] cp3 = new boolean[barrelCount];
boolean[] cp4 = new boolean[barrelCount];
boolean[] cp5 = new boolean[barrelCount];
boolean[] cp6 = new boolean[barrelCount];
boolean[] cp7 = new boolean[barrelCount];
boolean[] cp8 = new boolean[barrelCount];
boolean[] cp9 = new boolean[barrelCount];
boolean[] cp10 = new boolean[barrelCount]; 
boolean[] cp11 = new boolean[barrelCount];


void setup() {
  size(600, 600);
  img = loadImage("DonkeyKong.JPG");
  
  
  smooth();

  // these are defined x and y values for levels
  x1 = 600;
  x2 = 100;
  x3 = 0;
  x4 = 500;
  y1 = 100;
  y2 = 220;
  y3 = 350;
  y4 = 480;

  //size of ellipse
  for (int i=0; i<barrelCount; i+=1) {
    w[i] = random(10, 60);
    h[i] = w[i];
    rad[i] = w[i]/2;
    xPos[i] = 550-2*rad[i];
    yPos[i] = rad[i]*-2;

    // if ellipses are made too large, it slows down program
    // 40 is the most optimal size, however 60 shows a larger
    //diversity in size of barrels (ellipses)

    spdX[i] = 0;
    spdY[i] = 0;
    wind[i] = 0;
    gravity[i] = 0;

    cp1[i] = false;
    cp2[i] = false;
    cp3[i] = false;
    cp4[i] = false;
    cp5[i] = false;
    cp6[i] = false;
    cp7[i] = false;
    cp8[i] = false;
    cp9[i] = false;
    cp10[i] = false;
    cp11[i] = false;
  }
}

void draw() {
  background(255);
  image(img, width/2 - img.width/2, height/2 - img.height/2);
  
  strokeWeight(4);
  line(x1, y1, x2, y1);
  line(x3, y2, x4, y2);
  line(x1, y3, x2, y3);
  line(x3, y4, x4, y4);

  for (int i=0; i<barrelCount; i+=1) {
    ellipse(xPos[i], yPos[i], w[i], h[i]);
    fill(0);
    if (frameCount==1 || frameCount%150==0) {
      int j = frameCount/150;
      if (j < barrelCount) {
        gravity[j] = 0.8;
      }
    }
    // initial drop
    xPos[i] += spdX[i];
    spdX[i] += wind[i];
    yPos[i] += spdY[i];
    spdY[i] += gravity[i];

    // moves left on first level
    if (!cp1[i] && yPos[i] > y1 - rad[i]) {
      yPos[i] = y1 - rad[i];
      spdY[i] = 0;
      gravity[i] = 0;
      wind[i] = random(-0.04, -0.08);
      cp1[i] = true;
      println("cp1[i]");
    }

    // stops it from continuing to move to the left
    if (cp1[i] && !cp2[i] && xPos[i] < x2 - rad[i]) {
      spdX[i] = 0;
      wind[i] = 0.0;
      cp2[i] = true;
      println("cp2[i]");
    }

    // drops from first level to second level
    if (cp2[i] && !cp3[i] && yPos[i] < y2 - rad[i]) {
      spdX[i] = 0;
      spdY[i] = random(0.5, 1.4);
      gravity[i] = random(0.3, 0.9);
      cp3[i] = true;
      println("cp3[i]");
    }

    // causes barrel to move from left to right on second line
    if (cp3[i] && !cp4[i] && yPos[i] > y2 - rad[i]) {
      yPos[i] = y2 - rad[i];
      spdY[i] = 0.0;
      gravity[i] = 0.0;
      wind[i] = random(0.03, 0.09);
      cp4[i] = true;
      println("cp4[i]");
    }

    // drops from second level to third level 
    if (cp4[i] && !cp5[i] && xPos[i] > x4 + rad[i]) {
      spdX[i] = 0;
      wind[i] = 0;
      spdY[i] = random(0.5, 1.5);
      gravity[i] = random(0.3, 0.9);
      cp5[i] = true;
      println("cp5[i]");
    }

    // moves from right to left on third line
    if (cp5[i] && !cp6[i] && yPos[i] > y3 - rad[i]) {
      yPos[i] = y3 - rad[i];
      spdY[i] = 0.0;
      gravity[i] = 0.0;
      wind[i] = random(-0.03, -0.5);
      cp6[i] = true;
      println("cp6[i]");
    }

    // causes barrel to stop moving
    if (cp6[i] && !cp7[i] && xPos[i] < x2 - rad[i]) {
      spdX[i] = 0;
      wind[i] = 0;
      spdY[i] = 0;
      gravity[i] = 0.0;
      cp7[i] = true;
      println("cp7[i]");
    }

    // causes barrel to drop from third to forth level
    if (cp7[i] && !cp8[i] && yPos[i] < y4 - rad[i]) {
      spdX[i] = 0;
      spdY[i] = random(0.5, 1.5);
      gravity[i] = random(0.3, 0.9);
      cp8[i] = true;
      println("cp8[i]");
    }

    // should cause barrel to move from left to right along forth line
    if (cp8[i] && !cp9[i] && yPos[i] > y4 - rad[i]) {
      yPos[i] = y4 - rad[i];
      //left as y2, changed to y4 and started working correctly
      spdY[i] = 0.0;
      gravity[i] = 0.0;
      wind[i] = random(0.01, 0.09);
      cp9[i] = true;
      println("cp9[i]");
    }

    // should cause barrel to stop moving
    if (cp9[i] && !cp10[i] && xPos[i] > x4 + rad[i]) {
      spdX[i] = 0;
      wind[i] = 0.0;
      cp10[i] = true;
      println("cp10[i]");
    }

    // drops from forth level off the screen
    if (cp10[i] && !cp11[i] && xPos[i] > x4 + rad[i]) {
      spdX[i] = 0;
      spdY[i] = random(0.5, 1.5);
      gravity[i] = random(0.3, 0.9);
      cp11[i] = true;
      println("cp11[i]");
    }
    //this currently does nothing, didn't work
    /*if (cp6 && yPos > y4 - rad) {
     spdX = 0;
     //spdY = 1.0;
     //gravity = 0.5;
     wind = 0.03;
     cp7 = true;
     }*/
    //this currently does nothing, didn't work
    /*
  if (cp7 && xPos > x4 + rad){
     //spdY = 1.0;
     //gravity = .5;
     //spdX = 1.5;
     cp8 = true;
     }
     */
    //println("Thanks for all of your help James!");
  }
}


