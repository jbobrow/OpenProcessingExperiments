
SpriteObject troll;
SpriteObject skull;

void setup()
{
  size(500, 500);
  troll = new SpriteObject("troll.png");
  troll.x = 0.0;
  troll.y = width / 2;
  troll.s = 2.0;
  
  skull = new SpriteObject("skull.jpg");
  skull.x = width / 2;
  skull.y = 0;
  skull.s = 0.1;
}

void draw()
{
  background(0);
  
  /*if (troll.loaded == false)
  {
    troll.render();
  }*/
  
  fill(255);
  
  // values of skulls sides
  float left = skull.x - (skull.w * 0.5 * skull.s);
  float right = skull.x + (skull.w * 0.5 * skull.s);
  float top = skull.y - (skull.h * 0.5 * skull.s);
  float bottom = skull.y + (skull.h * 0.5 * skull.s);
  
  // set the color if the skull and rectangle intersect
  if (rectRectIntersect(left, top, right, bottom, 200, 200, 200 + 100, 200 + 50) == true)
  {
    fill(0,0,255);
  }
  else
  {
    fill(255);
  }
  // draw rect
  rect(200, 200, 100, 50);
  
  // move troll to the right
  troll.x += 0.5;
  
  // move skull down
  skull.y += 1;
 
   // change the color if overlapping
  if (troll.isOverlapping(skull))
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  if (troll.isMouseOverlapping() == false)
  {
    troll.render();
  }
  
  // do the same for skull but with different colors
  if (skull.isOverlapping(troll))
  {
    tint(0, 255, 0);
  }
  else
  {
    tint(255);
  }
  if (skull.isMouseOverlapping() == false)
  {
    skull.render();
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

boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



