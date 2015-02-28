
SpriteObject troll;


Shape[] shapes = new Shape[8];

class Shape
{
  float x;
  float y;
  float w;
  float speed;
}

void setup()
{
  
  size(500, 500);
  troll = new SpriteObject("troll.png");
  troll.x = 0.0;
  troll.y = width / 2;
  troll.s = 2.0;
  
  for (int i =0; i < 8; i++)
  {
    shapes[i] = new Shape();
    shapes[i].x = random(width);
    shapes[i].y = 0;
    shapes[i].w = 100; 
    shapes[i].speed = random(0.5, 2);
  }
}

void draw()
{
  background(0);
  
  for (int i =0; i < 8; i++)
  {
     shapes[i].y += shapes[i].speed;
     
     if (troll.isOverlappingRect(shapes[i].x, shapes[i].y, shapes[i].w, shapes[i].w) == true)
     {
       fill(0, 255, 0);
     }
     else
     {
       fill(255);
     }
     
    // draw an ellipse for the fifth one
    if (i == 4)
    {
      // change to corner mode because the isOverlappingRect uses corner positions.
      ellipseMode(CORNER);
      ellipse(shapes[i].x, shapes[i].y, shapes[i].w, shapes[i].w);
    }
    else
    {
      rect(shapes[i].x, shapes[i].y, shapes[i].w, shapes[i].w);
    }
  }
  
  // move troll to the right
  troll.x += 0.5;
  
  troll.render();

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
  
  boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
    
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
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



