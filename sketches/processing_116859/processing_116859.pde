
Shape[] shapes = new Shape[8]; 
 
class Shape
{
  float x=0; 
  float y=0; 
  float w=0; 
}


void setup()
{
  background(0); 
  size(500, 500); 
  
  for (int i = 0; i < 8; i++)
  {
   shapes[i] = new Shape();
  }

  shapes[0].x = random(300); 
  shapes[0].y = 10; 
  shapes[0].w = 5;  
  
  shapes[1].x = random(110);
  shapes[1].y = 15; 
  shapes[1].w = 10; 
  
  shapes[2].x = random(200); 
  shapes[2].y = 10; 
  shapes[2].w = 10;
  
  shapes[3].x = random(250); 
  shapes[3].y = 9; 
  shapes[3].w = 9;
  
  shapes[4].x = random(270); 
  shapes[4].y = 25; 
  shapes[4].w = 14;
  
  shapes[5].x = random(140); 
  shapes[5].y = 16; 
  shapes[5].w = 10;
  
  shapes[6].x = random(170); 
  shapes[6].y = 8; 
  shapes[6].w = 8;
  
  shapes[7].x = random(300); 
  shapes[7].y = 13; 
  shapes[7].w = 3;
}


void draw()
{
  for (int i = 0; i < 8; i += 1)
  {
     rect(shapes[i].x, shapes[i].y, shapes[i].w, shapes[i].w);
      
  }
  
  shapes[0].y += 1; 
  shapes[1].y += 1;
  shapes[2].y += 1;
  shapes[3].y += 1;
  shapes[4].y += 1;
  shapes[5].y += 1;
  shapes[6].y += 1;
  shapes[7].y += 1;
 
 if (shapes[0].y > 500)
 {
  shapes[0].y = random(10); 
 }

triangle(370, 430, 250, 400, 300, 450); 

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
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);}


