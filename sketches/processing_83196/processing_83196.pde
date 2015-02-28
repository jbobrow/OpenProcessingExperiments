
// Wendy Chuyi Liu, Pong, Mods 16/17
// http://besttoshow.webs.com/

boolean up, right;
Ball sila;
Paddle baby;
boolean gameOver = false;
void setup()
{
  size(500, 490);
  sila = new Ball();
  baby = new Paddle();
}


void draw()
{
  if (gameOver == false)
  {
    background(0);
    sila.move();
    
    baby.moving();
    sila.show();
    sila.bouncing();
  

    baby.controlling();
  }
  else
  {  
    background(0);
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 300, 300);
  }
}



class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(500));
    y=int(random(500));
    up = true;
    right = false;
  }
  void move()
  {
    if (right == true)
    {
      x=x+3;
    }
    else
    {
      x= x-3;
    }
    if (up==true)
    {
      y= y-3;
    }
    else
    {
      y= y+3;
    }
  }
  void bouncing()
  {
    if (x<10)
    {
      right = true;
    }
    if (x>490)
    {
      right = false;
    }
    if (y<10)
    {
      up = false;
    }
    if (y>460)
    {
      up = true;
      gameOver = true;
      println("Game Over");
    }
    if (get(x, y+21)!=color(0))
    {

      up = true;
      println("bouncing off the paddle");
    }
  }
  void show()
  {
    //fill(179, 209, 65);
    //rect(0, 470, 500, 480);
    //noStroke();
    fill(191, 65, 209);
    ellipse(x, y, 40, 40);
    fill(255);
    textSize(30);
    text("m", x-14, y+6);
  }
}
class Paddle
{
  int a;
  Paddle()
  {
    a = 250;
  }
  void moving()
  {
    fill(255);
    rect(a, 450, 60, 10);
  }
  void controlling()
  {
    if (mousePressed == true && mouseX>a)
    {
      a = a +5;
    }
    if (mousePressed == true && mouseX<a)
    {
      a = a -5;
    }
  }
}

void gameOver()
{
  //  if (y<470)
  //  {
  //    gameOver = true;    
  //    fill (180, 130, 53);
  //    ellipse(250, 250, 200, 200);
  //    fill(180, 53, 180);
  //    textSize(50);
  //    text ("GAME OVER", 100, 250);
  //  }
}
