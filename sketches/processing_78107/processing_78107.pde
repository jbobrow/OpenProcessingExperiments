
//Eugene Liang, Tron, CP1, Mods  16-17


int i = 2;
int change = 1;
int x = 250;
int y = 200;
int direction = RIGHT;
int compX = 350;
int compY = 200;
int compDir = LEFT;
void setup()
{
  size (600, 600);
  background(0);
  frameRate(60);
}
void draw()
{
  stroke(255, 255, 255);
  if (get(x, y) !=color(0, 0, 0)) //crashed
  {
    noStroke();
    fill(247, 160, 17);
    ellipse(x, y, 40, 40);
    fill(0, 0, 255);
    textSize(20);
    text("BOOM!", x-35, y+7);
    fill(255, 0, 0);
    textSize(50);
    text("HAHA", 230, 250);
    text("YOU DIED!", 180, 300);
    text("TOO FAST?", 170, 350);
    textSize(30);
    text("HOW LONG CAN YOU LAST?", 110,400);
  }
  else
  {
    point(x, y);
    if (direction == RIGHT)
    {
      x = x + 10;
    }
    else if (direction == LEFT)
    {
      x = x - 10;
    }
    else if (direction == UP)
    {
      y = y - 10;
    }
    else if (direction == DOWN)
    {
      y = y + 10;
    }
  }
  i++;

  if (i > change)
  {
    change = change+1;
  }

  fill(255, 255, 0);
  print(change/2 + " ");
}

void keyPressed()
{
  if (key == 'a'|| keyCode == LEFT)
  {
    direction = LEFT;
  }
  else if (key == 'd' || keyCode == RIGHT)
  {
    direction = RIGHT;
  }
  else if (key == 'w' || keyCode == UP)
  {
    direction = UP;
  }
  else if (key == 's' || keyCode == DOWN)
  {
    direction = DOWN;
  }
}
