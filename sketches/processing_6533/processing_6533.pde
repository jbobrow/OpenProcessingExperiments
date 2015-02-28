

/*
 * A simple brick break game 
 * Jon Raymer
 * 11/14/09
 */
Ball ball;
Paddle paddle;
ArrayList bricks;
boolean gameStart = false;
int count = 0;
boolean gameFinished = false;

void setup()
{
  size(400, 400);
  smooth();
  noCursor();
  ball = new Ball();
  paddle = new Paddle();
  bricks = new ArrayList();
  
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 100);
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 110);
    b.setDeathCount(2);
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 120);
    b.setDeathCount(1);
    bricks.add(b);
  } 
}


void draw()
{
  background(0);
  
  for (int i = 0; i < bricks.size(); i++)
  {
    Brick b = (Brick) bricks.get(i);
    b.display();
    if (b.intersect(ball))
    {
      ball.yspeed *= -1;
      b.deathcount -= 1;
      if (b.getDeathCount() == 0)
      {
        bricks.remove(b);
      }
      else
      {
        b.setColor();
      }
    }
  }
  paddle.setLocation(mouseX, height - 30);
  paddle.display();
  
  if (bricks.size() == 0)
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
    fill(0, 0, 255);
    rect(x, y, 50, 10);
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


class Brick
{
  float x, y;
  color c;
  int deathcount;
  Brick()
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
        c = color(255, 0, 0);
        break;
      case 2:
        c = color(0, 255, 0);
        break;
      case 3:
        c = color(0, 0, 255);
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

