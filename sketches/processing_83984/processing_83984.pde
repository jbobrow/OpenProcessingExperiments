
//Bryan Lee, Tron, Computer Programming 1, Block 7
int direction = RIGHT;
int compdirection = LEFT;
int compdirection1 = UP;
int compdirection2 = DOWN;
int x = 1;
int y = 353;

int b = 694;
int c = 353;

int d = 1;
int e = 694;

int f = 694;
int g = 1;

int a = 100;
boolean gameover = false;
void setup()
{
  size(706, 706);
  frameRate(20);
  background(a);
  stroke(255);
  line(0, 0, 705, 0);
  line(705, 0, 705, 705);
  line(705, 705, 0, 705);
  line(0, 705, 0, 0);
}

void keyPressed()
{
  if ( key == 'w')
  {
    direction = UP;
  }
  else if ( key == 's')
  {
    direction = DOWN;
  }
  else if ( key == 'a')
  {
    direction = LEFT;
  }
  else if ( key == 'd')
  {
    direction = RIGHT;
  }
}
void draw()
{
  if (get(x, y) != color(a))
  {
    fill(0);
    textSize(30);
    text("YOU LOSE! COMPUTER WINS!", 150, 350);
    gameover = true;
  }
  if (gameover == true)
  {
    direction = 0;
  }
  else
  {
    human();
    computer();
    computer1();
    computer2();
  }
}
void human()
{
  stroke(255);
  fill(0, 0, 255);
  rect(x, y, 10, 10);
  if (direction == UP)
  {
    y-=11;
  }
  if (direction == DOWN)
  {
    y+=11;
  }
  if (direction == RIGHT)
  {
    x+=11;
  }
  if (direction == LEFT)
  {
    x-=11;
  }
}
void computer()
{
  if (get(b-1, c) != color(a))
  {
    compdirection = UP;
  }
  if ( get(b, c-1) != color(a) && compdirection == UP)
  {
    compdirection = RIGHT;
  }
  if ( get(b+11, c) != color(a) && compdirection == RIGHT)
  {
    compdirection = DOWN;
  }
  if ( get(b, c+11) != color(a) && compdirection == DOWN)
  {
    compdirection = LEFT;
  }
  if (get(b, c) != color(a))
  {
    fill(0);
    textSize(30);
    text("COMPUTER RED LOSES! YOU WIN!", 150, 350);
    gameover = true;
  }
  if (gameover == true)
  {
    compdirection = 0;
  }
  else
  {
    stroke(255);
    fill(255, 0, 0);
    rect(b, c, 10, 10);
    if (compdirection == UP)
    {
      c-=11;
    }
    if (compdirection == DOWN)
    {
      c+=11;
    }
    if (compdirection == RIGHT)
    {
      b+=11;
    }
    if (compdirection == LEFT)
    {
      b-=11;
    }
  }
}
void computer1()
{
  if (get(d-1, e) != color(a))
  {
    compdirection1 = UP;
  }
  if ( get(d, e-1) != color(a) && compdirection1 == UP)
  {
    compdirection1 = RIGHT;
  }
  if ( get(d+11, e) != color(a) && compdirection1 == RIGHT)
  {
    compdirection1 = DOWN;
  }
  if ( get(d, e+11) != color(a) && compdirection1 == DOWN)
  {
    compdirection1 = LEFT;
  }
  if (get(d, e) != color(a))
  {
    fill(0);
    textSize(30);
    text("COMPUTER GREEN LOSES! YOU WIN!", 150, 350);
    gameover = true;
  }
  if (gameover == true)
  {
    compdirection1 = 0;
  }
  else
  {
    stroke(255);
    fill(0,255,0);
    rect(d, e, 10, 10);
    if (compdirection1 == UP)
    {
      e-=11;
    }
    if (compdirection1 == DOWN)
    {
      e+=11;
    }
    if (compdirection1 == RIGHT)
    {
      d+=11;
    }
    if (compdirection1 == LEFT)
    {
      d-=11;
    }
  }
}
void computer2()
  {
    if (get(f-1, g) != color(a))
    {
      compdirection2 = UP;
    }
    if ( get(f, g-1) != color(a) && compdirection2 == UP)
    {
      compdirection2 = RIGHT;
    }
    if ( get(f+11, g) != color(a) && compdirection2 == RIGHT)
    {
      compdirection2 = DOWN;
    }
    if ( get(f, g+11) != color(a) && compdirection2 == DOWN)
    {
      compdirection2 = LEFT;
    }
    if (get(f, g) != color(a))
    {
      fill(0);
      textSize(30);
      text("COMPUTER YELLOW LOSES! YOU WIN!", 150, 350);
      gameover = true;
    }
    if (gameover == true)
    {
      compdirection2 = 0;
    }
    else
    {
      stroke(255);
      fill(255, 255, 0);
      rect(f, g, 10, 10);
      if (compdirection2 == UP)
      {
        g-=11;
      }
      if (compdirection2 == DOWN)
      {
        g+=11;
      }
      if (compdirection2 == RIGHT)
      {
        f+=11;
      }
      if (compdirection2 == LEFT)
      {
        f-=11;
      }
    }
  }
