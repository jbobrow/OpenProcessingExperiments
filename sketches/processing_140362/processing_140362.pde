
// Copyright 2014 Jacklynn Pham
// HW #9

// Press SPACE to relaunch
// Press any other key to exit

// bouncing code tweaked from @Jennifer Presto

final int MAX = 100;


int [] xVals = new int [MAX];
int [] yVals = new int [MAX];
int [] topVals = new int [MAX];

//float [] diam;
color [] colorVals = new color[MAX];


int [] xPos = new int [MAX];
int [] yPos = new int [MAX];

//the ball
float diam; 

void setup()
{
  size(600, 400); 
  noStroke();
  smooth();
  rectMode(CENTER);

  initColorArray( colorVals );

  diam = 20; // diameter of the ball

  for (int i = 0; i < MAX; i++) {
    //for ( int i = 0; i < anyIntArray.length; i++)
    {
      //anyIntArray[ i ] = int( random( minVal, maxVal) );
      xVals[i] = int(random(diam , width-10));
      yVals[i] = int(random(diam, 100));
      xPos[i] = int (random(1, 5));
      yPos[i] = int (random(2, 10));
      
    }
  }
}

void initColorArray (color [] colorVals)
{
  for (int i = 0; i < colorVals.length; i++)
    colorVals [i] = color( random( 255 ), random( 255 ), random( 255 ) );
}

void initTopVal (int [] topVals)
{
  for (int i = 0; i < topVals.length; i++)
   topVals[i] = int (random (diam, width-10));
}

void draw()
{
  ball();
}


void ball()
{
  background(200);
  for (int i = 0; i < MAX; i++)
  {
    noStroke();
    rect(xVals[i], yVals[i], diam*1.5, diam*1.5);
      fill(200);
      stroke(255);
    line(xVals[i], yVals[i], width/2, 0);
    noStroke();
    ellipse(xVals[i], yVals[i], diam, diam);
      fill(colorVals[i]);
    ellipse(xVals[i], yVals[i], diam/2, diam/2);
      
    if (xVals[i] > width - diam || xVals[i] < diam) {
      xPos[i] = -xPos[i];
    }

    if (yVals[i] > height - diam || yVals[i] < diam) {
      yPos[i] = -yPos[i];
    }
    xVals[i] += xPos[i];
    yVals[i] += yPos[i];

    //    //collision check
    //    if ( dist (xVals[i], yVals[i], =) <= diam/2+diam/2)
    //    xPos[i] = -xPos[i];
    //    yPos[i] = -xPos[i];
  }
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
  else {
    exit();
  }
}



