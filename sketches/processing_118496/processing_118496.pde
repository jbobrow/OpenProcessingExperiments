
float timer;
SpriteObject bat;
SpriteObject anivia;
Predator predator;
SpriteObject cow;
SpriteObject grave;
PImage background;
  
void setup()
{
  size(800, 800);
  background = loadImage ("background.png");
  
  
  anivia = new SpriteObject ("anivia.png");
  anivia.y = 100;
  anivia.directionX = 3;
  anivia.directionY = 3;
  anivia.speed = 0.1;
  anivia.s = 0.3;
  
    
  bat = new SpriteObject("bat.png");
  bat.y = 200;
  bat.directionX = 5;
  bat.directionY = 5;
  bat.speed = 3;
  bat.s = 0.1;
   
  predator = new Predator("predator.png");
  predator.y = 100;
  predator.directionX = 3;
  predator.directionY = 3;
  predator.speed = 0.1;
  predator.s = 0.3;
  
  cow = new SpriteObject("cow.png");
  cow.y = 300;
  cow.directionX = 5;
  cow.directionY = 5;
  cow.speed = 3;
  cow.s = 0.5;
  
  grave = new SpriteObject ("grave.png");
  grave.y = 0;
  grave.s = 0.5;
  grave.speed = 0;
   
}
   
void draw()
{
  imageMode(CORNER);
 image (background, 0, 0, width, height);

 bat.update();
 bat.render();
  
 predator.update();
 predator.render();
 predator.targetX = bat.x;
 predator.targetY = bat.y;
 
 cow.render();
 cow.update();
 
 if (predator.isOverlapping (bat) == true)
 {
   bat.s = 0;
   predator.img = anivia.img;
   anivia.speed = 0.1;
 }
 
 
 if (timer > 4)
 {
  cow.img = grave.img;
 grave.speed = 0; 
 }
  
    
  timer += 0.0167;
   
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
     
  boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
       
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  void update()
  {
    // If hitting Right
     
     
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s *0.5);
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
      
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    
    }
      
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
  //apply sine wave to this.y
  float waveSpeed = 4;
  float waveHeight = 4;
  float angle =this.x * waveSpeed;
  float offset = sin(radians(angle)) * waveHeight;
  this.y += random(-4, 4);
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
  float targetX;
  float targetY;
  float easing = 0.09;
   
 Predator(String filename)
 {
   super(filename);

  }
   
  void update()
  {
    float dx = targetX - x;
  if(abs(dx) > .01) {
    x += dx * easing;
  }
   
  float dy = targetY - y;
  if(abs(dy) > .01) {
    y += dy * easing;
  }
}
}



