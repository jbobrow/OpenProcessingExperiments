
SpriteObject blue;
Predator pacman;
PImage power;
PImage mario;
PImage mario1;
float timer = 0;
float rate = 0.0167;
float G = 255;
float B = 255;
float MX = 400;
float MY = 20;

void setup()
{
  size(500, 500);
  power = requestImage("power.jpg");
  mario = requestImage("mario.png");
  mario1 = requestImage("mario1.jpg");
  blue = new SpriteObject("blue.png");
  blue.x = width/2;
  blue.y = height/2;
  blue.s = 0.5;
  blue.speed = 6;
  blue.directionX = 1;
  blue.directionY = -1;
  pacman = new Predator("pacman.png");
  pacman.s = .6;
  pacman.speed = 100;
  pacman.targetX = blue.x;
  pacman.targetY = blue.y;
}
  
void draw()
{
 
  timer+=0.0167;
  if (power.width > 0)
  {
    image(power, 250, 250);
  }
  
    
  blue.update();
  blue.render();
  pacman.targetX = blue.x;
  pacman.targetY = blue.y;
  pacman.update();
  pacman.render();
}

class Predator extends SpriteObject
{
  float targetX;
  float targetY;
    
  Predator(String filename)
  {
    super(filename);
  }
    
  void update()
  {
  
  ////////sick mario/////////  

 if (timer < 5 && G > 0 && B > 4)
  {
    
   MY += 1;
   MX -= 1;
   G -= 1;
   B -= 1;
  }
  tint (255, G, B);
  imageMode(CENTER);
  pushMatrix();
  translate(MY, MX);
  scale(1);
  image(mario, 0, 0, 100, 100);
  popMatrix(); 
  tint(255, 255, 255); 
  
  
  /////////dead mario//////////
  
  if(timer > 5)
    {
    MX += 4;
    imageMode(CENTER);
    pushMatrix();
    translate(MY, MX);
    scale(1);
    image(mario1, 0, 0, 100, 100);
    popMatrix(); 
}
    
    
    float target1 = targetX - x;
    float target2 = targetY - y;
      
    if(abs(target1) > 2)
    {
      x += target1 / speed;
    }
      
    if(abs(target2) > 2)
    {
      y += target2 / speed;
    }
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
    
    ///////Ghostbeingeaten//////
      if (pacman.isOverlapping(blue))
  {
    blue.s = .0001;
}
    
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      directionX = -directionX;
    }
       
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      directionX = -directionX;
    }
       
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      directionY = -directionY;
    }
       
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      directionY = -directionY;
    }
       
    // Move the sprite
    float wavespeed = 4;
    float waveHeight = 4;
    float angle = this.x * wavespeed;
    float offset = sin(radians(angle)) * waveHeight;
    this.y += directionY * speed;
    this.x += directionX * speed;
    this.y += offset;
    this.x += random(-4, 4);
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



