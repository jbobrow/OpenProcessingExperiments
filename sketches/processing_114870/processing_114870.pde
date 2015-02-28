
float prevX;
float prevY;
int currentBrush = 0;
SpriteObject Pikachu;
SpriteObject cursorImage;
void setup()
{
  size(600,600);
  Pikachu = new SpriteObject("pikachu.png");
  Pikachu.s = 0.5;
  cursorImage = new SpriteObject("cursor.png");
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
        strokeWeight(random(50));
        stroke(random(255), random(255), random(255));
        line(prevX, prevY, mouseX, mouseY);
      }
      if (currentBrush == 1)
      {
        noStroke();
        fill(255, 0, 0);
        rectMode(CENTER);
        rect(mouseX, mouseY, 40, 40);
      }
      if (currentBrush == 2)
      {
        Pikachu.x = mouseX;
        Pikachu.y = mouseY;
        Pikachu.rotation += 5;
        Pikachu.render();
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

void mouseOut()
{
  
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



