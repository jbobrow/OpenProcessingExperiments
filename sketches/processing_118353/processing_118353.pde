
SpriteObject teen;
SpriteObject jason;
SpriteObject dead;
SpriteObject mom;
SpriteObject gone;
float time = 0;
float directionX = 0;
float driectionY = 0;
float speed = 0;
color invisible;
  
void setup()
{
  size(500, 500);
  teen = new SpriteObject("teen.jpg");
  teen.y = 200;
  teen.speed = 2;
  teen.s = .1;
  teen.directionY = 1;
  teen.directionX = 1.5;
  jason = new SpriteObject("jason.jpg");
  dead = new SpriteObject("dead.jpg");
  jason.s = .2;
  mom = new SpriteObject("mom.jpg");
  mom.speed = 1.2;
  mom.directionX  = .5;
  mom.directionX = .5;
  gone = new SpriteObject("gone.jpg");
  gone.speed = 1.2;
  gone.directionX  = .5;
  gone.directionX = .5;
  
}
void draw()
{
  background(0);
  time += 0.0167;
  jason.seek();
  jason.render();
   
  teen.update();
  teen.render();
  
  
  mom.render();
  mom.update();
  if (time > 5)
  {
    fill(0);
    rect(0,0,500,200);
    
  }
 
   
  if (jason.isOverlapping(teen) == true)
  {
    tint(255, 0, 0);
    dead.render();
    dead.x = teen.x;
    dead.y = teen.y;
    dead.s = .3;
  }
  else
  {
    tint(255);
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
  float easing = 0.05;
      
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
      //this.speed += 5;
      //this.rotation += 33;
      //this.s += .1;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      //this.speed -= 4.5;
      //this.s -= .2;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * random(0.5));
      this.directionY = -this.directionY;
      //this.s -= .1;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * random(0.35));
      this.directionY = -this.directionY;
    }
      
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
  void seek()
{
  float targetX = teen.x;
  float dx = targetX - x;
  if(abs(dx) > 1)
  {
    x += dx * easing;
  }
   
  float targetY = teen.y;
  float dy = targetY - y;
  if(abs(dy) > 1)
  {
    y += dy * easing;
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


