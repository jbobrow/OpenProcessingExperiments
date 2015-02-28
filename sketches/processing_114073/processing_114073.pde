
SpriteObject[] animals = new SpriteObject[10];
int tracker =1;
float timer=0;
float equalizer;
boolean cycle = false;
int rImage=0;
int direction = 1;
void setup()
{
  frameRate(10);
  size(500,500);
  animals[0] = new SpriteObject("animal0.jpg");
  animals[0].x=width/2;
  animals[0].y=height/2;
  animals[1] = new SpriteObject("animal1.jpg");
    animals[1].x=width/2;
  animals[1].y=height/2;
  animals[2] = new SpriteObject("animal2.jpg");
    animals[2].x=width/2;
  animals[2].y=height/2;
  animals[3] = new SpriteObject("animal3.jpg");
    animals[3].x=width/2;
  animals[3].y=height/2;
  animals[4] = new SpriteObject("animal4.jpg");
  
    animals[4].x=width/2;
  animals[4].y=height/2;
  animals[5] = new SpriteObject("animal5.jpg");
  
    animals[5].x=width/2;
  animals[5].y=height/2;
  animals[6] = new SpriteObject("animal6.jpg");
  
    animals[6].x=width/2;
  animals[6].y=height/2;
  animals[7] = new SpriteObject("animal7.jpg");
  
    animals[7].x=width/2;
  animals[7].y=height/2;
  animals[8] = new SpriteObject("animal8.jpg");
  
    animals[8].x=width/2;
  animals[8].y=height/2;
  animals[9] = new SpriteObject("animal9.jpg");
  
    animals[9].x=width/2;
  animals[9].y=height/2;

  
}
void draw()
{
    animals[tracker].render();
    
    tracker += direction;
    if (tracker > 9)
    {
      tracker = 0;
    }
    if (tracker < 0)
    {
      tracker = 9;
    }
  if(keyPressed==true)
  {
    if (key=='r')
    {
      rImage=(int)random(0,9);
      rImage=tracker;
    }
    if (key=='f')
    {
      frameRate(frameRate + 10);
    }
    if (key=='d')
    {
      direction = -1;
    }
    
  }
  timer+=0.1;
  println(timer);

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



