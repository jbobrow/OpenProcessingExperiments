
//created by Andrew Huang

int s, p, n, m;

void setup()
{
  size(600, 600);
}

void draw()
{
  p = p+1;
  fill(#000000);
  rect(-10, -10, 700, 700);
  /*n = mouseX - (mouseX % 20);
   m = mouseY - (mouseY % 20);
   ellipse (n+10, m+10, 20, 20);*/
  for (int y=0; y<p+1; y=y+10)
  {
    for (int x=0; x<p+1; x= x+10)
    {
      /*fill(random(200, 255), random(150, 175), random(30));
       triangle(x, y+20, x+10, y, x+20, y+20);*/
      stroke (#FFFFFF);
      line(0, y, 600, y);
      line(x, 0, x, 600);
      if (x > 600 && y > 600) 
      {
        p = 0;
      }
    }
  }
}


