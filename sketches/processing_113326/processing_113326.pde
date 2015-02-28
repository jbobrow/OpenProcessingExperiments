
SpriteObject image1;
SpriteObject image2;
float[] numbers = new float[10];
SpriteObject[] images = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;
  
void setup()
{
  size(500, 500);
  images[0] = new SpriteObject("animal0.jpg");
  images[0].s = 2;
  images[0].x = 250;
  images[0].y = 250;
  images[1] = new SpriteObject("animal1.jpg");
  images[1].s = 2;
  images[1].x = 250;
  images[1].y = 250;
  images[2] = new SpriteObject("animal2.jpg");
  images[2].s = 2;
  images[2].x = 250;
  images[2].y = 250;
  images[3] = new SpriteObject("animal3.jpg");
  images[3].s = 2;
  images[3].x = 250;
  images[3].y = 250;
  images[4] = new SpriteObject("animal4.jpg");
  images[4].s = 2;
  images[4].x = 250;
  images[4].y = 250;
  images[5] = new SpriteObject("animal5.jpg");
  images[5].s = 2;
  images[5].x = 250;
  images[5].y = 250;
  images[6] = new SpriteObject("animal6.jpg");
  images[6].s = 2;
  images[6].x = 250;
  images[6].y = 250;
  images[7] = new SpriteObject("animal7.jpg");
  images[7].s = 2;
  images[7].x = 250;
  images[7].y = 250;
  images[8] = new SpriteObject("animal8.jpg");
  images[8].s = 2;
  images[8].x = 250;
  images[8].y = 250;
  images[9] = new SpriteObject("animal9.jpg");
  images[9].s = 2;
  images[9].x = 250;
  images[9].y = 250;
   
  
}
 
void keyReleased()
{
  if (key == '0')
  {
    imageIndex = 0;
  }
  if (key == '5')
  {
    imageIndex = 5;
  }
  if (key == 'd')
  {
    imageIndex += 1;
  }
  if (key == 'a')
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
  
void draw()
{
background(0);
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
  float x = 0.0;
  float y = 0.0;
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


