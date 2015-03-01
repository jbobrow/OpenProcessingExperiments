
int iCanvas = 600; //size of the canvas
int iSquares = 10;  //number of squares
int iMargin = 20;  //natoural border padding
int iPadding = 2;  //natural padding between squares
int iJitter = 4;   //up to + or - 4 offset to square position
int iBrightP = 20; //20% chance of a bright square

int iSquareR; //calculated (600-((2*20)+(5*2)))/(5*2)

color cNormal,cBright;

void setup() {
  size(600,600);
  iSquareR = (iCanvas-((2*iMargin)+(iSquares*iPadding)))/(iSquares*2);
  rectMode(RADIUS);
  noStroke();
  frameRate(1);
  
  cNormal = color(#990000);
  cBright = color(#ff0000);
}

void draw() {
  background(#cccccc);
  
  for(int i=0;i<iSquares;i++) {
    for(int j=0;j<iSquares;j++) {
      int x = iMargin+(i*(iPadding+(2*iSquareR)))+iSquareR;
      int y = iMargin+(j*(iPadding+(2*iSquareR)))+iSquareR;
      
      if((int)random(100)<=iBrightP)
        fill(cBright,95);
      else
        fill(cNormal,80);
      
      rect(x+(int)random(-iJitter,iJitter),y+(int)random(-iJitter,iJitter),iSquareR,iSquareR);
    }
  }
}


