
//Eric Wong Emergent Behavior

circles[] a;
int value = 100;
void setup()
{
  size(600, 600);
  noStroke();
  smooth();
  
  a = new circles[value];

  for (int i=0; i<value; i++)
  {
    a[i] = new circles();

    a[i].r = 255;
    a[i].g = 255;
    a[i].b = 255;

    a[i].s = 20;
    a[i].x = random(250, 350);
    a[i].y = random(250, 350);


    if (i>value)
    {
      i=0;
    }
  }
}

void draw()
{
  background(200, 200, 200);
  for (int i=0; i<value; i++)
  {
    a[i].show();
    a[i].move();
  }
}

class circles
{
  float s, x, y;
  float r, g, b;


  void show()
  {
    fill(r, g, b);
    ellipse(x, y, s, s);
  }

  void move()
  {
    x=x +random(1, 20);
    y=y +random(1, 20);
    if (x>600)
    {
      x=1;
    }
    if (y>600)
    {
      y=1;
    }
  }
}

//void keyPressed()
{
  if (key == 'z' || key == 'z')
  {
  value++;
  }


//if (key == 'x' || key == 'x')
{
  value--;
}

}


