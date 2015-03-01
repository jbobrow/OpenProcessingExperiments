
Circle circles[][] = new Circle[25][25];
int xspacing = 12;
int yspacing = 12;
boolean state = true;
color tempc = color(255);
int colorChange = 0;

void setup()
{
  size(600, 600);
  background(255);
  ellipseMode(CENTER);

  for (int i = 0; i < circles.length; i++)
  {
    xspacing = 12;
    for (int j = 0; j < circles.length; j++)
    {
      circles[i][j] = new Circle(xspacing, yspacing, state);
      xspacing = xspacing + 24;
    }
    yspacing = yspacing + 24;
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < circles.length; i++)
  {
    for (int j = 0; j < circles.length; j++)
    {
      circles[i][j].display();
    }
  }

  for (int a = 0; a < circles.length; a++)
  {
    for (int b = 0; b < circles.length; b++)
    {
      circles[a][b].reveal(mouseX, mouseY, tempc);
    }
  }
}

void mousePressed()
{
  if (colorChange == 0)
  {
    tempc = color(0);
    colorChange++;
  } else if (colorChange == 1)
  {
    tempc = color(255, 0, 0);
    colorChange++;
  } else if (colorChange == 2)
  {
    tempc = color(0, 255, 0);
    colorChange++;
  } else if (colorChange ==3)
  {
    tempc = color(0, 0, 255);
    colorChange = 0;
  } 

}
  
  void keyPressed()
  {
   tempc = color(255); 
  }
class Circle
{
  int x;
  int y;
  int r = 12;
  boolean state;
  color c = color(255);


  Circle(int tempx, int tempy, boolean tempstate)
  {
    x = tempx;
    y = tempy; 
    state = tempstate;
  }

  void display()
  {

    fill(c);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }

  void reveal(float mousex, float mousey, int tempc)
  {
    float distance = dist(x, y, mousex, mousey);
    if (distance < r)
    {
      if (state)
      {
        c = tempc;
      }
    }
  }
}



