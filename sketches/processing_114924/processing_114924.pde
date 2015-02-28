
SpriteObject ds1;
SpriteObject ds2;
SpriteObject ds3;
SpriteObject ds4;
SpriteObject ds5;
SpriteObject ds6;
SpriteObject ds7;
SpriteObject ds8;
SpriteObject ds9;
SpriteObject ds0;
SpriteObject[] myimages = new SpriteObject[10];
int maxImages = 10;
int imageIndex = 0;
 
SpriteObject [] images = new SpriteObject[maxImages];
 
  
void setup()
{
  size(660, 400);
   
   
  for (int i = 0; i < images.length; i ++ )
  {
    images[i] = new SpriteObject( "ds" + i + ".jpg");
    images[i].x = width/2;
    images[i].y = height / 2;
  }
   
}
   
   
 
  
void draw()
{
 
  if (imageIndex >= 10)
  {
   
    imageIndex = 0;
   
  }
   
  images[imageIndex].render();
 
 
}
 
void keyReleased()
{
    imageIndex += 1;
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



