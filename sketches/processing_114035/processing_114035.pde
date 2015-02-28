
SpriteObject[]  images = new SpriteObject[10];
int index, rate;
boolean reversed;

void setup()
{
  size(300, 300);
  for(int c = 0; c < 10; c++)
  {
    images[c] = new SpriteObject("animal" + c + ".jpg");
    images[c].x = 150;
    images[c].y = 150;
  }
  
  index = 0; rate = 3;
  reversed = false;
  
}

void draw()
{
  frameRate(rate);
  images[abs(index)%10].render();
  if(!reversed)
  {
    index++;
  }
  else
  {
    index--;
  }
  
  print("Index: " + index + " ");
  println("Rate: " + rate);
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      rate++;
    }
    
    if(keyCode == DOWN)
    {
      rate--;
    }
  }
  
  if(key == ' ')
  {
    reversed = !reversed;
  }
  
  if(key == 'r')
  {
    index = (int)random(0, 9);
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



