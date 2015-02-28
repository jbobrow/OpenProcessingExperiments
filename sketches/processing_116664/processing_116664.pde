
SpriteObject  ship;
SpriteObject[]  asteriods = new SpriteObject[10];
color shipColor;

void setup()
{
  size(1000,1000);
  ship = new SpriteObject("ship.png");
  ship.x = width/2;
  ship.y = 900;
  ship.s = .2;
 
 for ( int i = 0; i < 10; i++)
 { 
   asteriods[i] = new SpriteObject("asteroid.png");
  asteriods[i].x = random (width);
  asteriods[i].y =0;
  asteriods[i].s = random(.2, 1);
  asteriods[i].speed = random(1, 3);
 }
}

void draw()
{
  background(0);
   for (int i = 0; i < 10; i++)
   {
      if (asteriods[i].isOverlapping(ship))
    {
      tint(255, 0, 0);
      shipColor = color(255, 0, 0);
    }
    else 
    {
      tint(255);
    }
      asteriods[i].render();
      asteriods[i].y += asteriods[i].speed;
      
      if (asteriods[i].y > height)
      {
        asteriods[i].y = -50;
      }
   }
 
   tint(shipColor);
  ship.render();
  shipColor = color(255);
  
  
  
}

 
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      ship.x -= 5;
    }
    if (keyCode == RIGHT)
    {
      ship.x += 5;
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
  float speed;
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
     && mouseX < (this.y + (this.h * 0.5 * this.s)))
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
     float left = this.x - ( this.w * 0.5 * this.s);
     float right = this.x + ( this.w * 0.5 * this.s);
     float top = this.y - ( this.h * 0.5 * this.s);
     float bottom = this.y + ( this.h * 0.5 * this.s);
     
    
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



