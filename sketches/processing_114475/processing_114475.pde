
SpriteObject[] images = new SpriteObject[13];
SpriteObject background = new SpriteObject("number13.jpg");
int index = 0;
 
void setup()
{
  size(500, 500);
  images[0] = new SpriteObject("number0.jpg");
  images[1] = new SpriteObject("number1.jpg");
  images[2] = new SpriteObject("number2.jpg");
  images[3] = new SpriteObject("number3.jpg");
  images[4] = new SpriteObject("number4.jpg");
  images[5] = new SpriteObject("number5.jpg");
  images[6] = new SpriteObject("number6.jpg");
  images[7] = new SpriteObject("number7.jpg");
  images[8] = new SpriteObject("number8.jpg");
  images[9] = new SpriteObject("number9.jpg");
  images[10] = new SpriteObject("number10.jpg");
  images[11] = new SpriteObject("number11.jpg");
  images[12] = new SpriteObject("number12.jpg");
  
   
  background.w = width;
  background.h = height;
  background.x = width / 2;
  background.y = height / 2;
        
  for (int i = 0; i < 13; i += 1)
  {
    images[i].x = width / 2;
  }
  for (int i = 0; i < 13; i += 1)
  {
     images[i].y = height / 2;
  }
  for (int i = 0; i < 13; i += 1)
  {
     images[i].w = width;
  }
  for (int i = 0; i < 13; i += 1)
  {
     images[i].h = height;
  }
}
 
void draw()
{
  background.render();
  images[index].render();
}
 
void mouseReleased()
{
  println(index);
  if (index == 3) 
  {
    if (mouseX < 500) 
    {
      index = 4;
    }
    
  }
  else
  {
    index += 1;
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




