
SpriteObject[] imageArray = new SpriteObject[10];
int imageindex = 0;
int timer = 0;

void setup()
{
  size(300,300);
  imageArray[0] = new SpriteObject("IMAGE1.jpg");
  imageArray[1] = new SpriteObject("IMAGE2.png");
  imageArray[2] = new SpriteObject("IMAGE3.jpg");
  imageArray[3] = new SpriteObject("IMAGE4.jpg");
  imageArray[4] = new SpriteObject("IMAGE5.jpg");
  imageArray[5] = new SpriteObject("IMAGE6.jpg");
  imageArray[6] = new SpriteObject("IMAGE7.jpg");
  imageArray[7] = new SpriteObject("IMAGE8.jpg");
  imageArray[8] = new SpriteObject("IMAGE9.jpg");
  imageArray[9] = new SpriteObject("IMAGE10.jpg");
}
 
void draw()
{
  timer++;
  if (timer >= 40)
  {
    imageindex++;
    timer = 0;
     
    if (imageindex == 10)
    {
      imageindex = 0;
    }
  }
   
  imageArray[imageindex].render();
  
     
}

class SpriteObject
{
  float x = 150.0;
  float y = 150.0;
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
 
void keyPressed()
{
  if (key == 'r')
  {
    imageindex = int(random(7));
  }
   
  if (keyCode == UP)
  {
    timer++;
  }
   
  if (keyCode == RIGHT)
  {
    imageindex++;
  }
   
  if (keyCode == LEFT)
  {
    imageindex--;
  }
}



