
ArrayList balls;
float ballWidth = 50;
int s;
int temp = 0;

void setup()
{
  size(600, 400);
  smooth();
  noStroke();

  balls = new ArrayList();
  
}

void draw()
{
  background(255);

  for (int i = balls.size() - 1; i >= 0; i--)
  { 
    Ball ball = (Ball) balls.get(i);
    ball.move();
    ball.display();    
  }
  
    s = second();

    if (s != temp) 
    {
      balls.add(new Ball(random(width), 0, random(ballWidth) ));
    }
    
    temp = s;
  
  
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY, random(ballWidth) ) );
}


class Ball
{
  
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;
  
  Ball(float tempX, float tempY, float tempW)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
  }
  
  void move()
  {
    speed = speed + gravity;
    y = y + speed;
    //x = x + random(-3, 3);
    
    if (y > height)
    {
      speed *= -0.8;
      y = height;
    }
  }
  
  void display()
  {
    fill(0);
    ellipse(x, y, w, w);
  }
}  


