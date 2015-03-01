
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Julio Montabes
 * Copyright (c) 2014 Julio Montabes
 *
 * In the next iteration of the square drawing sketch, this version selects 5 squares
 * and a fixed gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 * There are an oscillatory deviation and a random deviation of the position of the squares.
 * l-click stops the image; s-key saves the actual image to a file called 25Squares.jpg
 */


int FPS=5; // Frames per second (constant)
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
float fPDN=0; // Pulsating Deviation relating to iNum
float fPDF=0; // Pulsating Deviation relating to PFS


void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(FPS);  // set the frame rate to 1 draw() call per second

  randomSeed(hour()+minute()+second()+millis()); //J
  fCellSize = ( width - (iNum + 1) * iGap ) / (float)iNum;
  offsetX = fCellSize/16.0; // calculate shadow offset
  offsetY = fCellSize/16.0;
}


void draw() {

  if (mousePressed==false) {
    iF++;
    fPDN=1+0.1*sin(iF%(3*iNum)*2*PI/(3*iNum));
    fPDF=1+0.1*sin(iF%FPS*2*PI/FPS);

    background(180); // clear the screen to grey

    for (int i=0; i<iNum; i++) {

      fRY = random(0.95, 1.05);
      fDY = fPDF*fRY;

      cSquare=color(240*fPDN, 57*random(0.5, 1.5), 57*random(0.2, 1.2));

      for (int j=0; j<iNum; j++) {

        fRX = random(0.9, 1.1);
        fDX = fRX;

        fill(140, 180); // shadow
        //stroke(1);
        rect(fDX*(iGap * (i+1) + fCellSize * i + offsetX), fDY*(iGap * (j+1) + fCellSize * j + offsetY), fPDN*fCellSize, fPDN*fCellSize);

        fill(cSquare, 180);
        noStroke();
        rect(fDX*(iGap * (i+1) + fCellSize * i), fDY*(iGap * (j+1) + fCellSize * j), fPDN*fCellSize, fPDN*fCellSize);
      }
    }
  }
  if (keyPressed == true && key == 's') {
    saveFrame("25Squares.jpg");
    println("I print");
  }
} //end of draw 





