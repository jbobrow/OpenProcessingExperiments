
SpriteObject[] myimages = new SpriteObject[10];
 
float timer = 0;
int imageindex = 0;
PImage SB0;
PImage SB1;
PImage SB2;
PImage SB3;
PImage SB4;
PImage SB5;
PImage SB6;
PImage SB7;
PImage SB8;
PImage SB9;
 
 
void setup()
{
  size (1500,700);
   for (int i = 0; i < 10; i++)
  {
    myimages[i] = new SpriteObject("SB" + i + ".jpg");
  }
 
}
 
 
void draw()
{
  timer += 0.0167;
    
  if (timer > 3)
  {
     
    imageindex += 1;
    timer = 0;
  }
  if (imageindex >= 10)
  {
    imageindex = 0;
  }
  if ( timer >= 10)
  {
    timer = 0;
  }
    
  myimages[imageindex].render();
}
 

 
  
class SpriteObject
{
   
  float x = width/2;
  float y = height/2;
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
}



