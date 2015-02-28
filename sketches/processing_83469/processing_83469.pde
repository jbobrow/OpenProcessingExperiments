
//William T., Android Pong, CP Mods 14-15
BounceBall who;
Paddle hi;
int score = 0;
int score2 = 0;
void setup()
{
  size(700, 500);
  who = new BounceBall();
  hi = new Paddle();
  textSize(40);
}
void draw()
{
  background(0);
  fill(1);
  rect(0, 0, 2, 500);
  rect(698, 0, 700, 500);
  if (mousePressed == true)
  {
    if (mouseY < hi.b)
    {
      hi.movup();
    }
    if (mouseY > hi.b)
    {
      

        hi.movdown();
      
    }
  }
  fill(254);
  hi.showp();
  fill(255);
  who.mov();
  who.show();
  who.bounce();
  if (keyPressed == true);
  {
    if ( key =='r')
    {
      who.x = 350;
      who.y = 250;
      hi.a = 10;
      hi.b = 210;
      score = 0;
      score2 = 0;
    }
  }
}
class BounceBall
{
  int x, y;
  boolean up, right;
  BounceBall()
  {
    x = 350;
    y = 250;
    up = false;
    right = true;
  }
  void mov()
  {
    if (up == true)
    {
      y = y - 5;
    }
    else if (up == false)
    {
      y = y + 4;
    }
    if (right == true)
    {
      x = x + 7;
    }
    else if (right == false)
    {
      x = x - 7;
    }
  }
  void bounce()
  {

    if (get (x-15, y) != color(0))
    {
      right = true;
    }
    if (get (x+15, y) != color(0))
    {
      right = false;
    }
    if (get (x, y+15) != color(0))
    {
      up = true;
    }
    if (get (x, y-15) != color(0))
    {
      up = false;
    }
    if (get( who.x+15, who.y) != color(0))
    {
      if (get(who.x+15, who.y) != color(254))
      {
        score++;
      }
    }
    if (get(who.x-15, who.y) != color(0))
    {
      if (get(who.x-15, who.y) != color(254))
      {
        score2++;
      }
    }

    fill(254);
    text(score, 225, 30);
    text(score2, 450, 30);
  }
  void show()
  {
    ellipse(x, y, 26, 26);
  }
}
class Paddle
{
  int a, b;
  Paddle()
  {
    a = 10;
    b = 200;
  }
  void movup()
  {
    b = b - 6;
  }
  void movdown()
  {
    b = b + 6;
  }
  void showp()
  {
    rect(a, b, 10, 70);
    rect(a + 670, b, 10, 70);
  }
}

