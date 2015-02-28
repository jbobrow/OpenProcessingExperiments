
SpriteObject[] images = new SpriteObject[6];
SpriteObject background = new SpriteObject("mikhail2.jpg");
int index = 0;

void setup()
{
  size(500, 500);
  images[0] = new SpriteObject("number0.jpg");
  images[1] = new SpriteObject("number1.jpg");
  images[2] = new SpriteObject("number2.jpg");
  images[3] = new SpriteObject("number3.png");
  images[4] = new SpriteObject("number4.jpg");
  images[5] = new SpriteObject("number5.jpg");
  
  background.w = width;
  background.h = height;
  background.x = width / 2;
  background.y = height / 2;
       
  for (int i = 0; i < 6; i += 1)
  {
    images[i].x = width / 2;
  }
  for (int i = 0; i < 6; i += 1)
  {
     images[i].y = height / 2;
  }
  for (int i = 0; i < 6; i += 1)
  {
     images[i].w = width;
  }
  for (int i = 0; i < 6; i += 1)
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
  if (index == 3) // only do this on 4th image
  {
    if (mouseX < 250) // left side
    {
      index = 4;
    }
    if (mouseX >= 250) // right side
    {
      index = 5;
    }
  }
  else // do this the rest of the time
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



