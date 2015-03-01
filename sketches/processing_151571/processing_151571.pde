
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */


int FPS=10; // Frames per second (constant)
int iF=0; // Frame counter
int iNum=5; // Number of squares
int iGap=1; // gap between squares in pixels
float fCellSize = 0;
float offsetX = 0; // calculate shadow offset
float offsetY = 0;
float fDX=1, fDY=1; // Displacement of X, Displacement of Y
float fRX, fRY; // Random for X and Y
float fA=2*PI/FPS; // Angle of each frame around an imaginary circle in radians
color cSquare=#FF0000; // Color of the Quare



void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  //frameRate(1);  // set the frame rate to 1 draw() call per second
  frameRate(FPS);  // set the frame rate to 1 draw() call per second

  randomSeed(hour()+minute()+second()+millis()); //J
  fCellSize = ( width - (iNum + 1) * iGap ) / (float)iNum;
  offsetX = fCellSize/16.0; // calculate shadow offset
  offsetY = fCellSize/16.0;
}


void draw() {

  iF++;

  background(180); // clear the screen to grey

  //println("fCellSize = " + fCellSize, "frames", frameRate, "iF=", iF%10, sin(iF%10*2*PI/FPS));


  for (int i=0; i<iNum; i++) {
    if (fDX>1.95) {
      cSquare=#FF0000;
    } else {
      //cSquare=color(240*random(0.9, 1.1), 57*random(0.5, 1.5), 57*random(0.5, 1.5));
      cSquare=color(240*(1+0.1*sin(iF%(3*iNum)*2*PI/(3*iNum))), 57*random(0.8, 1.2), 57*random(0.5, 1.5));
    }
    for (int j=0; j<iNum; j++) {

      fRX = random(0.9, 1.1);
      fDX = fRX;
      fRY = random(0.9, 1.1);
      fDY = (1+0.1*sin(iF%FPS*2*PI/FPS))*1;

      fill(140, 180); // shadow
      stroke(1);
      rect(fDX*(iGap * (i+1) + fCellSize * i + offsetX), fDY*(iGap * (j+1) + fCellSize * j + offsetY), fCellSize, fCellSize);

      fill(cSquare,180);
      noStroke();
      rect(fDX*(iGap * (i+1) + fCellSize * i), fDY*(iGap * (j+1) + fCellSize * j), fCellSize, fCellSize);
    }
  }
} //end of draw 

void  iFrame() {
  println("hola its iFrame");
} 



