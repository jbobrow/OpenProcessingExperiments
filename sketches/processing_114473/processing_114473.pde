
SpriteObject[] mysprites = new SpriteObject[13];
float timer = 0;
int currentSprite = 0;
int index, speed;
boolean reverse;

   
void setup()
{
  size(500, 500);
 
  for (int i = 0; i < 13; i++)
  {
    mysprites[i] = new SpriteObject("cat" + i + ".jpg");
    mysprites[i].x = width/2;
    mysprites[i].y = height/2;
  }
  index = 0;
  speed = 325;
  reverse = true;
}
  
void draw()
{
   println("x: " + mouseX + " y: " + mouseY);

  println(mousePressed);
  background(0);
  timer += 0.0167;
    
  frameRate(speed);

  if(index > 12)
  {
    index = 0;
  }
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
  if (currentSprite >= 13 && mousePressed == true)
  {
    currentSprite = 10;
  }
  if (currentSprite >= 9 && mousePressed ==false)
  {
    currentSprite = 0;
  }
  if (currentSprite < 11 && mousePressed == true)
  {
    currentSprite = 10;
  }
    
  mysprites[currentSprite].render();

  for (int x = 170; x < 200; x= x+5) 
  {
    for (int y = 360; y < 445; y = y+5) 
    {
    point(x, y);
    }
  }
  for (int x = 245; x < 270; x= x+5) 
  {
    for (int y = 140; y < 155; y = y+5) 
    {
    point(x, y);
    }
  }
  for (int x = 245; x < 270; x= x+5) 
  {
    for (int y = 120; y < 140; y = y+5) 
    {
    point(x, y);
    }
  }
  for (int x = 260; x < 270; x= x+5) 
  {
    for (int y = 95; y < 120; y = y+5) 
    {
    point(x, y);
    }
  }
  for (int x = 123; x < 135; x= x+5) 
  {
    for (int y = 105; y < 150; y = y+5) 
    {
    point(x, y);
    }
  }
  for (int x = 248; x < 261; x= x+5) 
  {
    for (int y = 372; y < 420; y = y+5) 
    {
    point(x, y);
    }
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



