
SpriteObject[] mysprites = new SpriteObject[100];
float timer = 0;
int currentSprite = 0;
float rate = 0.0167;
  
void setup()
{
  size(600, 600);
   
  
  for (int i = 0; i < 100; i++)
  {
    mysprites[i] = new SpriteObject("animal0.jpg");
    mysprites[i].x = random(width);
    mysprites[i].y = random(height);
    mysprites[i].s = random(0.5);
    mysprites[i].rotation = random(360);
  }
  for( int a = 5; a < 100; a++)
  
  {
    
    mysprites[a] = new SpriteObject("animal1.jpg");
    mysprites[a].x = random(width);
    mysprites[a].y = random(height);
    mysprites[a].s = random(2);
    mysprites[a].rotation = random(120);
  }
  
  for(int q = 6; q < 100; q++)
  
  {
    mysprites[q] = new SpriteObject("animal2.jpg");
    mysprites[q].x = random(width);
    mysprites[q].y = random(height);
    mysprites[q].s = random(0.5);
    mysprites[q].rotation = random(360);
  }
  
  for(int z = 15; z < 100; z++)
  {
    mysprites[z] = new SpriteObject("animal3.jpg");
    mysprites[z].x = random(width);
    mysprites[z].y = random(height);
    mysprites[z].s = random(0.5);
    mysprites[z].rotation = random(360);
  }
  for(int w = 25; w < 100; w++)
   {
    mysprites[w] = new SpriteObject("animal4.jpg");
    mysprites[w].x = random(width);
    mysprites[w].y = random(height);
    mysprites[w].s = random(0.5);
    mysprites[w].rotation = random(360);
  }
  for (int p = 35; p < 100; p++)
   {
    mysprites[p] = new SpriteObject("animal5.jpg");
    mysprites[p].x = random(width);
    mysprites[p].y = random(height);
    mysprites[p].s = random(0.5);
    mysprites[p].rotation = random(360);
  }
 
   for (int u = 50; u < 100; u++)
   {
    mysprites[u] = new SpriteObject("animal6.jpg");
    mysprites[u].x = random(width);
    mysprites[u].y = random(height);
    mysprites[u].s = random(0.5);
    mysprites[u].rotation = random(360);
  }
  
 for (int k = 65; k < 100; k++)
   {
    mysprites[k] = new SpriteObject("animal7.jpg");
    mysprites[k].x = random(width);
    mysprites[k].y = random(height);
    mysprites[k].s = random(0.5);
    mysprites[k].rotation = random(360);
  }
  
  for (int g = 75; g < 100; g++)
   {
    mysprites[g] = new SpriteObject("animal8.jpg");
    mysprites[g].x = random(width);
    mysprites[g].y = random(height);
    mysprites[g].s = random(0.5);
    mysprites[g].rotation = random(360);
  }
  
  
  for (int m = 85; m < 100; m++)
   {
    mysprites[m] = new SpriteObject("animal9.jpg");
    mysprites[m].x = random(width);
    mysprites[m].y = random(height);
    mysprites[m].s = random(0.5);
    mysprites[m].rotation = random(360);
  }
  
  
  
}
 
void draw()
{
  background(0);
  timer += rate;
  frameRate(60);
  
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
 
void keyReleased()
{

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      rate += 0.01;
    }
  }
  if (keyCode == DOWN)
  {
    rate -= 0.01;
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



