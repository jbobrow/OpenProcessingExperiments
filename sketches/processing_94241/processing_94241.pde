
/*
Ani Gubba
*/
Ball ball;
Paddle paddle;
ArrayList bricks;
boolean gameStart = false;
int count = 0;
int xx;
int yy=5;
float rand = random(50);
boolean gameFinished = false;
long starttime = System.currentTimeMillis();
double scorefinal = 0;
int hardness = 0;
 
long endtime = System.currentTimeMillis();
 
double totaltime = 0;
 
double totaltimeseconds = 0;

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
 //   endtime = System.currentTimeMillis();
   // totaltime = endtime - starttime;
    //totaltimeseconds = totaltime/60000;
  }
  
  if (gameStart)
  {
    //background(0);
    ball.move();
    ball.display();
    if (paddle.intersect(ball))
    {
      ball.yspeed *= -1; //controls how fast the ball moves progressively making the game harder
    }
  }
  else
  {
    PFont f = createFont("Arial", 25, true);
    textFont(f);
    fill(250);
    textAlign(CENTER);
    if (count == 0)
    {
      background(0);
      
      text("Press Space to Start!", width/2, height/4);
      text("Select Difficulty:", width/2, height-150);
      //buttons    
    }
    else if (gameFinished)
    {
      background(0);
      //endtime = System.currentTimeMillis();
     // totaltime = endtime - starttime;
    //  totaltimeseconds = totaltime/60000;
     // scorefinal = totaltimeseconds/180*15000 * hardness;
      text("Congratulations! You won!" + "Score--" + (int) scorefinal , width/2, height/2);
  }
    else
    {
      background(0);
    //  endtime = System.currentTimeMillis();
     // System.out.println(endtime);
     // totaltime = endtime - starttime;
     // totaltimeseconds = totaltime/60000;
      scorefinal =  rand * hardness;
      text("Game Over" + "Score--" + (int) scorefinal  , width/2, height/2);
    }
    if (mouseX > 0 && mouseX <= 130) {
      
      text("You chose -Easy-",width-200,height-90);
      xx=60;
      yy=5;
      hardness = 10;
          starttime = System.currentTimeMillis();
    }
        if (mouseX > 130 && mouseX <= 260) {
      
      text("You chose -Medium-",width-200,height-90);
      xx=50;
      yy=4;
      hardness = 14;
          starttime = System.currentTimeMillis();
    }
        if (mouseX > 260 && mouseX <= 400) {
      
      text("You chose -Hard-",width-200,height-90);
      xx=40;
      yy=1;
      hardness = 18;
          starttime = System.currentTimeMillis();
    }
}
}
void keyPressed()
{
  gameStart = true;
  count++;
}

void mousePressed(){
background(0);
}


class Ball
{
  float x, y, xspeed, yspeed, radius;
  Ball()
  {
    x = 0;
    y = height - 1;
    xspeed = -3;
    yspeed = -4;
    radius = yy; //size of actual ball
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
    fill(200);
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
    rect(x, y, xx, 10); //size of the paddle
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
    rect(x, y, 40, 6);
  }
  
  void setColor()
  {
    switch(deathcount)
    {
      case 1:
        c = color(255, 100, 0);
        break;
      case 2:
        c = color(100, 255, 100);
        break;
      case 3:
        c = color(50, 150, 255);
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

