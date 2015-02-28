
SpriteObject number0;
SpriteObject number1;
SpriteObject number2;
SpriteObject number4;

SpriteObject movingNumber;
SpriteObject anotherNumber;

void setup()
{
  size(500, 500);

  
  // number images to switch to (not drawn)
  number0 = new SpriteObject("number0.jpg"); 
  number1 = new SpriteObject("number1.jpg");
  number2 = new SpriteObject("number2.jpg"); 
  number4 = new SpriteObject("number4.jpg");
  
  // sprite we draw
  anotherNumber = new SpriteObject("number0.jpg");
  anotherNumber.x = 0.0;
  anotherNumber.y = width / 2;
  anotherNumber.s = 2.0;
  
  // sprite we draw
  movingNumber = new SpriteObject("number1.jpg");
  movingNumber.x = width / 2;
  movingNumber.y = 0;
}

void draw()
{
  background(0);
 
  // move another number to the right
  anotherNumber.x += 0.5;
  
  // move moving number down
  movingNumber.y += 1;
 
  if (anotherNumber.isOverlapping(movingNumber))
  {
    // change image of movingNumber to number2 when overlapping.
    movingNumber.img = number2.img;
  }
  else
  {
    movingNumber.img = number1.img;
  }

  // only draw 2 numbers at a time
  anotherNumber.render();
  movingNumber.render();
}

void keyPressed()
{
  anotherNumber.img = number4.img;
}

void keyReleased()
{
  anotherNumber.img = number0.img;
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
  
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s)) 
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);   
     
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
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




