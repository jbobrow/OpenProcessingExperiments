
Circle circles[][] = new Circle[10][10];
int xspacing = 25;
int yspacing = 25;
int counter = 0;

void setup()
{
  size(500, 500);
  background(255);
  ellipseMode(CENTER);
  for (int i = 0; i < circles.length; i++)
  {
    xspacing = 25;
    for (int j = 0; j < circles.length; j++)
    {
      circles[i][j] = new Circle(xspacing, yspacing);
      xspacing = xspacing + 50;
    }
    yspacing = yspacing + 50;
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
      circles[a][b].mouse(mouseX, mouseY);
    }
  }



  if (counter == 3)
  {
    for (int k = 0; k < circles.length; k++)
    {
      for (int f = 0; f < circles.length; f++)
      {
        circles[k][f].grow();
      }
    }
    counter = 0;
  }
  counter = counter + 1;
}

class Circle
{
 int x;
int y;
int r = 0;
int growth = int(random(1,3));
color c = color(random(0,255),random(0,255),random(0,255));

Circle(int tempx, int tempy)
{
  x = tempx;
  y = tempy;
}
 
 void display()
{
  fill(c);
  ellipse(x,y, r*2,r*2); 
}

void grow()
{

 
  r = r + growth;

}

void mouse(float mx, float my)
{
  float distance = dist(x,y,mx,my);
  if(distance < r)
  {
    c = color(random(0,255),random(0,255),random(0,255));
    growth = int(random(1,3));
   r = 0; 
  }
}


  
  
  
  
  
  
  
}


