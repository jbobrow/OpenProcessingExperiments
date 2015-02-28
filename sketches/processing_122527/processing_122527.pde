
float prevX;
float prevY;
int brush = 1;
SpriteObject PBrush;
 
void setup()
{
  size(700, 700);
  PBrush = new SpriteObject("BD.jpg");
  PBrush.w = 50;
  PBrush.h = 50;
}
 
void draw()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (brush == 1)
      {
        strokeWeight(10);
        stroke(255, 0, 0);
        line(prevX, prevY, mouseX, mouseY);
      }
      if (brush == 2)
      {
        fill(0, 255, 0);
        noStroke();
        rect(mouseX, mouseY, 40, 40);
      }
      if (brush == 3)
      {
        PBrush.x = mouseX;
        PBrush.y = mouseY;
        PBrush.render();
      }
    }
  }
   
  prevX = mouseX;
  prevY = mouseY;
}
 
void keyReleased()
{
  if (key == '2')
  {
    brush = 2;
  }
  if (key == '1')
  {
    brush = 1;
  }
  if (key == '3')
  {
    brush = 3;
  }
   
}
 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
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



