
/*
James Liu
*/


Circ[] c;

void setup()
{
  size(400, 400);
  smooth();
  fill(180, 200);

  c= new Circ[30];
  for (int n = 0; n<30 ; n++)
  {
    c[n] = new Circ();
    c[n].x = random(width);
    c[n].y = random(height);
  }
}

void draw()
{
  
  fill(200,30);
  rect(0,0,width,height);
  
  for (int n=0;n<30;n++)
  {
    c[n].move();
    c[n].show();
  }
}


class Circ
{
  float x, y;
  int v;

  void show()
  {
    ellipse(x, y, 30, 30);
  } 

  void move()
  {
    x=x+1;
    if (x>width)
    {
      x=random(width); 
      
    }

    if (y>height && y<height)
    {
      y=random(height); 
      
    }
  }
}


