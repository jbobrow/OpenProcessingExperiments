
class MouseRotatingufo extends SpriteObject
{
  MouseRotatingufo(String filename)
  {
    super(filename);
  }
   
  void lookAt(float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
  }
   
  void update()
  {
    this.lookAt(mouseX, mouseY);
    this.x += (up - down) * this.directionX * this.speed;
    this.y += (up - down) * this.directionY * this.speed;
    this.x += (left - right) * this.directionX * this.speed;
    this.y += (left - right) * this.directionY * this.speed;
  } 
}
  
MouseRotatingufo ufo;
float down = 0;
float up = 0;
float right = 0;
float left = 0;
 
class Bullet extends SpriteObject
{
  Bullet(String filename)
  {
    super(filename);
  }
    
  void update()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}
 
int bc = 25;
Bullet[] b = new Bullet[bc];
int bi = 0;
 
   
void setup()
{
  size(500, 500);
  
  ufo = new MouseRotatingufo("UFO.jpg");
  ufo.x = 250;
  ufo.y = 250;
  ufo.directionX = 1;
  ufo.directionY = 0;
  ufo.speed = 5;
    
  for (int i = 0; i < bc; i += 1)
  {
    b[i] = new Bullet("fireball.gif");
    b[i].s = 0.1;
    b[i].x = -1000;
    b[i].y = -1000;
    
  }
 
}
  
void draw()
{
  background(0);
  ufo.update();
  ufo.render();
   
  for (int i = 0; i < bc; i += 1)
  {
    b[i].update();
    b[i].render();
  }
}
 
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[bi].x = ufo.x;
    b[bi].y = ufo.y;
    b[bi].directionX = ufo.directionX;
    b[bi].directionY = ufo.directionY;
    b[bi].speed = 10;
    bi += 1;
    if (bi >= bc)
    {
      bi = 0;
    }
  }
}
  
void keyPressed()
{
   
    if (key == 'w')
    {
      up = 1;
    }
    if (key == 's')
    {
      down = 1;
    }
    if (key == 'a')
    {
      left = 1;
    }
    if (key == 'd')
    {
      right= 1;
    }
}
  
void keyReleased()
{

    if (key == 'w')
    {
      up = 0;
    }
    if (key == 's')
    {
      down = 0;
    }
    if (key == 'a')
    {
      left = 0;
    }
    if (key == 'd')
    {
      right = 0;
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
  boolean dead = false;
       
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
      rotate(radians(0));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



