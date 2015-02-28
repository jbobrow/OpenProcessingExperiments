
SpriteObject image0;

float[] numbers = new float[10];
SpriteObject[] myimages = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;

void setup()
{
  size(500,500);
  background(#D5E5A7);
  for( int a = 0; a < 10; a += 1)
  {
    myimages[a] = new SpriteObject("animal" + a + ".jpg");
    myimages[a].x = width/2;
    myimages[a].y = width/2;
    myimages[a].w = 200;
    myimages[a].h = 200;
  }
  image0 = new SpriteObject("animal0.jpg");
  

  
  image0.x = 250;
  image0.y = 250;
  image0.rotation = 45;
  image0.w = 300;
  image0.h = 300;
  
  myimages[1].x = 125;
  myimages[1].y = 125;
  
  myimages[2].x = 375;
  myimages[2].y = 375;
  
  myimages[3].x = 125;
  myimages[3].y = 375;
  
  myimages[4].x = 375;
  myimages[4].y = 125;

}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == RIGHT)
    {
      imageIndex += 1;
    }
  }
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      imageIndex -= 1;
    }
  }
  if(key == '0')
  {
    imageIndex = 0;
  }
  if(key == '1')
  {
    imageIndex = 1;
  }
  if(key == '2')
  {
    imageIndex = 2;
  }
  if(key == '3')
  {
    imageIndex = 3;
  }
  if(key == '4')
  {
    imageIndex = 4;
  }
  if(key == '5')
  {
    imageIndex = 5;
  }
  if(key == '6')
  {
    imageIndex = 6;
  }
  if(key == '7')
  {
    imageIndex = 7;
  }
  if(key == '8')
  {
    imageIndex = 8;
  }
  if(key == '9')
  {
    imageIndex = 9;
  }
}

void draw()
{
  timer = timer + 0.0167;
  if(timer > 3)
  {
    imageIndex += 1;
    timer = 0;
  }
  if(imageIndex >= 10)
  {
    imageIndex = 0;
  }
  if(imageIndex < 0)
  {
    imageIndex = 9;
  }
  if(timer >0)
  {
    image0.rotation += 3;
    image0.render();
  }
  
  myimages[imageIndex].render();
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


