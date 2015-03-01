
Circle circles[][] = new Circle[12][12];
int xspacing = 24;
int yspacing = 24;
color tempc = color(255);
int counter = 0;
int countSpeed = 20;
int timer = 1;
boolean loseCondition = false; 


void setup()
{
  size(576, 576);
  background(255);
  ellipseMode(CENTER);
  textMode(CENTER);

  for (int i = 0; i < circles.length; i++)
  {
    xspacing = 24;
    for (int j = 0; j < circles.length; j++)
    {
      circles[i][j] = new Circle(xspacing, yspacing);
      xspacing = xspacing + 48;
    }
    yspacing = yspacing + 48;
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
  if (!loseCondition)//big if
  {
    for (int a = 0; a < circles.length; a++)
    {
      for (int b = 0; b < circles.length; b++)
      {
        circles[a][b].reveal(mouseX, mouseY, tempc);
      }
    }
    if (counter == countSpeed)
    {
      for (int m = 0; m < circles.length; m++)
      {
        for (int n = 0; n < circles.length; n++)
        {
          circles[m][n].change();
        }
      }
      counter = 0;
    }

    for (int c = 0; c < circles.length; c++)
    {
      for (int d = 0; d < circles.length; d++)
      {
        circles[c][d].explode();
      }
    }
  }//delete this if
  if (!loseCondition)
  {
    timer++;
    textSize(32);
    fill(0);
    text(timer, width/2, height/2);
  }
  if (loseCondition)
  {

    textSize(32);
    fill(0);
    text("GAME OVER", width/2, height/2);
    text("SCORE:  " + timer, width/2, height/3*2);
  }
  if (countSpeed > 13)
  {
    if (timer%250 == 0)
    {
      countSpeed = countSpeed - 1;
    }
  } else if (countSpeed > 10 && countSpeed <= 13)
  {
    if (timer%350 == 0)
    {
      countSpeed = countSpeed - 1;
    }
  }
  counter++;
  println(countSpeed);
}


class Circle
{
  int x;
  int y;
  int r = 24;
  color c = color(255);
  int state;
  int R = 0;


  Circle(int tempx, int tempy)
  {
    x = tempx;
    y = tempy;
  }

  void display()
  {
    if (state == 1)
    {
      R = R + 1;
      c = color(R, 0, 0);
    }
    if(R > 255)
    {
      c = color(255,255,0);
      r = r + 2;
    }
    fill(c);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }

  void reveal(float mousex, float mousey, int tempc)
  {
    float distance = dist(x, y, mousex, mousey);
    if (distance < r && state == 1)
    {

      c = tempc;
      state = 0;
      R = 0;
    }
  }


  void change()
  {
    int chance = int(random(0, 200));
    if (chance == 3 && state != 1)
    {
      c = color(R, 0, 0);
      state = 1;
    }
  }

  void explode()
  {
    if (R == 255)
    {
      loseCondition = true;
    }
  }
}



