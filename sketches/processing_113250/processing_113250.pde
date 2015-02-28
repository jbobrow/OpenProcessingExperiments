
SpriteObject skull;
SpriteObject stoneSkull;

void setup()
{
  size(500, 500);
  skull = new SpriteObject("skull.jpg");
  skull.x = width/2;
  skull.y = width/2;
  skull.s = 0.1;
  
  stoneSkull = new SpriteObject("stoneskull.jpg");
  stoneSkull.x = width/2;
  stoneSkull.y = width/2;
  stoneSkull.s = 0.5;
  stoneSkull.rotation = 45;
}

void draw()
{
  stoneSkull.render();
  skull.render();
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
}


