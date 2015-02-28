
ArrayList myBricks;
Paddle myPaddle;
Ball myBall;
int counter = 0;
int col = 5;
int rows = 3;

void setup()
{
  size (600, 400);
  myPaddle = new Paddle();
  myBall = new Ball();
  myBricks = new ArrayList();
  for (int i = 0; i < col; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      myBricks.add(new Bricks(((i*70)+130)+ (i*10), ((j*20)+80) + (j*10), 70, 20));
    }
  }
}

void draw()
{
  background(0); 
  for (int i = 0; i < myBricks.size(); i++)
  {
    Bricks b = (Bricks) myBricks.get(i);
    b.display();
    if(b.intersect(myBall))
    {
      myBricks.remove(b);
    } 
  }
  myPaddle.display();
  myBall.display();
   myBall.bounce();
    myBall.move();

   if (myPaddle.collision(myBall))
   {
     myBall.collisionBounce();
   }
   
}

class Paddle
{
  int x;
  int y;
  int w;
  int h;

  Paddle()
  {
    y = 390;
    w = 100;
    h = 7;
  }

  void display()
  {
    x = mouseX;
    fill (255, 178, 215);
    stroke(252, 82, 164);
    strokeWeight(3);
    rectMode(CENTER);
    rect (x, y, w, h);
  }

   boolean collision(Ball b)
   {
     float distance = dist(x,y, b.myX, b.myY);
     if (distance < w/6 + b.r)
     {
       return true;
     }
     else
     {
       return false;
     }
   }
}

class Ball
{
  float myX, myY;
  //float myW, myH;
  float xspeed, yspeed;
  float r;

  Ball()
  {
    myX = random(width);
    myY = random(height);
    xspeed = 4;
    yspeed = 4;
    r = 15;
    // myW = 30;
    // myH = 30;
  }

  void display()
  {
    fill(random(100, 255), 100, 230);
    stroke(255);
    strokeWeight(2);
    ellipse (myX, myY, r*2, r*2);
  }


  void move() 
  {
    myX = myX + xspeed;  
    myY = myY + yspeed;
  }
  
  void collisionBounce()
  {
     xspeed = xspeed * -1;
     yspeed = yspeed * -1;
  }
  
  void bounce()
  {
    if ((myX < 0 ) || (myX > width))
    {
      xspeed = xspeed * -1;
    }

    if ((myY < 0 ) || (myY > height))
    {
      yspeed = yspeed * -1;
    }
  }
}

class Bricks
{
  int brickX;
  int brickY;
  int brickW;
  int brickH;

  Bricks (int tempX, int tempY, int tempW, int tempH)
  {
    brickX = tempX;
    brickY = tempY;
    brickW = tempW;
    brickH = tempH;
  }

  void display()
  {
    fill (142, 106, 255);
    stroke (106, 206, 255);
    strokeWeight(2);
    rectMode(CENTER);
    rect (brickX, brickY, brickW, brickH);
  }
  
  boolean intersect(Ball c)
   {
     float d = dist(brickX,brickY, c.myX, c.myY);
     if (d < brickW/2 + c.r)
     {
       return true;
     }
     else
     {
       return false;
     }
   }
}


