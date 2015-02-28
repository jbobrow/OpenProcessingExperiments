
SpriteObject[] myimage = new SpriteObject[10];
float timer = 0;
int myimageIndex = 0;

void setup()
{
  size(500, 500);
  myimage[0] = new SpriteObject("animal0.jpg");
  myimage[1] = new SpriteObject("animal1.jpg");
  myimage[2] = new SpriteObject("animal2.jpg");
  myimage[3] = new SpriteObject("animal3.jpg");
  myimage[4] = new SpriteObject("animal4.jpg");
  myimage[5] = new SpriteObject("animal5.jpg");
  myimage[6] = new SpriteObject("animal6.jpg");
  myimage[7] = new SpriteObject("animal7.jpg");
  myimage[8] = new SpriteObject("animal8.jpg");
  myimage[9] = new SpriteObject("animal9.jpg");

  for (int i = 0; i < 10; i += 1)
  {
    myimage[i].x = width/2;
    myimage[i].y = height/2;
  }
}

void keyReleased()
  {
    if (keyCode == RIGHT)
    {
      myimageIndex += 1;
    }
    if(keyCode == LEFT)
    {
      myimageIndex -= 1;
    }
    if(keyCode == '0')
    {
      myimageIndex = 0;
    }
    if(keyCode == '1')
    {
      myimageIndex = 1;
    }
    if(keyCode == '2')
    {
      myimageIndex = 2;
    }
    if(keyCode == '3')
    {
      myimageIndex = 3;
    }
    if(keyCode == '4')
    {
      myimageIndex = 4;
    }
    if(keyCode == '5')
    {
      myimageIndex = 5;
    }
    if(keyCode == '6')
    {
      myimageIndex = 6;
    }
    if(keyCode == '7')
    {
      myimageIndex = 7;
    }
    if(keyCode == '8')
    {
      myimageIndex = 8;
    }
    if(keyCode == '9')
    {
      myimageIndex = 9;
    }
  }

void draw()
{
  background(0);
  timer += 0.0167;
  if (timer > 3)
  {
    myimageIndex += 1;
    timer = 0;
  }
  if (myimageIndex >= 10)
  {
    myimageIndex = 0;
  }
  if (myimageIndex < 0)
  {
    myimageIndex = 9;
  }
    
  myimage[myimageIndex].render();
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


