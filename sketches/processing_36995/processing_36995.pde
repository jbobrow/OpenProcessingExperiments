
//homework 5
//copyright Pittsburgh PA September 13, 2011

int y;//width and height of the square
int r;//the x position of the entire square
int s; // the y position of the square

void setup()
{
  size(600, 600);
  noStroke();
  smooth();
  rectMode(CENTER);
}

void draw()
{
  s=100;
  while (s<600)
  {
    r=100;
    while (r<600)
    {

      y=200;
      while (y>0)
      {
        if(y%2==0)
        { 
          fill(49,255,219);
        }
        else
        {
          fill(255-mouseX/2.5);
        }
        rect(r,s, y, y);
        y=y-5;
      }

      r=r+200;
    }
    s=s+200;
  }
}

                                
