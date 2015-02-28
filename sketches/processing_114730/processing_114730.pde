
float prevX;
float prevY;
int brush = 0;
SpriteObject starBrush;

void setup()
{
  size(600, 600);
  starBrush = new SpriteObject("star.png");
  starBrush.w = 200;
  starBrush.h = 200;
}

void draw()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (brush == 0)
      {
        strokeWeight(10);
        stroke(random(255), random(255), random(255));
        line(prevX, prevY, mouseX, mouseY);
      }
      if (brush == 1)
      {
        fill(255, 0, 0, 128);
        noStroke();
        ellipse(mouseX, mouseY, 40, 40);
      }
      if (brush == 2)
      {
        starBrush.x = mouseX;
        starBrush.y = mouseY;
        starBrush.rotation += 10;
        starBrush.render();
      }
    }
  }
  
  prevX = mouseX;
  prevY = mouseY;
}

void keyReleased()
{
  if (key == '1')
  {
    brush = 1;
  }
  if (key == '0')
  {
    brush = 0;
  }
  if (key == '2')
  {
    brush = 2;
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



