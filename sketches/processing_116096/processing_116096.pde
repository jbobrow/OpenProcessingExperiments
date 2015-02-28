
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
SpriteObject pirate; 
SpriteObject One;
SpriteObject Two;
SpriteObject Three;
SpriteObject Four;
SpriteObject Five;
SpriteObject Six;
SpriteObject Seven;
SpriteObject Eight;
SpriteObject Fuck;
SpriteObject OriginalPirate;

 
void setup()
{
  size(500, 500);
  Fuck = new SpriteObject("acid.png");
  
  One = new SpriteObject("cannon.png");
  One.x = 300;
  One.y = 0;
  One.s = 0.2;

  Two = new SpriteObject("rubix.png");
  Two.x = 490;
  Two.y = 20;
  Two.s = 0.1;
  
  Three = new SpriteObject("Emblem.png");
  Three.x = 345;
  Three.y = 0;
  Three.s = 0.3;
  
  Four = new SpriteObject("apple.png");
  Four.x = 100;
  Four.y = 12;
  Four.s = 0.5;
  
  Five = new SpriteObject("heart.png");
  Five.x = 333;
  Five.y = 5;
  Five.s = 0.2;
  
  Six = new SpriteObject("troll.png");
  Six.x = 225;
  Six.y = 47;
  Six.s = 0.05;
  
  Seven = new SpriteObject("wink.png");
  Seven.x = 450;
  Seven.y = 4;
  Seven.s = 0.2;
  
  Eight = new SpriteObject("megaman.png");
  Eight.x = 140;
  Eight.y = 0;
  Eight.s = 0.2;
  
  
  pirate = new SpriteObject("arg.png");
  pirate.x = 0;
  pirate.y = 450;
  pirate.s = 0.25;
  
  OriginalPirate = new SpriteObject("arg.png");
}
 
void draw()
{
  {
  background(255);
  pirate.x += (right - left) * speed;
  pirate.render();
  

  One.y += 1;
  
  Two.y += .1;
  
  Three.render();
  Three.y += .5;
  
  Four.render();
  Four.y += 2;
  
  Five.render();
  Five.y += .3;
  
  Six.render();
  Six.y += .4;
  
  Seven.render();
  Seven.y += 3;
  
  Eight.render();
  Eight.y += .5;

  if (pirate.isOverlapping(One) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
  One.render();
  
  if (pirate.isOverlapping(Two) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
  Two.render();

  if (pirate.isOverlapping(Three) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }

  if (pirate.isOverlapping(Four) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }

  if (pirate.isOverlapping(Five) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }

  if (pirate.isOverlapping(Six) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }

  if (pirate.isOverlapping(Seven) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }

  if (pirate.isOverlapping(Eight) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
  
  tint(255);
  if (pirate.isOverlapping(One) || pirate.isOverlapping(Two) || pirate.isOverlapping(Three) || pirate.isOverlapping(Four) || pirate.isOverlapping(Five) || pirate.isOverlapping(Six) || pirate.isOverlapping(Seven) || pirate.isOverlapping(Eight))
  {
    pirate.img = Fuck.img;
  }
  else
  {
    pirate.img = OriginalPirate.img;
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
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
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
 
}




