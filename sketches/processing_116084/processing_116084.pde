
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;

int ellipseX = 25;

SpriteObject face;
SpriteObject face2;
SpriteObject face3;
SpriteObject face4;
SpriteObject face5;
SpriteObject face6;
SpriteObject face7;
SpriteObject face8;
SpriteObject face9;
 
void setup()
{
  size(500, 500);
  
  face = new SpriteObject("face.png");
  face.x = ellipseX;
  face.y = height/1.1;
   
  face2 = new SpriteObject("swirl.png");
  face2.y = width/2;
  face2.x = 30;
  face2.s = 0.3;
  
  face3 = new SpriteObject("swirl.png");
  face3.y = 0;
  face3.x = 400;
  face3.s = .4;
  
  face4 = new SpriteObject("swirl.png");
  face4.y = 0;
  face4.x = 300;
  face4.s = .2;
  
  face5 = new SpriteObject("swirl.png");
  face5.y = -50;
  face5.x = 2250;
  face5.s = .15;
  
  face6 = new SpriteObject("swirl.png");
  face6.y = -120;
  face6.x = 150;
  face6.s = .35;
  
  face7 = new SpriteObject("swirl.png");
  face7.y = -40;
  face7.x = 100;
  face7.s = .075;
  
  face8 = new SpriteObject("swirl.png");
  face8.y = 10;
  face8.x = 80;
  face8.s = .45;
  
  face9 = new SpriteObject("swirl.png");
  face9.y = 40;
  face9.x = 275;
  face9.s = .43;
  
}
 
void draw()
{
  
  face.x += (right - left) * speed;
    
  background(0);
  tint(255);
  face.render();
   
  if (face2.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
    
  face2.render();
  face2.y += 1;
 
  if (face3.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
   
  face3.render();
  face3.y += 0.8;
  
  if (face4.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
    
  face4.render();
  face4.y += 1.2;
  
  if (face5.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
    
  face5.render();
  face5.y += 1.8;
  
  if (face6.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
    
  face6.render();
  face6.y += 1;
  
  if (face7.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
    
  face7.render();
  face7.y += .7;
  
  if (face8.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
    
  face8.render();
  face8.y += 1.2;
  
  if (face9.isOverlapping(face) == true)
  {
    tint(random(0, 255), random(0, 255), random(0, 255));
  }
  else
  {
    tint(255);
  }
    
  face9.render();
  face9.y += 1.4;
  
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = .15;
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
 
void keyReleased()
{
  
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
  }
  
}
 
void keyPressed()
{
  
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = .75;
    }
    if (keyCode == RIGHT)
    {
      right = .75;
    }
  }
  
}


