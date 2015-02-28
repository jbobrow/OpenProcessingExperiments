
SpriteObject[] images = new SpriteObject[10];
int imageIndex = 0;
float timer = 0;
 
void setup()
{
  size(500, 500);
  background(0);
   
  images[0] = new SpriteObject("animal1.jpg");
  images[1] = new SpriteObject("animal2.jpg");
  images[2] = new SpriteObject("animal3.jpg");
  images[3] = new SpriteObject("animal4.jpg");
  images[4] = new SpriteObject("animal5.jpg");
  images[5] = new SpriteObject("animal6.jpg");
  images[6] = new SpriteObject("animal7.jpg");
  images[7] = new SpriteObject("animal8.jpg");
  images[8] = new SpriteObject("animal9.png");
  images[9] = new SpriteObject("animal10.jpg"); 
}

void keyReleased()
{
    if (key == 'a')
    {
      imageIndex += 1;
    }
    if (key == 'd')
    {
      imageIndex -= 1;
    }
    if (key == 's')
    {
      timer += 0.0267;
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
    imageIndex = 9;
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


