
Squares[] a;

void setup()
{
  size(800, 800);
  smooth();
  //noStroke();
  fill(255);


  a = new Squares[250];
  for (int i=0; i<a.length; i++)
  {
    a[i] = new Squares();
    a[i].x = random(width);
    a[i].y = random(height);
    a[i].r = (int)random(5, 20);
    a[i].v = (int)random(5, 20);
  }
}

void draw()
{
  background(#02102C);
  for (int i=0; i<a.length; i++)
  {
    a[i].move();
    a[i].show();
  }
}

class Squares
{
  float x, y;
  int r, v;
  void show()
  {
    rect(x, y, r, r);
    line(x, y, r, r);
    fill (random(255),random(255),random(255));
    stroke (#F6FF03);
  }



  void move()
  {
    x += ( mouseX - width/5  ) * 0.01 * v;
    y += ( mouseY - height/5 ) * 0.01 * v;

    if (x > 800)
    {
      x = 0 ;
    }

    if (y > 800 )
    {
      y = 0;
    }

    if (x < 0)
    {
      x = 800;
    }

    if (y < 0)
    {
      y = 800;
    }
  }
}


