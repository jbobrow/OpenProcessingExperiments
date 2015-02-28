
Ball ball;
Paddle paddle;
ArrayList blocks;
boolean gameStart = false;
int count = 0;
boolean gameFinished = false;


 
void setup()
{
  
  size(480, 400);
  smooth();
  noCursor();
  ball = new Ball();
  paddle = new Paddle();
  blocks = new ArrayList();
   
  for (int i = 0; i < 7; i++)
  {
    Block b = new Block();
    b.setLocation((50*i) + 60, 100);
    blocks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Block b = new Block();
    b.setLocation((50*i) + 60, 110);
    b.setDeathCount(2);
    blocks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Block b = new Block();
    b.setLocation((50*i) + 60, 120);
    b.setDeathCount(1);
    blocks.add(b);
  }
}
 
 
void draw()
{
  background(100,100,150);
   
  for (int i = 0; i < blocks.size(); i++)
  {
    Block b = (Block) blocks.get(i);
    b.display();
    if (b.intersect(ball))
    {
      ball.yspeed *= -1;
      b.deathcount -= 1;
      if (b.getDeathCount() == 0)
      {
        blocks.remove(b);
      }
      else
      {
        b.setColor();
      }
    }
  }
  paddle.setLocation(mouseX, height - 20);
  paddle.display();
   
  if (blocks.size() == 0)
  {
    gameFinished = true;
    gameStart = false;
  }
   
  if (gameStart)
  {
    ball.move();
    ball.display();
    if (paddle.intersect(ball))
    {
      ball.yspeed *= -1;
    }
  }
  else
  {
    PFont f = createFont("Arial", 20, true);
    textFont(f);
    fill(255);
    textAlign(CENTER);
    if (count == 0)
    {
      text("Click mouse to start", width/2, height/2);
    }
    else if (gameFinished)
    {
      text("Congratulations! You won!", width/2, height/2);
    }
    else
    {
      text("Game Over", width/2, height/2);
    }
  }
   
}
 
void mouseClicked()
{
  gameStart = true;
  count++;
}
 
 
class Ball
{
  float x, y, xspeed, yspeed, radius;
  Ball()
  {
    x = 0;
    y = height - 1;
    xspeed = 4;
    yspeed = -4;
    radius = 5;
  }
   
 void move()
  {
    x += xspeed;
    y += yspeed;
    if ((x > width) || (x < 0))
    {
      xspeed *= -1;
    }
     
    if (y < 0)
    {
      yspeed *= -1;
    }
    if (y > height)
    {
      gameStart = false;
    }
  }
   
  void display()
  {
    stroke(0);
    fill(255);
    ellipse(x, y, radius*2, radius*2);
  }
   
   
}
 
 
class Paddle
{
  float x, y;
  Paddle()
  {
    x = width / 2;
    y = height - 30;
  }
   
  void setLocation(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
   
  void display()
  {
    stroke(0);
    fill(0, 0, 200);
    rect(x, y, 80, 10);
  }
   
  boolean intersect(Ball b)
  {
    float p1 = x;
    float p2 = x + 50;
    if ((b.y + b.radius) >= y)
    {
      if ((b.x >= p1) && (b.x <= p2))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
 
  }
}
 
 
class Block
{
  float x, y;
  color c;
  int deathcount;
  Block()
  {
    deathcount = 3;
  }
   
  void setLocation(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
   
  void display()
  {
    stroke(0);
    setColor();
    fill(c);
    rect(x, y, 50, 10);
  }
   
  void setColor()
  {
    switch(deathcount)
    {
      case 1:
        c = color(111, 0, 0);
        break;
      case 2:
        c = color(150, 0, 0);
        break;
      case 3:
        c = color(170,0,0);
        break;
    }
  }
   
  int getDeathCount()
  {
    return deathcount; 
  }
   
  void setDeathCount(int dcount)
  {
    deathcount = dcount;
  }
   
  boolean intersect(Ball b)
  {
    float p1 = x;
    float p2 = x + 50;
    if (((b.y + b.radius) >= y) && ((b.y + b.radius) <= y + 10))
    {
      if ((b.x >= p1) && (b.x <= p2))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
  
   }
     
}
