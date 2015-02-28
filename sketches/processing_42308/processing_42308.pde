
//Emergent Behavior
//by Daniel Wong
//Flames. Each line is connected to another line which will connect to ALL lines.




Ray[] r;

void setup()
{
  size(600, 600);
  smooth();
  stroke(#FF6F00);


  r = new Ray[200];
  for (int i=0; i<200; i++)
  {
    r[i] = new Ray();
    r[i].x = random(width);
    r[i].y = random(height);
    r[i].a = random(600);
    r[i].b = random(600);
    //r[i].c1 = random(255);
    //r[i].c2 = random(255);
    //r[i].c3 = random(255);
  }
}

void draw()
{
  background(0);
  for (int i=0; i<r.length; i++)
  {
    r[i].move();
    r[i].show();
  }
}

class Ray
{
  float x, y;
  float a, b;


  void show()
  {
    fill (random(255));
    line(x, y, a, b);

    if (y > 600)
    {
      y = 0;
    }

    if (x < 600)
    {
      x = 0;
    }

    if (x < 0)
    {
      x = 600;
    }

    if (y < 0)
    {
      y = 600;
    }
  }

  void move()
  {
    x += ( mouseX - width/2  )* 0.001 * b;
    y += ( mouseY - height/2 )* 0.001 * b;
  }
}


