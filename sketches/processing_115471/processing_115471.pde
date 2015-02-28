
SpriteObject [] mysprites = new SpriteObject [10];
int indexSprite = 0;
int counter = 0;

void setup()
{
  size (500,500);
  background(0);
  mysprites[0] = new SpriteObject("anima0.jpg");
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
  counter ++;
  println(counter);
  
  if(counter > 60)
  {
    indexSprite += 2;
    counter = 0;
  }
  if(indexSprite >= 9)
  {
    indexSprite = 0;
  }
  mysprites[indexSprite].render();
}

void keyPressed()
{
  if(keyCode == UP)
  {
    indexSprite ++;
  }
  if(keyCode == DOWN)
  {
    indexSprite --;
    if (indexSprite <= 9)
    {
      indexSprite = 0;
    }
  }
  if (key == 'a')
  {
    indexSprite = (int)random(6);
  }
}

class SpriteObject
{
  float x = 250.0;
  float y = 250.0;
  float w = width/2;
  float h = height/2;
  float rotation = 0.0;
  float s = 2.0;
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
      if (this.w == 1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == 1.0)
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



