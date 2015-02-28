
/////////////var audio = new Audio("techno.wav")

 

class MouseRotatingRocket extends SpriteObject
{
  MouseRotatingRocket(String filename)
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
  } 
}
  

MouseRotatingRocket rocket;
  

float down = 0;
float up = 0;

class Lazers extends SpriteObject
{
  Lazers(String filename)
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
 
int lazersCount = 10;
Lazers[] b = new Lazers[lazersCount];
int lazersIndex = 0;
 
   
void setup()
{
 

  
  size(900, 900, P2D);
    
   
    ////////audio.play("techno.wav");
    //////audio.loop();
    
    
  rocket = new MouseRotatingRocket("rocket.png");
    
  rocket.x = 450;
  rocket.y = 450;
    
  rocket.directionX = 0;
  rocket.directionY = 1;
    
  rocket.speed = 4;
  
    
  for (int i = 0; i < lazersCount; i += 1)
  {
    b[i] = new Lazers("lazers.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.2;
  }

}
  
void draw()
{
  
  background(0);
 
  rocket.update();
  rocket.render();
   
  for (int i = 0; i < lazersCount; i += 1)
  {
    b[i].update();
    b[i].render();
  }
  
  
  stroke(random(50, 255), random(50, 255), random(50, 255));
  scale(random(2, 8));
  line(40, 0, 40, 900);
  line(100, 0, 100, 900);
  line(150, 0, 150, 900);
  line(225, 0, 225, 900);
  line(280, 0, 280, 900); 
  line(350, 0, 350, 900);
  line(450, 0, 450, 900);
  line(550, 0, 550, 900);
  line(640, 0, 640, 900);
  line(750, 0, 750, 900);
  line(840, 0, 840, 900);
  line(900, 0, 900, 900);
  
  
}
 
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[lazersIndex].x = rocket.x;
    b[lazersIndex].y = rocket.y;
    b[lazersIndex].speed = 15;
    b[lazersIndex].directionX = rocket.directionX;
    b[lazersIndex].directionY = rocket.directionY;
    lazersIndex += 1;
    if (lazersIndex >= lazersCount)
    {
      lazersIndex = 0;
    }
  }
}
  
void keyPressed()
{
    if (key == 'u')
    {
      up = 2;
    }
    if (key == 'j')
    {
      down = 2;
    }
}
  
void keyReleased()
{
    if (key == 'u')
    {
      up = 0;
    }
    if (key == 'j')
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



