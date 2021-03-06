
SpriteObject[] mysprites = new SpriteObject[10];
float timer = 0;
int currentSprite = 0;

void setup()
{
  size(500, 500);
  
  mysprites[0] = new SpriteObject("animal1.jpg");
  mysprites[1] = new SpriteObject("animal2.jpg");
  mysprites[2] = new SpriteObject("animal3.jpg");
  mysprites[3] = new SpriteObject("animal4.jpg");
  mysprites[4] = new SpriteObject("animal5.jpg");
  mysprites[5] = new SpriteObject("animal6.jpg");
  mysprites[6] = new SpriteObject("animal7.jpg");
  mysprites[7] = new SpriteObject("animal8.jpg");
  mysprites[8] = new SpriteObject("animal9.jpg");
  mysprites[9] = new SpriteObject("animal0.jpg");
}

void draw()
{
  background(0);
  timer += .06;
  
  if (timer > 3)
  {
    currentSprite += 1;
    timer = 0;
  }
  if (currentSprite >= 10)
  {
    currentSprite = 0;
  }
  
  if (currentSprite < 0)
  {
    currentSprite = 9;
  }
  
  mysprites[currentSprite].render();
  
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    currentSprite += -1;
  }
  
  if (mouseButton == RIGHT)
  {
    currentSprite += 1;
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      timer = timer - .05;
    }
  }
  
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      timer = timer + .1;
    }
  }
}
      
            
class SpriteObject
{
  float x = width/2;
  float y = height / 2;
  float w = width;
  float h = height;
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



