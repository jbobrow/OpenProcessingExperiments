
SpriteObject[] images = new SpriteObject[11];
float timer = 0;
int imageIndex = 0;
 
 
void setup()
{
  size(1070, 820);
  images[0] = new SpriteObject("scan1.jpg");
  images[1] = new SpriteObject("scan2.jpg");
  images[2] = new SpriteObject("scan3.jpg");
  images[3] = new SpriteObject("scan4.jpg");
  images[4] = new SpriteObject("scan5.jpg");
  images[5] = new SpriteObject("scan6.jpg");
  images[6] = new SpriteObject("scan7.jpg");
  images[7] = new SpriteObject("scan8.jpg");
  images[8] = new SpriteObject("scan9.jpg");
  images[9] = new SpriteObject("scan10.jpg");
  images[10] = new SpriteObject("scan11.jpg");
}
 
void draw()
{
  background(#1F1E7C);
  if (imageIndex >= 11)
  {
    imageIndex = 0;
  }
  images[imageIndex].render();
}

void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    imageIndex += 1;
  }
}

class SpriteObject
{
  float x = width / 2;
  float y = height / 2;
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




