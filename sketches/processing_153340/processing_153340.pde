
/*
 * Creative Coding
 * bridget
 * by Mike Smith
 * Copyright (c) 2014
 *
 * This simulates "Nataraja" by Bridget Riley
 * I might try to make it move
 * and regenerate itself
 * 
 */

float frameWidth = 900;
float frameHeight = 700;
float border = 80;
int numH = 20; // number of vertical stripes
int numV = 20; // number of diagonal stripes
float x = (frameWidth - 2*border) / numH; // width of vertical stripe
float z = (frameHeight - 2*border) / numV;  // width of diagonal stripe

void setup()
{
  size(int(frameWidth), int(frameHeight));
  background(255);
  noStroke();
  smooth();
  frameRate(1);
}

void draw()
{    
  float nextY = 0; 
  float m = 0;  // occasional mistake?
  for (int i=0; i<numH; i++)
  {
     nextY = nextY + z - x;
    for (int j=0; j < (numV + numH) + 2; j++)
    {
      // make occasional "mistakes"
      m = (int(random(40)) == 2) ? x/3 : 0 ;
      m = (int(random(4)) == 2) ? - m : m ;
      // occasionally use same colour, i.e., don't change fill     
      if(int(random(10)) != 2) fill(random(255), random(255), random(255));
      if(!mousePressed) // pauses redraw but keeps program running
      { 
        quad(x * i - m + border, z * j + m + nextY,
             x * (i+2) + border, z * j - 2*x + nextY,
             x * (i+2) + border, z * (j+1) - 2*x + 1 + nextY,
             x * i - m + border, z * (j+1) + m + 1  + nextY); // +1 pixel stops lines
      }
      
    }
  }
  // draw borders
  fill(255);
  rect(0, 0, width, border);
  rect(0, height - border, width, border);
  rect(0, 0, border, height);
  rect(width - border, 0, border, height);
}







