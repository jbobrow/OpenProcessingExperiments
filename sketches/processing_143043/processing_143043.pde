
/*----------------------------------
    
 Copyright by Diana Lange 2014
 Don't use without any permission
  
 This sketch is based on:
 #508 Aztec reviva by Geometry Daily
 http://geometrydaily.tumblr.com/post/58420312777/508-aztec-revival
    
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/
 
int margin;
int columns = 5;
int rows = 8;
int randomSeedNum = (int) random (100000);

color c [] = {
  (#51320f), //mittelbraun
  (#976d14), //sand
  (#53374d), //violett
  (#21120a), //dunkelbraun
  (#2f1b22), //dunkelviolett
  (#826b66), //beige
  color (255, 0) //transparent
};

void setup()
{
  size (700, 700);
  smooth();

  margin = width /10;
}

void draw ()
{
  background (237);

  randomSeed (randomSeedNum);

  float columnSteps = (width - 2*margin) / columns;
  float rowSteps = (height - 2*margin) / rows;

  noStroke();
  for (int i = 0; i < rows; i++)
  {
    float y = margin + i*rowSteps;

    for (int j = 0; j < columns; j++)
    {
      float x = margin + j * columnSteps;

      if (i % 2 == 0)
      {
        fill (c[(int) random (c.length)]);
        triangle (x, y, x+columnSteps, y, x+columnSteps, y+rowSteps);
        fill (c[(int) random (c.length)]);
        triangle (x, y, x, y+rowSteps, x+columnSteps, y+rowSteps);
      }
      else
      {
        fill (c[(int) random (c.length)]);
        triangle (x, y, x+columnSteps, y, x, y + rowSteps);
        fill (c[(int) random (c.length)]);
        triangle (x+columnSteps, y, x+columnSteps, y+ rowSteps, x, y + rowSteps);
      }
    }
  }
}

void newColorSet ()
{
  randomSeed (second () + millis());
  colorMode (HSB, 360, 100, 100);

  float h = random (360);
  float s = random (10, 50);
  c [0] = color (h, s+random (20), random (20, 50));
  c [1] = color (h, s+random (20), random (50, 75));
  c [2] = color (h, s+random (20), random (75, 100));

  h = random (360);
  s = random (30, 70);
  c [3] = color (h, s-random (20), random (10, 30));
  c [4] = color (h, s-random (20), random (30, 60));
  c [5] = color (h, s-random (20), random (60, 90));

  colorMode (RGB, 255, 255, 255);
}

void mouseDragged ()
{
  if (mouseButton == LEFT) rows = (int) map (mouseY, 0, height, 1, 30);
  else columns = (int) map (mouseX, 0, width, 1, 30);
}

void presets ()
{
  c [0] = (#51320f);
  c [1] = (#976d14);
  c [2] = (#53374d);
  c [3] = (#21120a);
  c [4] = (#2f1b22);
  c [5] = (#826b66);
  margin = width /10;
  columns = 5;
  rows = 8;
}

void keyPressed ()
{
  if (key == 'p') presets();
  if (key == 'c') newColorSet();

  if (key == 'm') randomSeedNum++;
  if (key == 'n') randomSeedNum--;

  if (key == 'b') {
    margin+=2;   
    if (margin > width/2) margin = width/2;
  }
  if (key == 'v') 
  {
    margin--;
    if (margin < 0) margin = 0;
  }
}

