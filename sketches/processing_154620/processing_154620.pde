
//11.07.2014
/*----------------------------------
 
 Original: From the square series by Roger Coqart
 The work has been used as front cover for "Computer and Graphics Art" Vol. 2 No. 4 / November 1977
 More informations: http://dada.compart-bremen.de/item/artwork/1273
 
 recode & Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
 
 -----------------------------------*/

boolean randomBrightness = false;
boolean randomColors = false;
int xRes = 40;
float steps = (float) 800 / xRes;
int yRes = (int) ((float) 800 / steps);
int xMin = 2, xMax, yMin = 2, yMax;
int walkerNum = 120;
boolean pause = false;

Walker [] w;

void setup ()
{
  size (800, 800);
  smooth();
  frameRate (25);

  xMax = xRes-2;
  yMax = yRes-2;

  w = new Walker [walkerNum];
  for (int i = 0; i < w.length; i++) 
  {
    w[i]= new Walker (xMin, xMax, yMin, yMax);
    if (randomBrightness) w[i].setMonoColor ();
    if (randomColors && i == 0) w[i].setColor();
    else if (randomColors && i > 0) w[i].setColor(w[i-1].c);
  }
}

void draw ()
{
  background (5);
  stroke (247);
  for (int i = 0; i < w.length; i++)
  {
    if (!pause) w[i].walk (xMin, xMax, yMin, yMax);
    w[i].draw (steps);
  }
}

class Walker
{
  int [] x;
  int [] y;
  color c;

  Walker (int xMin, int xMax, int yMin, int yMax)
  {
    c = color (247);

    float dice = random (100);

    int num = (int) random (dice <30 ? 10 : 1, dice < 30 ? 60 : 10);
    x = new int [num];
    y = new int [num];

    x [0] = (int) random (xMin, xMax);
    y [0] = (int) random (yMin, yMax);

    for (int i = 1; i < num; i++) 
    {
      x [i] = x[0];
      y [i] = y[0];
    }

    //for (int i = 0; i < x.length; i++) walk (5, xMin, xMax, yMin, yMax);
  }

  void setMonoColor ()
  {
    c = color (random (80, 247));
  }

  void setColor ()
  {
    c = color (random (80, 247), random (80, 247), random (80, 247));
  }

  void setColor (color c)
  {
    this.c = lerpColor (color (random (80, 247), random (80, 247), random (80, 247)), c, 0.6);
  }

  void walk (int depth, int xMin, int xMax, int yMin, int yMax)
  {
    int dice = (int) random (8);
    int X = 0, Y =0;
    switch (dice)
    {
    case 0:
      X = x [x.length-1] - 1;
      Y = y [x.length-1] - 1;
      break;

    case 1:
      X = x [x.length-1];
      Y = y [x.length-1] - 1;
      break;

    case 2:
      X = x [x.length-1] + 1;
      Y = y [x.length-1] - 1;
      break;

    case 3:
      X = x [x.length-1] - 1;
      Y = y [x.length-1];
      break;

    case 4:
      X = x [x.length-1] + 1;
      Y = y [x.length-1];
      break;

    case 5:
      X = x [x.length-1] - 1;
      Y = y [x.length-1] + 1;
      break;

    case 6:
      X = x [x.length-1];
      Y = y [x.length-1] + 1;
      break;

    case 7:
      X = x [x.length-1] + 1;
      Y = y [x.length-1] + 1;
      break;

    default:
      X = x [x.length-1] + 1;
      Y = y [x.length-1] + 1;
      break;
    }

    X = constrain (X, xMin, xMax);
    Y = constrain (Y, yMin, yMax);

    boolean found = false;
    if (depth < 4) 
    {

      for (int i = 0; i < x.length; i++)
      {
        if (!found && X == x[i] && Y == y[i]) 
        {
          found = true;
          walk (depth+1, xMin, xMax, yMin, yMax);
        }
      }
    }

    if (!found|| depth>= 4)
    {

      for (int i = 0; i < x.length-1; i++)
      {
        x [i] = x [i+1];
        y [i] = y [i+1];
      }

      x [x.length-1] = X;
      y [x.length-1] = Y;
    }
  }

  void walk (int xMin, int xMax, int yMin, int yMax)
  {
    walk (0, xMin, xMax, yMin, yMax);
  }

  void draw (float s)
  {
    stroke (c);
    float x1, y1, x2, y2;

    for (int i = 1; i < x.length; i++)
    {
      x1 = x[i-1]*s;
      y1 = y[i-1]*s;

      x2 = x[i]*s;
      y2 = y[i]*s;

      line (x1, y1, x2, y2);
    }
  }
}

void mousePressed ()
{
  setRandomValues();
  setup();
}

void setRandomValues ()
{
  xRes = (int) random (10, 80);
  steps = (float) width / xRes;
  yRes = (int) ((float) height / steps);

  walkerNum = (int) (random (10, 200) * map (xRes, 10, 80, 0.2, 1));

  int dice = (int) random (3);
  if (dice == 0)
  {
    randomBrightness = true;
    randomColors = false;
  } else if (dice == 1)
  {
    randomBrightness = false;
    randomColors = true;
  } else
  {
    randomBrightness = false;
    randomColors = false;
  }
}

void keyPressed ()
{
  pause = !pause;
}

