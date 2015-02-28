
SpriteObject[] myimage = new SpriteObject[10];
int myimageIndex = 0;
int imageIndex = 0;
float timer = 0;
PImage myImage;
PImage myPic;
PImage myPic2;

void setup()
{
  myPic = requestImage("glasses.png");
  myPic2 = requestImage("plane.png");
  size(800, 600);
  colorMode(HSB, 360, 99, 99);
  myimage[0] = new SpriteObject("toon1.jpg");
  myimage[1] = new SpriteObject("toon2.jpg");
  myimage[2] = new SpriteObject("toon3.jpg");
  myimage[3] = new SpriteObject("toon4.jpg");
  myimage[4] = new SpriteObject("toon5.jpg");
  myimage[5] = new SpriteObject("toon6.jpg");
  myimage[6] = new SpriteObject("toon7.jpg");
  myimage[7] = new SpriteObject("toon8.jpg");
  myimage[8] = new SpriteObject("toon9.jpg");
  myimage[9] = new SpriteObject("toon10.jpg");
  
  for (int i = 0; i < 10; i += 1)
  {
    myimage[i].x = width / 2;
  }
  for (int i = 0; i < 10; i += 1)
  {
    myimage[i].y = height / 2;
  }
  for (int i = 0; i < 10; i += 1)
  {
    myimage[i].w = width;
  }
  for (int i = 0; i < 10; i += 1)
  {
    myimage[i].h = height;
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
  timer += 0.0167;
  if (timer > .6)
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
    myimageIndex = 10;
  }

 myimage[myimageIndex].render();

  pushMatrix();
  for (int x=0; x<=20; x++) 
   {
    for (int y=0; y<=20; y++) 
    {
      stroke(0); 
      fill(61, 99, 99);
      ellipse(80, 80, 300, 300);
    }
   }
   popMatrix();
   pushMatrix();
   for (int x=0; x<=20; x++) 
   {
    for (int y=0; y<=20; y++) 
    {
      image(myPic, 80, 80, 300, 80);
    }
   }
   popMatrix();
      pushMatrix();
   for (int x=0; x<=20; x++) 
   {
    for (int y=0; y<=20; y++) 
    {
     image(myPic2, 500, 40, 80, 60);
    }
   }
   popMatrix();
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



