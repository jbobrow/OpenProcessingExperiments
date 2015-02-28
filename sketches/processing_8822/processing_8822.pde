
ArrayList balls;
int i;
int j;
void setup()
{
  size(500,500,P2D);
  //smooth();
  balls = new ArrayList();
}
void draw()
{
  noStroke();
  fill(0,0,0,150);
  rect(0,0,width,height);
  
  for(i = balls.size()-1;i >= 0;i--)
  {
    Ball ball = (Ball) balls.get(i);
    for(j = balls.size()-1;j > i;j--)
    {
      Ball target = (Ball) balls.get(j);
      stroke(255,0,0,ball.lifetime/pow(dist(ball.x,ball.y,target.x,target.y),2)*1000);
      line(ball.x,ball.y,target.x,target.y);
      if(dist(ball.x,ball.y,target.x,target.y) > 2)
      {
        if(ball.lifetime > 500)
        {
          ball.vx -= 2*(target.x-ball.x)/pow(dist(ball.x,ball.y,target.x,target.y),2);
          ball.vy -= 2*(target.y-ball.y)/pow(dist(ball.x,ball.y,target.x,target.y),2);
        }
        if(ball.lifetime < 500)
        {
          ball.vx += 2*(target.x-ball.x)/pow(dist(ball.x,ball.y,target.x,target.y),2);
          ball.vy += 2*(target.y-ball.y)/pow(dist(ball.x,ball.y,target.x,target.y),2);
        }
      }
    }
  }
  for(i = balls.size()-1;i >= 0;i--)
  {
    Ball ball = (Ball) balls.get(i);
    ball.display();
    ball.update();
    if(mousePressed && mouseButton == RIGHT)
    {
      ball.dragStrength = 10;
    }
    else
    {
      ball.dragStrength = 0;
    }
    if(ball.isDead())
    {
      balls.remove(i);
    }
  }
}
void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    balls.add(new Ball(mouseX,mouseY));
  }
}
class Ball
{
  float vx,vy;
  float dx,dy;
  float x,y;
  float mouseDist;
  float dragStrength;
  
  float friction;
  float bigness;
  float lifetime;
  Ball(float tempx,float tempy)
  {
    x = tempx;
    y = tempy;
    vx = mouseX-pmouseX;
    vy = mouseY-pmouseY;
    friction = 1.02;
    lifetime = 1000;
    bigness = 10;
    dragStrength = 0;
  }
  void update()
  {
    dx = mouseX-x;
    dy = mouseY-y;
    mouseDist = dist(mouseX,mouseY,x,y);
    if(mouseDist > 1)
    {
      vx += dx/pow(mouseDist,2)*dragStrength;
      vy += dy/pow(mouseDist,2)*dragStrength;
    }
    x += vx;
    y += vy;
    vx /= friction;
    vy /= friction;
    if(x < 0)
    {
      vx = -vx;
      x = 0;
    }
    if(y < 0)
    {
      vy = -vy;
      y = 0;
    }
    if(x > width)
    {
      vx = -vx;
      x = width;
    }
    if(y > height)
    {
      vy = -vy;
      y = height;
    }
    bigness = lifetime/50;
    lifetime -= 1;
  }
  void display()
  {
    noStroke();
    ellipseMode(CENTER);
    fill(255,255,255,255/1000.*lifetime);
    //stroke(0,0,0,255/1000.*lifetime);
    ellipse(x,y,bigness,bigness);
  }
  boolean isDead()
  {
    if(lifetime < 0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}


