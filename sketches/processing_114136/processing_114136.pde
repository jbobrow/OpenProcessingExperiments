
float x = 0;
int index;
int rate;
float timer = 0;
boolean reversed;
 
SpriteObject[] images = new SpriteObject[10];
 
void setup()
{
  size(500, 500);
  background(0);
  for(int i = 0; i < 10; i++)
  {
    images[i] = new SpriteObject("legends" + i + ".jpg");
    images[i].x = width/2;
    images[i].y = height/2;
  }
  index = 0;
  rate = 1;
  frameRate(10); 
}
 
void draw()
{
  frameRate(rate); 
  images[index].render();
  index ++;
   
  if (index > 9)
  {
    index = 0;
  }
  print("Index: " + index + " ");
  println("Rate: " + rate);
 
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == 'w')
    {
      rate += 1;
    }
    if (keyCode == 's')
    {
      rate -= 1;
    }
    if (keyCode == 'r')
    {
      index = (int)random(0, 9);
    }
  }
}
 
void mousePressed()
{
     if (mouseButton == LEFT)
    {
      if (index >= 1)
      {
      index = index - 1;
      }
    }
    if (mouseButton == RIGHT)
    {
      if (index <= 8)
      {
      index = index + 1;
      }
    }
    else if (index > 9)
    {
      index = 0;
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



