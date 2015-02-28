
// Homework 8, 02-20-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu Febuary 2013 Pittsburgh PA 15232

//Press space bar to switch between two designs

int exPhase;
float r;
float re, gr, bl;
float x, y;
PImage bg;

void setup()
{
  size(400, 400);
  bg = loadImage("hw8bg.jpg");
  //background(bg);
  y = 0;
  exPhase = 0;
  smooth();
  r = 10;
  frameRate(5);
}

void draw()
{
  if ( exPhase == 0 )
  {
    //background(bg);
    forEx();
  }
  else if ( exPhase == 1 )
  {
    whileEx();
    y = y + 10;
    if ( y > width )
    {
      y = 0;
    }
  }
  
}

void whileEx()
{
  x = 0;
  while(x < width)
  {
    noStroke();
    fill(re, gr, bl, 50);
    //rectMode(CENTER);
    rect(x, y, r, r);
    x = x + 10;
    re = random(255);
    gr = random(255);
    bl = random(255);
  }
}

void forEx()
{
  for(int i = 0; i<width; i = i+10)
  {
    for(int j = 0; j<height; j= j+10)
    {
      noStroke(); 
      fill(re, gr, bl);
      rect(i, j, r, r);
      re = random(255);
      gr = random(255);
      bl = random(255);
    }
  }
}

void keyPressed()
{
  if (key == ' ') 
  {
    if (exPhase == 0)
    {
      exPhase = 1;
      y = 0;
      background(bg);
    }
    else if (exPhase == 1)
    {
      exPhase = 0;
    }
  }
}


