
float timer = 0;
SpriteObject ball;
Predator titan;
SpriteObject eren;
PImage background;
void setup()
{
  size(700, 500);
   
  background = requestImage("trees.png");
 
  ball = new SpriteObject("mikasa chibi.png");
  ball.x = 350;
  ball.y = 90;
  ball.directionX = 1;
  ball.directionY = 0;
  ball.speed = 5;
  ball.s = .3;
  
  eren = new SpriteObject("eren.png");
  eren.x = 100;
  eren.y = 5;
  eren.directionX = 1;
  eren.directionY = .5;
  eren.speed = 5;
  eren.s = .32;
 
  titan = new Predator("titan.png");
  titan.y = 325;
  titan.directionX = 5;
  titan.directionY = 0;
  titan.speed = 1;
  titan.s = .6;
 
}
 
void draw()
{
  timer += .01;
  if (timer >= 3)
  {
    ball.directionY += -1;
    titan.directionX = 0;
  }
  image(background,width/2,height/2,width,height);
 
  ball.update();
  ball.render();
 
  titan.update();
  titan.render();
  
  eren.update();
  eren.render();
  
  if (titan.isOverlapping(eren))
     {
       eren.x = 5000;
     }

 
}
 
class Predator extends SpriteObject
{
  float easing = 0.05;
 
  void update()
  {
    float targetY = 325;
    float dy = targetY - y;
    if (abs(dy) > 1) {
      y += dy * easing;
    }
 
    float targetX = ball.x;
    float dx = targetX - x;
 
    if (abs(dx) > 1)
    {
      x += dx * easing;
    }
  }
 
 
  Predator (String filename)
  {
    super(filename);
  }
}
 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float directionX;
  float directionY;
  float speed;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
 
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
 
 
  void update()
  {
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
 
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
 
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
 
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
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


