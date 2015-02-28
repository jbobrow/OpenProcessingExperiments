
Predator jon;
SpriteObject troll;

  float x;
float y;
 
void setup()
{
  size(500, 500);
   
  jon = new Predator("leon.jpg");
  jon.y=200;
  jon.speed = 2;
  jon.directionY =1;
  jon.directionX = 1;

  troll = new SpriteObject("leon.jpg");
  troll.y = 200;
  troll.speed = 2;
  troll.directionY = 1;
  troll.directionX = 1;

   
 
}
 
float timer = 0;
void draw()
{
  background(0);
  timer += 0.0167;
   
  troll.update();
  troll.render();
  jon.update();
  jon.render();
  jon.targetX = troll.x;
  jon.targetY = troll.y;
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
      this.directionX = random(-this.directionX * 2);
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = random(-this.directionX *.5);
      
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = random(-this.directionY);
      this.s -=.1;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = random(-this.directionY);
      this.s +=.1;
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
class Predator extends SpriteObject
{
  Predator(String filename)
  {
    super(filename);
  }
    float targetX = 0;
      float targetY = 0;
            float easing = 0.5;
  void update()
  {



  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  

  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  }
}

