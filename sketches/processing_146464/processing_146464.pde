
//copyright Irene Joung 2014
//ICE #22

float [] xVals = {50,120,110,320,230,210,330};
float [] yVals = {50,100,200,70,250,300,330};
color [] colorVals = {color(255,0,0),
                      color(0,0,255),
                      color(0,255,0),
                      color(79,211,224),
                      color(255,0,200),
                      color(255,210,28),
                      color(100,30,173)};

float dim = 0;

void setup()
{
  size(400,400);
  rectMode(CENTER);
  noFill();
  strokeWeight(3);
}

void draw()
{
  drawSquares();
  growSquares();
}

void drawSquares()
{
  for (int i = 0; i < xVals.length; i++)
  {
    stroke(colorVals[i]);
    rect(xVals[i],yVals[i],dim,dim);
  }
}

void growSquares()
{
  for (int i = 0; i < xVals.length; i++)
  {
    dim += 1;
  }
}

void mousePressed()
{
  if (mousePressed == true)
  {
    dim = 0;
  }
}


