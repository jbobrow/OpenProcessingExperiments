
/**
 * Mouse test
 */

float linelength = 0;
float megalength = 0;
float w ;
float h;
 
void setup() 
{
   size(800, 200);
  colorMode(RGB, 255, 255, 255, 255);
  smooth();
  w = width;
  h = height;
  megalength = sqrt(w*w + h*h);
  background(255); 
}


void resetline()
{
  linelength = 0;
  background(255); 
}

void drawline()
{
  linelength += 2;
  float x1;
  float y1;
  float x2;
  float y2;
  float d;  
  
  x1 = x2 = mouseX - w/2;
  y1 = y2 = mouseY - h;
  d = sqrt(x1*x1 + y1*y1);
  x2 = ((x1) * megalength) /d;
  y2 = ((y1) * megalength) /d;
  x1 = ((x1) * linelength) /d;
  y1 = ((y1) * linelength) /d;

  strokeWeight(1);
  stroke(0,0,0);
  line(w/2.0, h, x2 + w/2.0, y2 +  h);
  stroke(255,255,255);
  strokeWeight(4);
  line(x1 + w/2.0, y1 + h, x2 + w/2.0, y2 +  h);
  stroke(0,0,0);
  point(mouseX,mouseY);

}

void mouseMoved()
{
  //resetline();
}

void mouseReleased()
{
  resetline();
}

void mouseDragged()
{
 // resetline();
}

void mousePressed()
{
  drawline();
}

void draw() 
{   
  background(255,255,255); 
  fill(0,0,0);
  if(mousePressed)
  {
  drawline();
  }
}


