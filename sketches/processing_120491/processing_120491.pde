
PImage background;

class MouseRotatingdaddy extends SpriteObject
{
  MouseRotatingdaddy(String filename)
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
   
MouseRotatingdaddy daddy;
float down = 0;
float up = 0;
float right = 0;
float left = 0;
  
class Rocket extends SpriteObject
{
  Rocket(String filename)
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
  
int rc = 25;
Rocket[] r = new Rocket[rc];
int ri = 0;
  
    
void setup()
{
  size(500, 500);
  background = requestImage("background.jpg");
  daddy = new MouseRotatingdaddy("daddy.png");
  daddy.x = 25;
  daddy.y = 25;
  daddy.directionX = 1;
  daddy.directionY = 0;
  daddy.speed = 3;
     
  for (int i = 0; i < rc; i += 1)
  {
    r[i] = new Rocket("rocket.gif");
    r[i].s = .5;
    r[i].x = -1000;
    r[i].y = -1000;
     
  }
  
}
   
void draw()
{
   if (background.width>0)
  {
    image(background,250,250,500,500);
    
  }

  daddy.update();
  daddy.render();
    
  for (int i = 0; i < rc; i += 1)
  {
    r[i].update();
    r[i].render();
  }
}
  
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    r[ri].x = daddy.x;
    r[ri].y = daddy.y;
    r[ri].directionX = daddy.directionX;
    r[ri].directionY = daddy.directionY;
    r[ri].speed = 10;
    ri += 1;
    if (ri >= rc)
    {
      ri = 0;
    }
  }
}
   
void keyPressed()
{
    
    if (key == 'g')
    {
      up = 1;
    }
    
}
   
void keyReleased()
{
 
    if (key == 'g')
    {
      up = 0;
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



