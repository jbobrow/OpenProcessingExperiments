
float prevX;
float prevY;
int currentBrush = 0;
SpriteObject ADTR;
SpriteObject cursorImage;
SpriteObject Snake;
void setup()
{
  size(600,600);
  ADTR = new SpriteObject("adtr.png");
  ADTR.s = 0.5;
  cursorImage = new SpriteObject("cursor.png");
  Snake = new SpriteObject("snake.png");
}
 
void draw()
{
  cursor(cursorImage.img, 1, 1);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (currentBrush == 0)
      {
        strokeWeight(random(5));
        pushMatrix();
        translate(mouseX, mouseY);
        fill(0, 255, 0);
        triangle(-25, 25, 0, -25, 25, 25);
        popMatrix();
      }
      if (currentBrush == 1)
      {
        ADTR.x = mouseX;
        ADTR.y = mouseY;
        ADTR.s = random(1.5);
        ADTR.rotation += 5;
        ADTR.render();
      }
      if (currentBrush == 2)
      {
        strokeWeight(random(50));
        stroke(random(255), random(255), random(255));
        line(prevX * random(7), prevY * random(-4), mouseX + random(8), mouseY + random(-4));
      }
    }
  }
  prevX = mouseX;
  prevY = mouseY;
}
 
void keyReleased()
{
  if (key == '0')
  {
    currentBrush = 0;
  }
   
  if (key == '1')
  {
    currentBrush = 1;
  }
   
  if (key == '2')
  {
    currentBrush = 2;
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



