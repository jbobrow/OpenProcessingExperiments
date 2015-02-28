
SpriteObject[] images = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;


void setup()
{
  size(1000, 1000);
  images[0] = new SpriteObject("Franklin.png");
  images[1] = new SpriteObject("Hunter.png");
  images[2] = new SpriteObject("Michael.png");
  images[3] = new SpriteObject("Trevor.png");
  images[4] = new SpriteObject("Blaine.jpg");
  images[5] = new SpriteObject("Slendy.png");
  images[6] = new SpriteObject("Nixon.png");
  images[7] = new SpriteObject("Marathon.png");
  images[8] = new SpriteObject("Halo2.png");
  images[9] = new SpriteObject("LosSantos.png");
}

void draw()
{
  background(#61CBB7);
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  images[imageIndex].render();
}


void keyReleased()
{
  if (key == 'f')
  {
    imageIndex = 0 ;
  }
if (keyCode == RIGHT)
{
  imageIndex += 1;
}
} 

void keyPressed()
{
if (keyCode == UP)
{
 images[imageIndex].rotation += 4;
}
if (keyCode == DOWN)
{
 images[imageIndex].y += 4;
}
if (keyCode == LEFT)
{
images[imageIndex].y = 500;
}
}


class SpriteObject
{
  float x = width / 2;
  float y = height / 2;
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



