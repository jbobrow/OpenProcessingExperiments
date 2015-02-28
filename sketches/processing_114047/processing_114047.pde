
SpriteObject[] mysprites = new SpriteObject[10];
float timer = 0;
int currentSprite = 0;
int index, speed;
boolean reverse;
  
void setup()
{
  size(300, 300);
   
  for (int i = 0; i < 10; i++)
  {
    mysprites[i] = new SpriteObject("animal" + i + ".jpg");
    mysprites[i].x = width/2;
    mysprites[i].y = height/2;
    /*mysprites[i].s = random(0.5);
    mysprites[i].rotation = random(360);*/
  }
  index = 0;
  speed = 70;
  reverse = false;
}
 
void draw()
{
  background(0);
  timer += 0.0167;
   
  frameRate(speed);
  
  if(speed < 0)
  {
    speed = 1;
  }
  
  if(index > 9)
  {
    index = 0;
  }
  // Every 3 seconds increment the index currentSprite
  // so we draw the next SpriteObject stored in mysprites;
  if (timer > 1)
  {
    if(!reverse)
    {
      currentSprite -= 1;
    }
    else
    {
    currentSprite += 1;
    }
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

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      speed++;
    }
    if(keyCode == DOWN)
    {
      speed--;
    }
  }
  if(key == 'r')
  {
    reverse = !reverse;
  }
  if(key == ' ')
  {
    currentSprite = (int)random(0,9);
  }
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




