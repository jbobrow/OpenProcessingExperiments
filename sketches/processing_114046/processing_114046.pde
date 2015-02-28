
SpriteObject[] mysprites = new SpriteObject[100];
int imageindex = 0;
int timer = 0;


void setup()
{
  size(300,300);
  mysprites[0] = new SpriteObject("animal0.jpg");
  mysprites[1] = new SpriteObject("animal1.jpg");
  mysprites[2] = new SpriteObject("animal2.jpg");
  mysprites[3] = new SpriteObject("animal3.jpg");
  mysprites[4] = new SpriteObject("animal4.jpg");
  mysprites[5] = new SpriteObject("animal5.jpg");
  mysprites[6] = new SpriteObject("animal6.jpg");
  mysprites[7] = new SpriteObject("animal7.jpg");
  mysprites[8] = new SpriteObject("animal8.jpg");
  mysprites[9] = new SpriteObject("animal9.jpg");
}

void draw()
{
  timer++;
  if (timer >= 60)
  {
    imageindex++;
    timer = 0;
    
    if (imageindex == 10)
    {
      imageindex = 0;
    }
  }
  
  mysprites[imageindex].render();
 
    
}



class SpriteObject
{
  float x = 150.0;
  float y = 150.0;
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

void keyPressed()
{
  if (keyCode == UP)
  {
    timer ++; //Increases speed
  }
  
  if (key == 'q')
  {
    imageindex = int(random(10)); //Loads random image
  }
  
  if (keyCode == LEFT)
  {
    imageindex--; //Cycles back 1 image
  }
  
  if (keyCode == RIGHT)
  {
    imageindex++; // Cycles foward 1 image
  }
}



