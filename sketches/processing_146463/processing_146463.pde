
//copyright Yoon-ji Kim 2014
//51-257 A
//ICE22

float [] xVals = {50, 100, 125, 150, 200, 225, 370};
float [] yVals = {50, 75, 200, 250, 300, 50, 375};
float diam = 0;
float deltaDim = .5;

color [] colorVals = {color(255, 0, 0),
                      color(0, 0, 255),
                      color(0, 255, 0),
                      color(245, 223, 52),
                      color(52, 245, 227),
                      color(191, 107, 234),
                      color(105, 167, 234),
                      };       

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  frameRate(17);
}

void draw()
{
  drawFigures();
  growFigures();
}

void growFigures()
{
  for(int i = 0; i < xVals.length; i++)
  {
    diam += deltaDim;
  }
}

void drawFigures()
{
  for(int i = 0; i < xVals.length; i++)
  {  
     noFill();
     strokeWeight(4);
     stroke(colorVals[i]);
     rect(xVals[i], yVals[i], diam, diam);
  }
}

void mousePressed()
{
  diam = 0;
}


