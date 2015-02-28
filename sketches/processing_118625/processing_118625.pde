
SpriteObject image1;
SpriteObject image2;
SpriteObject image3;
/*SpriteObject image4;
SpriteObject image5;
SpriteObject image6;
SpriteObject image7;
SpriteObject image8;  */
float timer = 0;
float t =1;
float x = 0;
float speed = 3.0;
int angle =0;
float left = 0;
float right = 0;

void setup()
{
 size (500,500);
 image1 = new SpriteObject("spear.jpg");
 image1.x = 250;
 image1.y = 0;
 image1.s=.1;
 image1.rotation = 180;
 

 image2 = new SpriteObject("demon.jpg");
 image2.x = 0;
 image2.y = 300;
 image2.s=.5;
 

 image3 = new SpriteObject("light.jpg");
 image3.x = 250;
 image3.y = 50;
 image3.s=.2;
 
}

void draw()
{
  timer = timer + 0.0167;
  t = t - 0.0167;
   
  background(255);
  image1.x += (right - left)  * speed;
  
  image1.render();
  
  if (image2.isOverlapping(image1) == true)
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  image2.render();
  image2.x +=2;
  
  image3.render();
  

}

void keyReleased()
{
  if (key == CODED)
  {
    if( keyCode == LEFT)
    {
      left = 0;
    }
    if ( keyCode == RIGHT)
    {
      right=0;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }
  if( key ==CODED)
  {
    if(keyCode == DOWN)
    {
      image1.y += 15;
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
  
  boolean isOverlappingMouse()
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



