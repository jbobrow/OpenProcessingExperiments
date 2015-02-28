

float timer;
float targetX;
float targetY;
float predX;
float predY;
float easing = 0.03;

Predator merica;
SpriteObject canada;
SpriteObject world;
SpriteObject dworld;
PImage map;

void setup()
{
  size(500, 500);
  
  map = requestImage("worldmap.png");
  
  canada = new SpriteObject("Canada.png");
  canada.y = 200;
  canada.directionX = 2.2;
  canada.directionY = 1.8;
  canada.speed = 3;
  canada.s = 0.5;
  
  world = new SpriteObject("world.png");
  world.y = 200;
  world.directionX = 1;
  world.directionY = 1;
  world.speed = 5;
  world.s = 0.5;
  
  merica = new Predator("merica.jpg");
  merica.x = 200;
  merica.y = 200;
  merica.speed = 0.01;
  merica.s = 0.2;
  
  dworld = new SpriteObject("dworld.png");
  dworld.y = 200;
  dworld.directionX = 0.5;
  dworld.directionY = 0.5;
  dworld.speed = 0.02;
  dworld.s = 0.1;
  
}


void draw()
{
  imageMode(CORNER);
  if (map.width>0)
  {
    image(map,0,0,500,500);
  }

  timer += 0.0167;
  
  if (merica.isOverlapping(world))
  {
    world.img = dworld.img;
    world.speed = 3.5;
    world.s = 0.3;
    merica.s = 0.3;
    tint(255, 0, 0);
    image(map, 0, 0, 500, 500);
  }
  
  noTint();
  
  world.update();
  world.render();
  
  merica.update();
  merica.render();
  
  if (timer > 5)
  {
    canada.speed -= 0.01;
    canada.s -= 0.001;
    
  }
  

  
  canada.update();
  canada.render();
  
  
}


class Predator extends SpriteObject
{
  Predator(String filename)
  {
    super(filename);
  }
   
  void update()
  {
     
    float targetX = world.x;
    float dx = targetX - predX;
    if (abs(dx) > 1)
    {
      predX += dx * easing;
    }
   
    float targetY = world.y;
    float dy = targetY - predY;
    if (abs(dy) > 1)
    {
      predY += dy * easing;
    }
     
    this.x = predX;
    this.y = predY;
   
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
    float left = this.x - (this.w * 0.5 * this.s /5);
    float right = this.x + (this.w * 0.5 * this.s /5);
    float top = this.y - (this.h * 0.5 * this.s /5);
    float bottom = this.y + (this.h * 0.5 * this.s /5);
       
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
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
     
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
    
    float waveSpeed = 4;
    float waveHeight = 4;
    float angle = this.x * waveSpeed;
    float offset = sin(radians(angle)) * waveHeight;
    
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



