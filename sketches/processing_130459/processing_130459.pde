
///Lauren Ruoff copyright 2014 ICE4
//lruoff

float x, y, diam;
color col;

void setup() 
{
  size(400, 400);
  background(0);
  
  x = 200;
  y = 200;
  diam = 100;
  col = color(200, 200, 0);
}

void draw() 
{
  drawcircle1 (x, y, diam);
  drawcircle2 (300, 200, 50, col);
}

void drawcircle1 (float x, float y, float diam)
{
 fill(0, 200, 0);
 ellipse(x, y, diam, diam); 
}

void drawcircle2 (float x, float y, float diam, color col)
{
 fill(col);
 ellipse(x, y, diam, diam);
}


