
float f=0;
int cx, cy;
void setup()
{
  size(500,500);
  colorMode(HSB);
  rectMode(CENTER);
  smooth();
}

void draw()
{
  translate(mouseX,mouseY);
  rotate(f);
  for(int x=0; x< width; x+=5)
  {
    rotate(radians(x%1440));
    strokeWeight(1);
    stroke(255,30);
    fill(0,5);
    rect(x, 0, x+1, height);
    translate(cx,cy);
  }
  f+=.1;
}

void mouseMoved()
{
  cx = mouseX;
  cy = mouseY;
}



