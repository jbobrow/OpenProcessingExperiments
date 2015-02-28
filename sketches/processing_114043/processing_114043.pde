
SpriteObject [] mySprites = new SpriteObject[9];
int currentSprite = 0;
float timer = 0;
float limit = 5;
float randomNum = 0;

void setup()
{
  size(500, 500);
  for (int i = 0; i < 9; i++)
  {
    mySprites[i] = new SpriteObject("animal" + i + ".jpg");
  }
}

void draw()
{
  
  timer += 0.0167;
  if (timer > limit)
  {
    currentSprite +=1;
    timer = 0;
  }
  
  if (currentSprite >=9)
  {
    currentSprite = 0;
  }
  mySprites[currentSprite].render();
  
  
  println(timer);
  println(currentSprite);
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    currentSprite +=1;
    timer = 0;
  }
  
  if (mouseButton == RIGHT)
  {
   limit = 1; 
  }
}

void keyPressed()
{
  if (keyPressed == true)
  {
    currentSprite = (int)random(9);
    timer = 0;
  }
}

class SpriteObject
{
  float x = width/2;
  float y = height/2;
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



