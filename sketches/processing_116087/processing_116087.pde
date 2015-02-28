
SpriteObject rock1;
SpriteObject rock2;
SpriteObject rock3;
SpriteObject rock4;
SpriteObject rock5;
SpriteObject rock6;
SpriteObject rock7;
SpriteObject rock8;
SpriteObject ship;
float moveX = 250;
float moveY = 350;
 
void setup()
{
  size(500, 500);
  
  ship = new SpriteObject("ship.png");
  ship.x = moveX;
  ship.y = moveY;
  ship.s = .1;
  
  rock1 = new SpriteObject("rock.png");
  rock1.x = 10;
  rock1.y = 40;
  rock1.s = 0.2;
   
  rock2 = new SpriteObject("rock.png");
  rock2.x = 400;
  rock2.y = 0;
  rock2.s = 0.1;
   
  rock3 = new SpriteObject("rock.png");
  rock3.x = 300;
  rock3.y = 20;
  rock3.s = 0.3;
  
  rock4 = new SpriteObject("rock.png");
  rock4.x = 110;
  rock4.y = 90;
  rock4.s = 0.25;
  
  rock5 = new SpriteObject("rock.png");
  rock5.x = 170;
  rock5.y = 100;
  rock5.s = 0.16;
  
  rock6 = new SpriteObject("rock.png");
  rock6.x = 245;
  rock6.y = 80;
  rock6.s = 0.13;
  
  rock7 = new SpriteObject("rock.png");
  rock7.x = 320;
  rock7.y = 70;
  rock7.s = 0.22;
  
  rock8 = new SpriteObject("rock.png");
  rock8.x = 475;
  rock8.y = 60;
  rock8.s = 0.25;
  

}
  
void draw()
{
  background(0);
  
  if (ship.isOverlapping(rock1) == true)
  {
    tint(255);
    ship.x = moveX;
    ship.y = moveY;
  }
  else
  {
    tint(255);
    ship.x = moveX;
    ship.y = moveY;
  }
  
  ship.render();
  
  if (rock1.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
  
  rock1.render();
  rock1.y += 1;
   
  if (rock2.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
    
  rock2.render();
  rock2.y += 4;
 
  if (rock3.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
   
  rock3.render();
  rock3.y += 1.5;
  
    if (rock4.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
   
  rock4.render();
  rock4.y += 0.80;
  
    if (rock5.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
   
  rock5.render();
  rock5.y += 2.0;
  
    if (rock6.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
   
  rock6.render();
  rock6.y += 1.75;
  
    if (rock7.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
   
  rock7.render();
  rock7.y += 1.5;
  
  if (rock8.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
   
  rock8.render();
  rock8.y += 1.0;
 
}

void keyReleased()
{
  if (keyCode == LEFT)
  {
    moveX -= 10;
  }
  if (keyCode == RIGHT)
  {
    moveX += 10;
  }
  if (keyCode == UP)
  {
    moveY -= 10;
  }
  if (keyCode == DOWN)
  {
    moveY += 10;
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
 
  boolean isOverlappingMouse()
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
 
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
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



