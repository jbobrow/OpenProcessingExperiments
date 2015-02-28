
SpriteObject[] mysprites = new SpriteObject[100];
float timer = 0;
int currentSprite = 0;
float rate = 0.0167;
   
void setup()
{
  size(500, 500);
    
   
  for (int i = 0; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number0.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 1; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number1.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 2; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number3.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 3; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number4.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 4; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number5.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 5; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number6.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
 
      for (int i = 6; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number7.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 7; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number8.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 8; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number9.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 9; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number10.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 10; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number11.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 12; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number12.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 13; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number13.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 14; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number14.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 15; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number15.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 16; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number16.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
 
      for (int i = 17; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number17.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 18; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number18.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 19; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number19.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
    for (int i = 20; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number20.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 21; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number21.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 22; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number22.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
   for (int i = 23; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("number23.jpg");
    mysprites[i].x = (width/2);
    mysprites[i].y = (height/2);
    mysprites[i].s = (1);
    
  }
  
 
   
}
  
void draw()
{
  background(0);
  timer += rate;
  frameRate(60);
   
  if (timer > 1)
  {
     
    currentSprite += 1;
    timer = 0;
  }
  if (currentSprite >= 100)
  {
    currentSprite = 0;
  }
    
  mysprites[currentSprite].render();
  
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



