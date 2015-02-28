
//Lauren Ruoff copyright 2014
//lruoff Homework 5

float x, y, f, g;
float diam;
float spd1, spd2;

void setup() 
{
  size(400, 400);
  background(255);
  diam = 40;
  x = diam/2;
  y = diam/2;
  f = 400-.5*diam;
  g = 400-.5*diam;
  spd1 = 2;
  spd2 = 3; 
}

void draw()
{
  fill(255, 100);
  rect(0, 0, height, width);
  drawFigures();
  moveFigures();
}

void drawFigures()
{
  fill(255, 0, 0);
  ellipse(x, y, diam, diam); 
  fill(0, 0, 255);
  ellipse(f, g, diam, diam);
}

void moveFigures() 
{   
  if (x < width-.5*diam && y <= 0+.5*diam) {
    x = x+spd1;
  }
  if (x >= width-.5*diam && y < height-.5*diam) {
   y = y+spd1;
  }
  if (y >=height-.5*diam && x > 0+.5*diam) {
    x = x+spd1*-1;
  }
  if(y > 0+.5*diam && x <= 0+.5*diam) {
    y = y+spd1*-1;
  }
    if (f <= width-.5*diam && g <= 0+.5*diam) {
   f = f+spd2;
  }
  if (f >= width-.5*diam && g <= height-.5*diam) {
   g = g+spd2;
  }
  if (g >=height-.5*diam && f > 0+.5*diam) {
   f = f+spd2*-1;
  }
  if(g >= 0+.5*diam && f <= 0+.5*diam) {
   g = g+spd2*-1;
  } 
}





