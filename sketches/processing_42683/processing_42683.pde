
int xPos;
int yPos;
int dia=100;
int xAccel;
int yAccel;
color cirCol;

void setup() {
  size(640, 480);
  xPos=1+dia/2;
  yPos=1+dia/2;
  xAccel=1;
  yAccel=10;
  smooth();
  noStroke();
  frameRate(300);
  colorMode(RGB, width-dia, 255, width-dia);
}


void draw() {
  background(128);
  cirCol = color(width-(xPos+dia/2), 0, xPos+dia/2);
  fill(cirCol);
  ellipse(xPos, yPos, dia, dia);

  //horizontal bounce
  if (xPos<=0+dia/2)
  {
    xAccel=1;
    xPos=dia/2+1;
  }
  else if (xPos>=width-dia/2)
  {
    xAccel=-1;
    xPos=width-dia/2-1;
  }
  else //increment xPos
  {
    xPos=xPos+xAccel;
  }
  
  //vertical bounce
  if (yPos<=0+dia/2)
  {
    yAccel=10;
    yPos=dia/2+1;
  }
  else if (yPos>=height-dia/2)
  {
    yAccel=-10;
    yPos=height-dia/2-1;
  }
  else //increment xPos
  {
    yPos=yPos+yAccel;
  }

  /*if (xPos>=width-dia/2)
   {
   xPos=0;
   }
   else
   {
   xPos++;
   }*/
}

void mouseClicked() {
  yPos=yPos+50;
}


