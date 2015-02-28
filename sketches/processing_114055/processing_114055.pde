
SpriteObject[] images = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;
  
void setup()
{
  size(300, 300);
  background(203, 18, 18, 25);
   
  for (int index = 0; index < 10; index += 1)
  {
    images[index] = new SpriteObject("image" + index + ".jpg");
  }
}
 
void keyReleased()
{
  if (key == '0')
  {
    imageIndex = 1;
  }
  if (key == '2')
  {
    imageIndex = 2;
  }
  if (key == '5')
  {
    imageIndex += 1;
  }
  if (key == '6')
  {
    imageIndex -= 1;
  }
   
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      imageIndex += 1;
    }
  }
}
 
void mousePressed()
{
if (mouseButton == LEFT)
  {
   imageIndex += 1;
  }
  
if (mouseButton == RIGHT)
{
  imageIndex -=1;
}
}  
void draw()
{

  timer += 0.0167;
  if (timer > 3)
  {
    imageIndex += 1;
    timer = 0;
  }
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  if (imageIndex < 0)
  {
    imageIndex = 10;
  }
   
  images[imageIndex].render();
}
  
  
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  PImage img;
  float rotation = 0.0;
  float s =.7;
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
        this.w = this.img.width /2;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height /2;
      }
    }
      
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 250, 250, this.w, this.h);
      popMatrix();
    }
  }
} 



