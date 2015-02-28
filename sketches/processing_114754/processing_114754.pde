
SpriteObject[] images = new SpriteObject[15];
int imageIndex = 0;
float timer = 0;
float hue = 0;

void setup()
{
  size(500, 500);
   
  images[0] = new SpriteObject("Art1.png");
  images[1] = new SpriteObject("Art2.png");
  images[2] = new SpriteObject("Art3.png");
  images[3] = new SpriteObject("Art4.png");
  images[4] = new SpriteObject("Art5.png");
  images[5] = new SpriteObject("Art6.png");
  images[6] = new SpriteObject("Art7.png");
  images[7] = new SpriteObject("Art8.png");
  images[8] = new SpriteObject("Art9.png");
  images[9] = new SpriteObject("Art10.png"); 
  images[10] = new SpriteObject("Art11.png");
  images[11] = new SpriteObject("Art12.png");
  images[12] = new SpriteObject("Art13.png");
  images[13] = new SpriteObject("Art14.png");
}

void draw()
{
  timer += 0.0167;
  if (timer > 1)
  {
    imageIndex += 1;
    timer = 0;
  }
  if (imageIndex >= 13)
  {
    imageIndex = 0;
  }
  if (imageIndex < 0)
  {
    imageIndex = 12;
  }
    
  images[imageIndex].render();
}
   
class SpriteObject
{
  float x = 250.0;
  float y = 250.0;
  float w = -1.0;
  float h = -1.0;
  PImage img;
  float rotation = 0.0;
  float s = 1.0;
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


