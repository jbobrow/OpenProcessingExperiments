

class MouseRotatingCar extends SpriteObject
{
  MouseRotatingCar(String filename)
  {
    super(filename);
  }
  
  void update()
  {
    this.rotation = degrees(atan2(mouseY-this.y, mouseX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
    
    this.y += (up - down) * this.directionY * this.speed;
    this.x += (up - down) * this.directionX * this.speed;
  }
}

MouseRotatingCar car;

// Bullet Class
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
 
int bulletCount = 10;
Bullet[] b = new Bullet[bulletCount];
int bulletIndex = 0;

float up;
float down;

void setup()
{
  size(500, 500);

  car = new MouseRotatingCar("car.png");
  car.x = width / 2;
  car.y = height / 2;
  car.speed = 5;
  
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("Fireball.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.25;
  }
}

void draw()
{
  background(0);
  car.update();
  car.render();
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i].update();
    b[i].render();
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[bulletIndex].x = car.x;
    b[bulletIndex].y = car.y;
    b[bulletIndex].speed = 10;
    b[bulletIndex].directionX = car.directionX;
    b[bulletIndex].directionY = car.directionY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
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
}
  
void keyReleased()
{
    // Reset our key states to 0 when released.
    if (key == 'w')
    {
      up = 0;
    }
    if (key == 's')
    {
      down = 0;
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
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



