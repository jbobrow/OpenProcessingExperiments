
SpriteObject dk;

float a = 0;
float speed = 3.0;

float left = 0;
float right = 0;

float[] rectX = new float[8];
float[] rectY = new float[8];
float[] rectW = new float[8];
float[] rectSpeed = new float[8];
color[] rectC = new color[8];
 
void setup() 
{
  size(1000, 1000);
  dk = new SpriteObject("dk.png");
  //dk.x = width/2;
  //dk.y = height/2;
  //dk.s = 0.5;
  
  dk.x = width/2;
  dk.y = 420;
    

  for (int i = 0; i < 8; i++)
  {
   rectX[i] = random(width);
    rectY[i] = 0;
    rectW[i] = random(25, 60);
    rectC[i] = color(random(255), random(0), random(255));
    rectSpeed[i] = random(2,5);
  }
}

void draw()
{
  background(0);
  dk.x= (right - left) * speed;
  dk.render();
  
  for (int i = 0; i < 8; i++)
  {
    float left = dk.x - (dk.w*0.5);
    float right = dk.x + (dk.w*0.5);
    float top = dk.y - (dk.h*0.5);
    float bottom = dk.y + (dk.h*0.5);
    if (rectRectIntersect (
      rectX[i], rectY[i], rectW[i] + rectX[i], rectW[i] + rectY[i], 
      left, top, right, bottom) == true)
      
      {
        fill(0, 0, 255);
      }
      else
      {
        fill(random(255));
      }
      rect(rectX[i], rectY[i], rectW[i], rectW[i]);
      rectY[i] += rectSpeed[i];
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      left = 0;
    }
    if(keyCode == RIGHT)
    {
      right = 0;
    }
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      left = 1;
    }
    if(keyCode == RIGHT)
    {
      right = 1;
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
     
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}
 
boolean rectRectIntersect(float left, float top, float right, float bottom,
        float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



