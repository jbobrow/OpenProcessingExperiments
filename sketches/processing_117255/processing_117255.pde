

float chaseX;
float chaseY;
float easing = 0.035;
 
class Car
{
  float x;
  float y;
  float directionX = 0;
  float directionY = 1;
  float w = 50;
  float h = 100;
  float speed;
  color carColor;
   
  Car()
  {
    this.speed = 1;
    this.carColor = color(0, 255, 0);
  }
   
  void stop()
  {
    this.speed = 0;
  }
   
  void go(float s)
  {
    this.speed = s;
  }
   
  void drive()
  {
    // Right side of the screen
    if (this.x > width - this.w && this.directionX > 0)
    {
      this.x = width - this.w;
      this.directionX = -this.directionX;
    }
    
    // Left side of the screen
    if (this.x < 0 && this.directionX <= 0)
    {
      this.x = 0;
      this.directionX = -this.directionX;
    }
    
    // Bottom of the screen
    if (this.y > height - this.h && this.directionY > 0)
    {
      this.y = height - this.h;
      this.directionY = -this.directionY;
    }
    
    // Top of the screen
    if (this.y < 0 && this.directionY <= 0)
    {
      this.y = 0;
      this.directionY = -this.directionY;
    }
     
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
   
  void render()
  {
    fill(this.carColor);
    rect(this.x, this.y, this.w, this.h);
  }
}

SpriteObject face;
 
void setup()
{
  size(500, 500);

  face = new SpriteObject("face.png");
  face.y = 200;
  face.s = .25;
  face.speed = 1;
  face.directionY = random(5);
  face.directionX = random(5);
  
}
 
float timer = 0;
void draw()
{
  background(0);
  timer += 0.0167;
   
  face.update();
  face.render();
  
}


class Predator extends SpriteObject
{
  Predator(String filename) { super(filename);}
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
      
      face.speed += .5;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      
      face.speed -= .5;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      
      face.s -= .15;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      
      face.s += .15;
    }
     
    this.y += directionY * speed;
    this.x += directionX * speed;
    
    
    float targetX = face.x;
    float dx = targetX - chaseX;
  
    if(abs(dx) > 1)
    {
      chaseX += dx * easing;
    }
  
    float targetY = face.y;
    float dy = targetY - chaseY;
  
    if(abs(dy) > 1)
    {
      chaseY += dy * easing;
    }
    
    fill(255, 255, 255);
    ellipse(chaseX, chaseY, 40, 40);
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



