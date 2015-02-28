
//kevin hyun khyun
//Copyright 2012

final int MAX = 200;

float [] x1 = new float [MAX];
float [] y1 = new float [MAX];
color[] col = new color [MAX];

float xoff = 0.0;
float yoff = 0.15;

void setup()
{
  size(800,800);
  smooth();
  initColorArray();
//  initXY();
  noStroke();

//  col = new color [MAX];
}

void draw()
{
  initiate();
  //  mouseCap();
  circle();
  noiseMovement();
}


void initiate()
{
  background(255);
}


void initColorArray ()
{
  for (int i= 0; i< col.length; i++)
  {
    col [i] = color(int(random(255)), int(random(255)), int(random(255)));
  }
}


void circle()
{
  for (int i = MAX -1; i > 0; i--)
  {
    ellipse( x1[i], y1[i], i/2, i/2);
    fill(col[i]);
  }
}

void noiseMovement()
{
  xoff = xoff + .015;
  x1[0] = noise(xoff)*width;
  for (int i = MAX-1; i > 0; i--) {
    x1[i] = x1[i-1];
  }

  yoff = yoff + .01
  ;
  y1[0] = noise(yoff)*height;
  for (int i = MAX-1; i > 0; i--) {
    y1[i] = y1[i-1];
  }
}



