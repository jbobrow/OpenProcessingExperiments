

float y = 0;
float yy = 0;
float x = 0;
float a =0;
float b = 0;
float c = 0;
float d = 0;
float e = 0;
float f = 0;

SpriteObject boat;

void setup()
{
  
  size(450, 450);
  boat = new SpriteObject("boat.png");
  boat.x = width / 2;
  boat.y = height * 0.9;
  boat.s = 0.2;
}


void draw()
{
  background(0);
  
  float left = boat.x - (boat.w * 0.5 * boat.s);
  float right = boat.x + (boat.w * 0.5 * boat.s);
  float top = boat.y - (boat.h * 0.5 * boat.s);
  float bottom = boat.y + (boat.h * 0.5 * boat.s);
  
  if (rectRectIntersect(left, top, right, bottom, 50, y, 50 + 50, y + 50) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
  rect(50, y, 50, 50);
  
    if (rectRectIntersect(left, top, right, bottom, 150, a, 150 + 50, a + 30) == true)
  {
    fill(0, 255, 0);
  }
  else
  {
    fill(255);
  }
  rect(150, a, 50, 30);
  
  if (rectRectIntersect(left, top, right, bottom, 250, b, 250 + 30, b + 30) == true)
  {
    fill(0, 0, 255);
  }
  else
  {
    fill(255);
  }
  rect(250, b, 30, 30);
  
    if (rectRectIntersect(left, top, right, bottom, 350, c, 350 + 30, c + 50) == true)
  {
    fill(#FCE826);
  }
  else
  {
    fill(255);
  }
  rect(350, c, 30, 50);
  
    if (rectRectIntersect(left, top, right, bottom, 100, yy, 100 + 25, yy + 25) == true)
  {
    fill(#FAB426);
  }
  else
  {
    fill(255);
  }
  rect(100, yy, 25, 25);
  
    if (rectRectIntersect(left, top, right, bottom, 200, d, 200 + 25, d + 40) == true)
  {
    fill(#26FAD1);
  }
  else
  {
    fill(255);
  }
  rect(200, d, 25, 40);
  
    if (rectRectIntersect(left, top, right, bottom, 300, e, 300 + 40, e + 25) == true)
  {
    fill(#8F26FA);
  }
  else
  {
    fill(255);
  }
  rect(300, e, 40, 25);
  
    if (rectRectIntersect(left, top, right, bottom, 400, f, 400 + 40, f + 40) == true)
  {
    fill(#FA26BE);
  }
  else
  {
    fill(255);
  }
  rect(400, f, 40, 40);
  
  boat.render();
  
  yy += 3;
  y += 2;
  a += 1;
  b += 0.5;
  c += 1.5;
  d += 2.5;
  e += 0.8;
  f += 1.2;
  
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      boat.x -= 10;
    }
    if (keyCode == RIGHT)
    {
      boat.x += 20;
    }
  }
}
  
  
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
      return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
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
     if (mouseX > (this.x - (this.w * 0.5))
     && mouseX < (this.x + (this.w * 0.5))
     && mouseY > (this.y - (this.h * 0.5))
     && mouseY < (this.y + (this.h * 0.5)))
     {
       return true;
     }
     else
     {
       return false;
     }
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



