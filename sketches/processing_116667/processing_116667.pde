
SpriteObject character;
SpriteObject goomba;
SpriteObject metroid;
SpriteObject pikachu;
SpriteObject star;
SpriteObject finals;
SpriteObject turtle;
SpriteObject ninja;
SpriteObject ridley;

void setup()
{
  size(600,600);
  character = new SpriteObject("Samus.png");
  character.x = width/2;
  character.y = 555;
  
  goomba = new SpriteObject("goomba.png");
  goomba.x = 200;
  goomba.y = 0;

  pikachu = new SpriteObject("pikachu.png");
  pikachu.x = 50;
  pikachu.y = 600;

   
  star = new SpriteObject("star.png");
  star.x = 550;
  star.y = 0;
   
  turtle = new SpriteObject("turtle.png");
  turtle.x = 100;
  turtle.y = 0;
   
  ninja = new SpriteObject("ninja.png");
  ninja.x = 300;
  ninja.y = 0;
   
  metroid = new SpriteObject("metroid.png");
  metroid.x = width/2;
  metroid.y = 0;
   
  finals = new SpriteObject("final.png");
  finals.x = 450;
  finals.y = 0;
   
  ridley = new SpriteObject("ridley.png");
  ridley.x = 150;
  ridley.y = 0;
    
}

void draw()
{
  background (#000127);
  character.render();
  
  if (character.isOverlapping(metroid))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
    metroid.y += 8;
  metroid.render();
  
  if (character.isOverlapping(ridley))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  ridley.y +=15;
  ridley.render();
  
  if (character.isOverlapping(pikachu))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  pikachu. y --;
  pikachu.render();
  
  if (character.isOverlapping(finals))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  finals.y += 7;
  finals.render();
  
  if (character.isOverlapping(turtle))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  turtle.y += 4;
  turtle.render();
  
  if (character.isOverlapping(goomba))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  goomba.y += 6;
  goomba.render();
  
  if (character.isOverlapping(ninja))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  ninja.y ++;
  ninja.render();
  
  if (character.isOverlapping(star))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  star.y += 2;
  star.render();

  
}

void keyPressed()
{
  if (key == CODED )
  {
    if (keyCode == RIGHT)
    {
      character.x += 20;
    }
    
    if (keyCode == LEFT)
    {
      character.x -= 20;
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
boolean rectRectIntersect(float left, float top, float right, float bottom,
float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}




