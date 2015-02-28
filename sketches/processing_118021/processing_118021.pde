
SpriteObject seviper;
Predator goose;
PImage land;
 
void setup()
{
  size(400,400);
  seviper = new SpriteObject("seviper.png");
  seviper.y = 400;
  seviper.speed = 5;
  seviper.directionX = 1;
  seviper.directionY = 1;
  goose = new Predator("goose.png");
  land = loadImage ("land.png");
}
 
void draw()
{
  imageMode(CORNER);
  if (land.width > 0)
 {
   image(land,0,0,width,height);
 }
  goose.update();
  goose.render();
   
  seviper.update();
  seviper.render();
}
 
class Predator extends SpriteObject
{
  float targetX;
  float targetY;
  float easing = 0.08;
 
  Predator(String filename)
  {
    super(filename);
  }
   
   
  void update()
  {
    goose.targetX = seviper.x;
    float dx = targetX - x;
    if(abs(dx) > 1)
    {
      x += dx * easing;
    }
    goose.targetY = seviper.y;
    float dy = targetY - y;
    if(abs(dy) > 1)
    {
      y += dy * easing;
    }
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
   
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - ( this.w * 0.5 * this.s);
    float right = this.x + ( this.w * 0.5 * this.s);
    float top = this.y - ( this.h * 0.5 * this.s);
    float bottom = this.y + ( this.h * 0.5 * this.s);
     
    float otherLeft = other.x - ( other.w * 0.5 * other.s);
    float otherRight = other.x + ( other.w * 0.5 * other.s);
    float otherTop = other.y - ( other.h * 0.5 * other.s);
    float otherBottom = other.y + ( other.h * 0.5 * other.s);
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed += 40;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed -= 40;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 0.3;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 2;
    }
      
    this.y += directionY * speed;
    this.x += directionX * speed;
    
    float waveSpeed = 10;
    float waveHeight = 10;
    float angle = this.x * waveSpeed;
    float offset = sin(radians(angle)) * waveHeight;
    this.y +=  offset;
    
    this.x += random(-10,10);  
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



