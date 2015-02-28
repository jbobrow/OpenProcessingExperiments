

int currentImage;
float timer = 0;
float inc = 0;
boolean direction;
SpriteObject[]  myimages = new SpriteObject[10];

void setup()
{
  size(500, 500);
  for (int i = 0; i < 10; i++)
  {
    myimages[i] = new SpriteObject("Cat" + i + ".jpg");
  }
  direction = false;
}
 
void draw()
{
  background(0);
  timer += 0.05;
  timer = timer + inc;
  println(currentImage);
 
  if (timer > 3.0)
  {
    if (direction == false)
    {
      currentImage ++;
      timer = 0;
    }
    else
    {
      currentImage --;
      timer = 0;
    }
  }
  if (currentImage >= 10)
  {
    currentImage = 0;
  }
  if (currentImage < 0)
  {
    currentImage = 9;
  }
  myimages[currentImage].load();
}
 
class SpriteObject
{
  float m_x = 0.0;
  float m_y = 0.0;
  float m_w = -1.0;
  float m_h = -1.0;
  float m_rotation = 0.0;
  float s = 1.0;
  PImage m_image;
  boolean loaded = false;
 
  SpriteObject(String picture)
  {
    this.m_image = requestImage(picture);
  }
 
  void load()
  {
    if (this.m_image.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.m_w == -1.0)
      {
        this.m_w = this.m_image.width;
      }
      if (this.m_h == -1.0)
      {
        this.m_h = this.m_image.height;
      }
    }
 
    if (loaded)
    {
      image(this.m_image, 0, 0, 200, 200);
    }
  }
}
void keyPressed()
{
  if (key == 'r')
  {
    noLoop();
    myimages[int(random(10))].load();
  }
 
  if (key == 'a')
  {
    inc += 0.05;
  }
  if (key == 'd')
  {
    inc -= 0.05;
  }
  if (key == 'f')
  {
    direction = !direction;
  }
}
void keyReleased()
{
  if (key == 'r')
  {
    loop();
  }
}



