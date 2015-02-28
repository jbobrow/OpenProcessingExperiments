
float prevX;
float prevY;
float timer = 0;
float t = 1;
int currentBrush = 0;
SpriteObject ocarinaBrush;
SpriteObject majoraBrush;
SpriteObject moon;
PImage cursorImage;
boolean larger = true;

void setup()
{
  size(600,600);
  ocarinaBrush = new SpriteObject("ocarina.png");
  ocarinaBrush.s = 0.2;
  majoraBrush = new SpriteObject("majoras_mask.png");
  majoraBrush.s = 0.5;
  moon = new SpriteObject("moon.png");
  moon.s = 1.5;
  cursorImage = requestImage("triforce_cursor.png");
}

void draw()
{
  timer = timer + 0.0167;
  t = t - 0.0167;
  
  if(cursorImage.width > 0)
  {
    cursor(cursorImage, 1, 1);
  }
  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
    {
      if(currentBrush == 0)
      {
        stroke(random(255));
        strokeWeight(random(10));
        fill(random(255), random(255), random(255));
        pushMatrix();
        ellipse(mouseX, mouseY, random(100), random(100));
        popMatrix();
      }
      if(currentBrush == 1)
      {
        ocarinaBrush.x = mouseX;
        ocarinaBrush.y = mouseY;
        ocarinaBrush.rotation += 10;
        ocarinaBrush.render();
      }
      if(currentBrush == 2)
      {
        background(random(0, 255));
        moon.x = width/2;
        moon.y = height/2;
        
        if(t <= 0)
        {
          larger = !larger;
          t = 1;
        }
        if(larger)
        {
          moon.s += 0.03;
        }
        if(!larger)
        {
          if(moon.s > 0)
          {
            moon.s -= 0.03;
          }
        }
        moon.render();
        
        majoraBrush.x = mouseX;
        majoraBrush.y = mouseY;
        majoraBrush.render();
      }
      if(currentBrush == 3)
      {
        noStroke();
        fill(#2AE3F2);
        ellipse(mouseX,mouseY,50,50);
      }
    }
  }
}

void keyReleased()
{
  if(key == '0')
  {
    currentBrush = 3;
  }
  if(key == '1')
  {
    currentBrush = 0;
  }
  if(key == '2')
  {
    currentBrush = 1;
  }
  if(key == '3')
  {
    currentBrush = 2;
  }
  if(keyCode == BACKSPACE)
  {
    background(#FFFFFF);
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 0.0;
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


