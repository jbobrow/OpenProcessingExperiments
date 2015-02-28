
float speed = 1;
float leftKey = 0;
float rightKey = 0;
float upKey = 0;
float downKey = 0;
float timer = 0.0;
float playerSize = 10;
int fairyCount = 10;
Surprise[] f = new Surprise[fairyCount];
int fairyIndex = 0;

Player tingle;
Surprise fairy;

int numBalls = 24;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
boolean drawBalls = false;

void setup()
{
  size(500,500);
  tingle = new Player("tingle_balloon.png");
  tingle.x = 250;
  tingle.y = 250;
  tingle.w = playerSize*8;
  tingle.h = playerSize*13;
  tingle.speed = 5;
  
  for(int i = 0; i < fairyCount; i += 1)
  {
    f[i] = new Surprise("fairy.png");
    f[i].x = -1000;
    f[i].y = -1000;
    f[i].w = playerSize*6;
    f[i].h = playerSize*11;
  }
  
  for(int g = 0; g < numBalls; g++)
  {
    balls[g] = new Ball(random(width),random(height),random(30,70),g,balls);
  }
  noStroke();
  fill(#E8A11C);
}

void draw()
{
  background(#7AB7E8);
  timer = timer + 0.0167;
  
  tingle.update();
  tingle.render();
  
  for(int i = 0; i < fairyCount; i += 1)
  {
    f[i].update();
    f[i].render();
  }
  
  if (drawBalls == true)
  {
    for(int g = 0; g < numBalls; g ++)
    {
      balls[g].collide();
      balls[g].move();
      balls[g].display();
    }
  }
}

void keyReleased()
{
  if(key == ' ')
  {
    f[fairyIndex].x = tingle.x;
    f[fairyIndex].y = tingle.y;
    f[fairyIndex].speed = 5;
    f[fairyIndex].directionY = 1;
    fairyIndex += 1;
    if(fairyIndex >= fairyCount)
    {
      fairyIndex = 0;
    }
  }
  
  /*if(key == 't')
  {
    for(int g = 0; g < numBalls; g ++)
    {
      balls[g].collide();
      balls[g].move();
      balls[g].display();
    }
  }*/
  
  if(keyCode == LEFT)
  {
    leftKey = 0;
  }
  if(keyCode == RIGHT)
  {
    rightKey = 0;
  }
  if(keyCode == UP)
  {
    upKey = 0;
  }
  if(keyCode == DOWN)
  {
    downKey = 0;
  }
}

void keyPressed()
{
  if(keyCode == LEFT)
  {
    leftKey = 1;
  }
  if(keyCode == RIGHT)
  {
    rightKey = 1;
  }
  if(keyCode == UP)
  {
    upKey = 1;
  }
  if(keyCode == DOWN)
  {
    downKey = 1;
  }
  if(key == 't' )
  {
    if (drawBalls == false)
    {
      drawBalls = true;
    }
    else
    {
      drawBalls = false;
    }
  }
}

class Ball 
{
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) 
  {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() 
  {
    for (int i = id + 1; i < numBalls; i++) 
    {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) 
      { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() 
  {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) 
    {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) 
    {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) 
    {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) 
    {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() 
  {
    ellipse(x, y, diameter, diameter);
  }
}

class Surprise extends SpriteObject
{
  Surprise(String filename)
  {
    super(filename);
  }
  void update()
  {
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}

class Player extends SpriteObject
{
  Player(String filename)
  {
    super(filename);
  }
  void update()
  {
    this.directionX = rightKey - leftKey;
    this.x += this.directionX * this.speed;
    this.directionY = downKey - upKey;
    this.y += this.directionY * this.speed;
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float scaleX = 1.0;
  float scaleY = 1.0;
  PImage img;
  boolean loaded = false;
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
      
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.scaleX))
      && mouseX < (this.x + (this.w * 0.5 * this.scaleX))
      && mouseY > (this.y - (this.h * 0.5 * this.scaleY))
      && mouseY < (this.y + (this.h * 0.5 * this.scaleY)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
      
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.scaleX);
    float right = this.x + (this.w * 0.5 * this.scaleX);
    float top = this.y - (this.h * 0.5 * this.scaleY);
    float bottom = this.y + (this.h * 0.5 * this.scaleY);
         
    float otherLeft = other.x - (other.w * 0.5 * other.scaleX);
    float otherRight = other.x + (other.w * 0.5 * other.scaleX);
    float otherTop = other.y - (other.h * 0.5 * other.scaleY);
    float otherBottom = other.y + (other.h * 0.5 * other.scaleY);
         
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  void update()
  {
    if (this.x > width - (this.w * this.scaleX * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.scaleX * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.scaleY * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.scaleY * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
       
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }

    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.scaleX, this.scaleY);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}


