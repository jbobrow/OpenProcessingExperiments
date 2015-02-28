
SonicObject sprite;
BulletObject[] bullet = new BulletObject[10];
int currentBullet = 0;
BulletObject bigBullet;

// store whether key pressed or released in float variables
// 1 is pressed, 0 is not pressed
float left = 0;
float right = 0;

float timer = 0;


void setup()
{
  size(500,500);
  sprite = new SonicObject("sonic.gif");
  sprite.x =width / 2;
  sprite.y = 400;
  sprite.w = width;
  sprite.h = height;
  sprite.s = 0.25;
  sprite.speed = 4;
  
  bigBullet = new BulletObject("star.png");
  bigBullet.s = 0.25;
  bigBullet.x = -1000;
  bigBullet.y = -1000;
  
  for (int i = 0; i < 10; i++)
  {
    bullet[i] = new BulletObject("troll.png");
    bullet[i].s = 0.25;
    bullet[i].x = -1000;
    bullet[i].y = -1000;
  }
}

void draw()
{
  background(0);
  timer += 0.0167;
  
  sprite.update();
  sprite.render();
  
  for (int i = 0; i < 10; i++)
  {
    bullet[i].update();
    bullet[i].render();
  }
  
  if (timer > 2)
  {
    bigBullet.x = sprite.x;
    bigBullet.y = sprite.y;
    bigBullet.speed = 10;
    bigBullet.directionY = -1;
    bigBullet.directionX = 0;
    timer = 0;
  }
    
  bigBullet.update();
  bigBullet.render();
}

void keyReleased()
{
  if (key == ' ')
  {
    bullet[currentBullet].x = sprite.x;
    bullet[currentBullet].y = sprite.y;
    bullet[currentBullet].speed = 10;
    
    // shoot side to side while moving
    if (sprite.directionX != 0)
    {
      bullet[currentBullet].directionX = sprite.directionX;
      bullet[currentBullet].directionY = 0;
    }
    else // shoot up
    {
      bullet[currentBullet].directionX = 0;
      bullet[currentBullet].directionY = -1;      
    }
    
    currentBullet += 1;
    if (currentBullet >= 10)
    {
      currentBullet = 0;
    }
  }
  
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }
}


class BulletObject extends SpriteObject
{
  BulletObject(String filename)
  {
    super(filename);
  }
  
  void update()
  {
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
}

class SonicObject extends SpriteObject
{
  SonicObject(String filename)
  {
    super(filename);
  }
  
  void update()
  {
    this.directionX = (right - left);
    this.x += directionX * speed;
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



