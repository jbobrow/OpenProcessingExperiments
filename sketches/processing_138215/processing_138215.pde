
/*
 * Final project: An Interactive Sketch
 *
 * changing a set of ellipses amount, size and position in a grid
 *  
 * MOUSE:
 *   pos x               : ellipses amount and size
 *   pos y               : ellipses position
 *   left click          : random position
 *   mouse dragged       : move ellipses draw
 *
 * KEYS:
 *   s/S                 : save png file with date based unique name
 */

import java.util.Calendar;

color[] psychoColor = {#9983FF, #8A1DE8, #E513FF, #E8208E, #FF5F5A, 0, 255};

float tileCountX = 10;
float tileCountY = 10;
float tileWidth;
float tileHeight;
 
int count = 0;
int ellipseCnt;

float endSize;
float endOffset;

int actRandomSeed = 0;

void setup ()
{
  size (900, 900);
  background (255);
  
  tileWidth = ((width + tileCountX) / tileCountX) - tileCountX;
  tileHeight = ((height + tileCountY) / tileCountY) - tileCountY;
  
  return;
}

void draw ()
{
  if (mousePressed)
  {
    smooth ();
    noFill ();
    stroke (0, 128);
    background (255);
    randomSeed (actRandomSeed);
    
    translate ((width / tileCountX) / 2, (height / tileCountY) / 2);
    
    ellipseCnt = mouseX / 30 + 1;
    endSize = map (mouseX, 0, width, tileWidth / 2.0, 0);
    endOffset = map (mouseY, 0, height, 0, (tileWidth - endSize) / 2);
    
    for (int gridY = 0; gridY <= tileCountY; gridY ++)
    {
      for (int gridX = 0; gridX <= tileCountX; gridX ++)
      {
        pushMatrix ();
        translate (tileWidth * gridX, tileHeight * gridY);
        scale (1, tileHeight / tileWidth);
        
        int toggle = (int)random (0, 4);
        
        if (toggle == 0)
        {
          rotate (-HALF_PI);
        } 
        
        if (toggle == 1)
        {
          rotate (0);
        } 
        
        if (toggle == 2)
        {
          rotate (HALF_PI);
        }
        
        if (toggle == 3)
        {
          rotate (PI);
        } 
         
        // draw module
        for (int i = 0; i <= ellipseCnt; i ++)
        {
          float position = map (i, 0, ellipseCnt/* - 1*/, tileWidth, endSize);
          float offset = map (i, 0, ellipseCnt/* - 1*/, 0, endOffset);
          
          strokeWeight (int (random (1, 3)));
          stroke (psychoColor[int (random (0, 7))]);
          
          ellipse (offset, 0, position - tileWidth, position - tileHeight);
        }
        
        popMatrix ();
      }
    }
  }
  
  return;
}


void mousePressed ()
{
  actRandomSeed = (int)random (0, 1000);
  
  return;
}

void keyReleased ()
{
  if (key == 's' || key == 'S')
  {
    saveFrame (timestamp() + "_##.png");
  }
  
  return;
}

String timestamp ()
{
  Calendar nowTime = Calendar.getInstance ();
  
  return String.format ("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", nowTime);
}


