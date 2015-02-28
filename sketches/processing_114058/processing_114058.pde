
int index = 0;
int speed = 1;
SpriteObject[] animals = new SpriteObject[10];

void setup()
{
 size(500, 500);
 animals[0] = new SpriteObject("animal0.jpg");
 animals[1] = new SpriteObject("animal1.jpg");
 animals[2] = new SpriteObject("animal2.jpg");
 animals[3] = new SpriteObject("animal3.jpg");
 animals[4] = new SpriteObject("animal4.jpg");
 animals[5] = new SpriteObject("animal5.jpg");
 animals[6] = new SpriteObject("animal6.jpg");
 animals[7] = new SpriteObject("animal7.jpg");
 animals[8] = new SpriteObject("animal8.jpg");
 animals[9] = new SpriteObject("animal9.jpg");
 frameRate(speed);
}

void draw()
{ 
  if (keyCode == RIGHT)
  {
   if(index >= 0 && index < 10)
  {
   animals[index].render();
   index++;
   if(index == 9)
   {
    index = 0; 
   }
    
  }  
  }
 if(keyCode == LEFT)
 {
  if(index < 10 && index >= 0)
  {
   animals[index].render();
   index--;
   if(index == 0)
   {
    index = 9; 
   }
  }  
 }  
}

void keyReleased()
{
 if (keyCode == DOWN)
 {
 speed++;
 frameRate(speed); 
 }
 if (keyCode == UP)
 {
  index = (int)random(9);
  animals[index].render();
 }
}

class SpriteObject
{
  float x = 250.0;
  float y = 250.0;
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



