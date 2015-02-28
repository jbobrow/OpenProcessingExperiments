

PImage b, wasp;
Animal mouse, hawk;
int mouseTX, mouseTY, timer;
boolean mouseDead, hawkDead, hawkLeft, hawkRight;
float hawkAccel;
int directionX, directionY, catX, catY;
float speed, sVal;
  
void setup()
{
  size(600, 600);
  b = loadImage("horizon.jpg");
  wasp = loadImage("wasp.png");
  mouse = new Animal("mouse.png", 300, 300);
  mouse.s = 0.1;
  hawk = new Animal("falcon.png", 440, 100);
  hawk.s = 0.1;
  mouseDead = false;
  hawkDead = false;
  hawkLeft = false;
  hawkRight = true;
  hawkAccel = 200;
  mouseTX = 300;
  mouseTY = 280;
  catX = 300;
  catY = 500;
  directionX = 1;
  directionY = 0;
  speed = 4.0;
  sVal = 0.2;
}

void draw()
{
  image(b, width/2, height/2, 600, 600);
  if(!mouseDead)
  {
    if(abs(mouse.x - catX) < 150 && abs(mouse.y - catY) < 150)
    {
      mouse.flee(catX, catY);
    }
    
    else if(abs(mouse.x - hawk.x) < 150 && abs(mouse.y - hawk.y) < 150)
    {
      mouse.flee(hawk.x, hawk.y);
    }
    
    else
    {
      mouse.pursue(mouseTX, mouseTY);
    }
    
    mouse.render();
  }
  
  if(!hawkDead)
  {
    if(abs(catX - hawk.x) < 150 && abs(catY - hawk.y) < 150)
    {
      hawk.flee(catX, catY);
    }
    
    else if(abs(mouse.x - hawk.x) < 150 && abs(mouse.y - hawk.y) < 150 && !mouseDead)
    {
      hawk.pursue(mouse.x, mouse.y);
    }
    
    else if(hawk.y >= 270)
    {
      hawk.y -= 5;
      hawkAccel = 0;
    }
    
    else
    {
      if(hawkLeft)
      {
        hawk.x -= 5;
        if(hawk.x <= 0)
        {
          hawkLeft = false;
          hawkRight = true;
        }
      }
      
      if(hawkRight)
      {
        hawk.x += 5;
        if(hawk.x >= width)
        {
          hawkRight = false;
          hawkLeft = true;
        }
      }
      
      hawk.y += hawkAccel/60;
      hawkAccel -= 5;
      
      if(hawk.y <= 0)
      {
        hawkAccel = 350;
      }
      
      if(mouseDead && hawk.y < 150)
      {
        mouse.x = width/2;
        mouse.y = 550;
        mouseDead = !mouseDead;
        mouseTX = (int)random(50, 550);
        mouseTY = (int)random(280, 550);
      }
      
    }
    
    hawk.render();
  }
  
  if(sVal >= 0.05)
  {
    pushMatrix();
    imageMode(CENTER);
    translate(catX, catY);
    scale(sVal);
    image(wasp, 0, 0);
    popMatrix();
    
    catX += directionX * speed;
    catY += directionY * speed;
    sVal -= 0.0002;
  }
  
  else
  {
    directionX = 0;
    directionY = 0;
    catX = -200;
    catY = -200;
    timer++;
  }
  
  if(timer > 400)
  {
    catX = 300;
    catY = 500;
    directionX = 1;
    directionY = 0;
    speed = 4.0;
    sVal = 0.2;
    timer = 0;
  }
  
  
  if(catX >= 550 && directionX > 0)
  {
    catX = 550;
    directionX = 0;
    directionY = -1;
  }
  
  if(catY <= 320 && directionY < 0)
  {
    catY = 320;
    directionY = 0;
    directionX = -1;
  }
  
  if(catX <= 50 && directionX < 0)
  {
    catX = 50;
    directionX = 0;
    directionY = 1;
  }
  
  if(catY >= 550 && directionY > 0)
  {
    catY = 550;
    directionY = 0;
    directionX = 1;
  }
  
  if(abs(hawk.x - mouse.x) < 5 && abs(hawk.y - mouse.y) < 5)
  {
    mouseDead = true;
  }
  
  if(abs(mouse.x - mouseTX) < 6 && abs(mouse.y - mouseTY) < 6)
  {
    mouseTX = (int)random(50, 550);
    mouseTY = (int)random(280, 550);
  }
}
class Animal extends SpriteObject
{
  Animal(String fileName)
  {
    super(fileName);
    super.x = 0;
    super.y = 0;
  }
  
  Animal(String fileName, float xVal, float yVal)
  {
    super(fileName);
    super.x = xVal;
    super.y = yVal;
  }
  
  void render()
  {
    if(this.x < 0)
    {
      this.x = 0;
    }
    
    if(this.y < 0)
    {
      this.y = 0;
    }
    
    if(this.x >= width)
    {
      this.x = width;
    }
    
    if(this.y >= height)
    {
      this.y = height;
    }
    
    super.render();
  }
  
  void flee(float targetX, float targetY)
  {
    if(this.y < targetY)
    {
      this.y -= 3;
    }
    
    if(this.y > targetY)
    {
      this.y += 3;
    }
    
    if(this.x < targetX)
    {
      this.x -= 3;
    }
    
    if(this.x > targetX)
    {
      this.x += 3;
    }
  }
  
  void pursue(float targetX, float targetY)
  {
    if(this.y < targetY)
    {
      this.y += 6;
    }
    
    if(this.y > targetY)
    {
      this.y -= 6;
    }
    
    if(this.x < targetX)
    {
      this.x += 6;
    }
    
    if(this.x > targetX)
    {
      this.x -= 6;
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




