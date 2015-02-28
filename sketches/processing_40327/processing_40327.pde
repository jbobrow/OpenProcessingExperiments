

/*

Snow Falling
by David Situ

Click for a breeze!

*/
int d, b,g;

void setup()
{
  d=10;
  g=0;
  size(600, 600);
  //smooth();
  noStroke();
}

void draw()
{
  fill(0,0,150);
  rect(0, 0, width, height);
  //background(width, height);
  fill(255);
  for (int i=10; i<600; i=i+15 )
  {

    for (int y=0; y<550; y=y+15)
    {
      ellipse(i+b, 5+y+d, 10, 10);
    }
  }
  d=d+1;
  if (d>10)
  {
    d=0;
    g=g+3;
  }
  if (mousePressed)
  {
    b=b+2;
  }
  else
  {
    b=0;
  }
  if (b>10)
  {
    b=0;
  }
  fill(g);
  rect(0, 550, 600, 50);
  if (g>255)
  {
    g=0;
  }
  
}


