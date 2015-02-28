
//Matt Dawson
//madawson@andrew.cmu.edu
//copyright Matt Dawson, Carnegie Mellon University, 11/1/12, all rights reserved
//tweak of Christopher Chan's Code

//move mouse across screen to change color scheme
 
 
final int MAX = 50;
 
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
  noCursor();
 
  initColor ();
  initArray ( ballSize, 25, 150);
  initArray ( ballX, 0, width);
  initArray ( ballY, 0, height);
  initArray ( ballDX, 1, 6);
  initArray ( ballDY, 1, 6);
}
 
void draw ()
{
  fade ();
  drawBall ();
  moveBall ();
}
 
void fade ()
{
  fill (0);
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
    fill (color (ballColor [i], 30));
    ellipse (ballX [i], ballY [i], ballSize [i], ballSize [i]);
  }
  for (int i=0; i < MAX; i++)
  {
    if (0<mouseX && mouseX<200)
    {
      ballColor [i] = color (random(0, 255), 0, random(0, 255));
    }
    if (200<mouseX && mouseX<400)
    {
      ballColor [i] = color (random(0, 255), random(0, 255), 0);
    }
    if (400<mouseX && mouseX<600)
    {
      ballColor [i] = color (0, random(0, 255), random(0, 255));
    }
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


