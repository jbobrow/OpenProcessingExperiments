
SpriteObject[] mysprites = new SpriteObject[100];
float timer = 0;
int currentSprite = 0;
 
void setup()
{
  size(300, 300);
  
  // Load 100 of the same image at random transforms
  for (int i = 0; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("skull.jpg");
    mysprites[i].x = random(width);
    mysprites[i].y = random(height);
    mysprites[i].s = random(0.5);
    mysprites[i].rotation = random(360);
  }
}

void draw()
{
  background(0);
  timer += 0.0167;
  
  // Every 3 seconds increment the index currentSprite
  // so we draw the next SpriteObject stored in mysprites;
  if (timer > 3)
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



