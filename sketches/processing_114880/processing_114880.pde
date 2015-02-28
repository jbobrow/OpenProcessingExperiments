
float prevX;
float prevY;
int currentBrush = 0;
SpriteObject triBrush;
PImage cursorImage;
PImage paletteImage;
color backgroundColor;
float rotation = 0;
float s = 1;

void setup()
{
  size(700, 700);

  cursorImage = requestImage("hand.jpg");
  paletteImage = requestImage ("wheel.png");
}

void draw()
{
  float x = mouseX;
  float y = mouseY;
  
  if (cursorImage.width > 0)
  {
    cursor(cursorImage, 7, 7);
  }
  
  if (paletteImage.width > 0)
  {
    imageMode(CORNER);
    image(paletteImage, 0, 0, 200, 200);
  }
  
  if (mousePressed == true && mouseButton == RIGHT)
  {
    backgroundColor = get(mouseX, mouseY);
  }
  
  
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (currentBrush == 0)
      {
        strokeWeight(random(40));
        stroke(random(255), random(255), random(255));
        line(prevX, prevY, mouseX, mouseY);
      }
       
        if (currentBrush == 1)
      {
        noStroke();
        fill(red(backgroundColor), green(backgroundColor), blue(backgroundColor));
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(radians(rotation));
        scale(this.s);
        triangle(-45, 45, 0, -45, 45, 45);
        popMatrix();
      } 
    }
  }
}



void keyReleased()
{
  if (key == '1')
  {
    currentBrush = 0;
  }
  if (key == '2')
  {
    currentBrush = 1;
  }
  {
    if (key == 's')
    this.s += 2;
  }
  {
    if (key == 'x')
    this.s += -2;
  }
}

void keyPressed()
{
  if (key == 'r')
  {
    rotation += 10;
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


