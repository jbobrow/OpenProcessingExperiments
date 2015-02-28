
SpriteObject cat;

float a = 0;
float speed = 3.0;

float left = 0;
float right = 0;

float[] rectX = new float[8];
float[] rectY = new float[8];
float[] rectW = new float[8];
float[] rectSpeed = new float[8];
color[] rectC = new color[8];

//color rectColor;

void setup()
{
  size(500,500);
  cat = new SpriteObject("nyan.png");
  //cat.x = width/2;
  //cat.y = height/2;
  cat.s = 0.5;
  
  cat.x = width/2;
  cat.y = 430;
  
  for (int i = 0; i < 8; i++)
  {
    rectX[i] = random(width);
    rectY[i] = 0;
    rectW[i] = random(20,50);
    rectC[i] = color(random(255), random(255), random(255));
    rectSpeed[i] = random(2,4);
  }
}

void draw()
{
  background(0);
  cat.x += (right - left)*speed;
  cat.render();
  
  for (int i = 0; i < 8; i++)
  {
    float left = cat.x - (cat.w*0.5*cat.s);
    float right = cat.x + (cat.w*0.5*cat.s);
    float top = cat.y - (cat.h*0.5*cat.s);
    float bottom = cat.y + (cat.h*0.5*cat.s);
    if (rectRectIntersect(
      rectX[i], rectY[i], rectW[i]+ rectX[i], rectW[i]+ rectY[i], // rect
      left, top, right, bottom) == true) // cat
    {
      fill(255,0,0);
    }
    else
    {
      fill(rectC[i]);
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

boolean rectRectIntersect(float left, float top, float right, float bottom,
        float otherLeft, float otherTop, float otherRight, float otherBottom) 
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



