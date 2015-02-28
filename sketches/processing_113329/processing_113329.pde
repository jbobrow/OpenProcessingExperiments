
SpriteObject image1;
SpriteObject image2;
float[] numbers = new float[10];
SpriteObject[] images = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;
int mode = 0;

void setup()
{
  size(200, 200);
  
  images[0] = new SpriteObject("animal0.jpg");
  images[1] = new SpriteObject("animal1.jpg");
  images[2] = new SpriteObject("animal2.jpg");
  images[3] = new SpriteObject("animal3.jpg");
  images[4] = new SpriteObject("animal4.jpg");
  images[5] = new SpriteObject("animal5.jpg");
  images[6] = new SpriteObject("animal6.jpg");
  images[7] = new SpriteObject("animal7.jpg");
  images[8] = new SpriteObject("animal8.jpg");
  images[9] = new SpriteObject("animal9.jpg");
  
}

void keyReleased()
{
  
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      imageIndex += 1;
    }
    if (keyCode == LEFT)
    {
      imageIndex -= 1;
    }
  }
  
  if (key == ' ')
  {
    if (mode == 0)
    {
      mode = 1;
    }
    else
    {
      mode = 0;
    }
  }
  
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  
  if (imageIndex < 0)
  {
    imageIndex = 9;
  }
  
}

void draw()
{
  
  if (mode == 0)
  {
    
  println(mode);
  timer += 0.0167;
  
  if (timer > 2)
  {
    timer = 0;
    imageIndex += 1;
  }
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  }
  
  images[imageIndex].render();
  
}


class SpriteObject
{
  float x = width / 2;
  float y = height / 2;
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



