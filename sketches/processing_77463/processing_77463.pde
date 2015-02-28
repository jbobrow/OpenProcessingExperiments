
//Christopher Chan
//ckchan@andrew.cmu.edu
//Homework 11
//Code written on 30 OCT 2012 (c)


//press 1 - red/blue color scheme
//press 2 - red/green color scheme
//press 3 - blue/green color scheme
//press spacebar - random color scheme


final int MAX = 200;

int[] ballSize = new int [MAX];
int[] ballX = new int [MAX];
int[] ballY = new int [MAX];
int[] ballDX = new int [MAX];
int[] ballDY = new int [MAX];
color[] ballColor = new int [MAX];

void setup ()
{
  size (600, 600);
  smooth ();
  ellipseMode (CENTER);
  noStroke ();

  initColor ();
  initArray ( ballSize, 25, 300);
  initArray ( ballX, 0, width);
  initArray ( ballY, 0, height);
  initArray ( ballDX, 1, 2);
  initArray ( ballDY, 1, 4);
}

void draw ()
{
  fade ();
  drawBall ();
  moveBall ();
}

void fade ()
{
  fill (#FFFFFF, 100);
  rect (0, 0, width, height);
}

void initArray (int [] emptyArray, int low, int high)
{
  for (int i=0; i < emptyArray.length; i++)
  {
    emptyArray [i] =int (random (low, high));
  }
}

void initColor ()
{
  for (int i=0; i< ballColor.length; i++)
  {
    ballColor [i] = color (random(0, 255), random(0, 255), random(0, 255));
  }
}

void drawBall ()
{
  for (int i=0; i < MAX; i++)
  {
    fill (color (ballColor [i], 10));
    ellipse (ballX [i], ballY [i], ballSize [i], ballSize [i]);
  }
}

void moveBall ()
{
  for (int i=0; i < MAX; i++)
  {

    ballX [i] = ballX [i] + ballDX [i];
    ballY [i] = ballY [i] + ballDY [i];

    //bouncing
    if ( width-ballX[i] < ballSize[i]/2 )
    {
      ballDX[i] = -ballDX[i];
    }
    else if ( ballX[i] < ballSize[i]/2 )
    {
      ballDX[i] = -ballDX[i];
    }
    else if ( (height-ballY[i])<ballSize[i]/2 )
    {
      ballDY[i] = -ballDY[i];
    }
    else if ( ballY[i] < ballSize[i]/2 )
    {
      ballDY[i] = -ballDY[i];
    }
  }
}

void keyPressed ()
{
  for (int i=0; i < MAX; i++)
  {
    if (key == '1')
    {
      ballColor [i] = color (random(0, 255), 0, random(0, 255));
    }
    else if (key == '2')
    {
      ballColor [i] = color (random(0, 255), random(0, 255), 0);
    }
    else if (key == '3')
    {
      ballColor [i] = color (0, random(0, 255), random(0, 255));
    }
    else if (key == ' ')
    {
      ballColor [i] = color (random (0,255), random(0, 255), random(0, 255));
    }
  }
}


