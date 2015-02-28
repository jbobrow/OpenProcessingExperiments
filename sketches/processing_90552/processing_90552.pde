
// Min Kyung Kim, minkyunk@andrew.cmu.edu
// Copyright Min Kyung Kim February 2013. All rights reserved. 
// Homework 8

int fxPhase;
int y, fx, fy, dia;

void setup ( )
{
  size (400, 400);
  background (255);
  fxPhase = 0;
  dia = 15;
  fx = 30;
  fy = 35;
  y = 20;
}

void draw ( )
{
  if ( fxPhase == 0 ) {
    forFx ( );
  } else if ( fxPhase == 1 ) {
    whileFx ( );
    y = y + 10;
    if (y > width ) {
      y = 0;
    }
  }
}

void whileFx ( )
{
  int x = 0;
  while (x < width) {
    stroke (255);
    fill (255, random (100), random (100));
    rect (x, y, dia, dia);
    x = x + fx;
  }
}

void forFx ( )
{ noStroke ( );
  for (int g = 0; g < width; g = g + 5) {
    for (int h = 0; h < height; h = h + 5) {
      fill (255, random (100), random (100));
      rect (g, h, dia, dia);
    }
  }
}

void keyPressed ( )
{
  if (key == ' ') {
    fxPhase = 1;
    background (255);
  } else if (fxPhase == 1) {
    fxPhase = 0;
  }
}

