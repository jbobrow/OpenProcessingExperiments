
void setup ()
{
  size (600, 200); 
  smooth();
  noLoop();
  //frameRate(10);

  background (#57385c);
}

void draw ()
{ 
  float x = random (width);
  float y = random (height);
  float d = random (5, 15);
  stroke (255);
  strokeWeight (d/4);
  fill (#A75265);
  ellipse (x, y, d, d);
}

void mousePressed ()
{
 background (#57385c);  
}

void mouseMoved ()
{
    redraw();
}
