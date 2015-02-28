
SpriteObject[] images = new SpriteObject[12];
SpriteObject background = new SpriteObject("ghost title card.jpg");
int index = 0;

void setup ()
{
  size(680, 435);
 
 images[0] = new SpriteObject("ghost title card.jpg");
images[1] = new SpriteObject("ghost 1.jpg");
images[2] = new SpriteObject("ghost 2.jpg");
images[3] = new SpriteObject("ghost 3.jpg");
images[4] = new SpriteObject("ghost 4.jpg");
images[5] = new SpriteObject("ghost 5.jpg");
images[6] = new SpriteObject("ghost 6.jpg");
images[7] = new SpriteObject("ghost 7.jpg");
images[8] = new SpriteObject("ghost 8.jpg");
images[9] = new SpriteObject("ghost 9.jpg");
images[10] = new SpriteObject("ghost 10.jpg");
images[11] = new SpriteObject("ghost end.jpg");

  background.w = width;
  background.h = height;
  background.x = width / 2;
  background.y = height / 2;

for (int i = 0; i < 10; i += 1)

{

images[i].x = width / 2;

}

for (int i = 0; i < 10; i += 1)

{

images[i].y = height / 2;

}

for (int i = 0; i < 10; i += 1)

{

images[i].w = width;

}

for (int i = 0; i < 10; i += 1)

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
  if (index == 16) 
  {
    if (mouseX < 250) 
    {
      index = 16;
    }
    if (mouseX >= 250)
    {
      index = 16;
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



