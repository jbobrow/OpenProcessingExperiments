
PFont times;
PFont comic;
float angle = 0;
float x = 0;
float speed = 1;
Player sonic;
int bulletCount = 10;
Bullet[] b = new Bullet[bulletCount];
Bullet star;
int bulletIndex = 0;
float leftKey = 0;
float rightKey = 0;
float timer = 0;
float timer2 = 0;

void setup()
{
  size(500,500);

  sonic = new Player("sonic.png");
  sonic.x = 250;
  sonic.y = 400;
  sonic.s = 0.25;
  sonic.speed = 5;
  sonic.directionX = -1;
  
  star = new Bullet("star.png");
  star.s = 0.25;
  star.x = -1000;
  star.y = -1000;
  
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("troll.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.25;
  }
}

void draw()
{
  background(0);
  timer += 0.0167;
  timer2 += 0.0167;
  
  sonic.update();
  sonic.render();
  
  star.update();
  star.render();
  
  if (timer > 0.5)
  {
    if (random(0, 1) < 0.75) // 75% chance
    {
      star.x = sonic.x;
      star.y = sonic.y;
      star.speed = 10;
  
      star.directionY = -1;
      star.directionX = 0;
    }

    timer = 0;
  }
  
  if (timer2 > 0.05)
  {
    if (random(0, 1) < .25) // 25% chance
    {
      b[bulletIndex].x = sonic.x;
      b[bulletIndex].y = sonic.y;
      b[bulletIndex].speed = 10;
      b[bulletIndex].directionY = -1;
      bulletIndex += 1;
      if (bulletIndex >= bulletCount)
      {
        bulletIndex = 0;
      }
    }
    timer2 = 0;
  }
  
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i].update();
    b[i].render();
  }
}

class Bullet extends SpriteObject
{
  Bullet(String filename)
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
  float s = 1.0;
  PImage img;
  boolean loaded = false;
     
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
    
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
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
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
       
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s); 
       
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
      
    this.y += directionY * speed;
    this.x += directionX * speed;
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
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}




