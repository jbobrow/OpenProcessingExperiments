
import processing.pdf.*;

boolean record;
boolean walk = true;
int walkWidth;

float h;
float mousex = 0;
float mousey = 0;
boolean backDark = true;
int back = 0;

void setup()
{
  size (600, 600);
  colorMode(HSB);
  fill(0);
  rect(0, 0, width, height);
  strokeWeight (2);
  smooth ();

  h = int(random(100));

  noFill();
  strokeWeight(2);
  
  walkWidth = width - (width/10);
}

void draw() 
{
  mousex = mouseX;
  mousey = mouseY;
  
  noStroke();
  fill(back, map(mousex, 0, width, 0, 255));
  rect(0, 0, width, height);
  
  //Update the Hue
  h = (h + 1) % 255;
  stroke(h, 255, 255, map(mousex, 0 , walkWidth , 0, 255));

  float ry = height/2;
  float rx = width/2;

  //----------------------------------------------------
  //----------------------------------------------------
  
  beginShape();

  //Drunk Walk Done Behind Tiles
  if (walk && mousex <= walkWidth)
  {
    for (int i=0; i < 500; i++)
    {
      vertex(rx, ry);

      ry += random(-30, 30);
      rx += random(-30, 30);
    }
  }
  
  //----------------------------------------------------
  //----------------------------------------------------
  
  stroke(h, 255, 255);//, map(mousex, width , 0, 0, 255));

  //Making Tiling
  for (int x = 1; x < (width/ 20 - 1); x = x + 1)
  {
    for (int y = 1; y < (height/ 20 - 1); y = y + 1)
    { 
      noFill();
      rect(x*20, y*20, 20, 20);
    }
  }

  endShape();

  //----------------------------------------------------
  //----------------------------------------------------
}

//Switch Background Color from White to Black or Vice Versa 
void mousePressed() 
{
  if (backDark)
  {
    back = 255;
    backDark = false;
  }
  else
  {
    back = 0;
    backDark = true;
  }
}
