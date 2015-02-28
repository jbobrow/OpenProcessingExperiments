

SpriteObject image1;
SpriteObject image2;
SpriteObject image3;
SpriteObject image4;
SpriteObject image5;
SpriteObject image6;
SpriteObject image7;
SpriteObject image8; 

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
  image1 = new SpriteObject("blood.jpg");
  image1.x = 300;
  image1.y = 0;
  image1.s=.25;
  
  image2 = new SpriteObject("url.jpg");
  image2.x = 250;
  image2.y = 0;
  image2.s=.3;
  
  image3 = new SpriteObject("minion.jpg");
  image3.x = 0;
  image3.y = 450;
  image3.s=.25;
  
  image4 = new SpriteObject("ace.jpg");
  image4.x = 390;
  image4.y = 0;
  image4.s=.5;
  
  image5 = new SpriteObject("spear.jpg");
  image5.x = 450;
  image5.y = 0;
  image5.s=.5;
  image5.rotation += 180;
  
  image6 = new SpriteObject("laser.jpg");
  image6.x = 150;
  image6.y = 0;
  image6.s=.5;
  image6.rotation += 90;
  
  image8 = new SpriteObject("sword.jpg");
  image8.x = 50;
  image8.y = 0;
  image8.s=.5;
  image8.rotation -=90;
  
  image7 = new SpriteObject("ace.knife");
  image7.x = 200;
  image7.y = 0;
  image7.s=.5;
  
  
  
}

void draw()
{
  timer = timer + 0.0167;
  t = t - 0.0167;
  
  background(255);
  image3.x += (right - left)  * speed;
  
  
  image3.render();
  
  if(image1.isOverlapping(image3) == true)
    {
     tint (255,0,0); 
    }
    else 
    {
      tint(255);
    }
  image1.render();
  image1.y +=.5;
  
  if(image2.isOverlapping(image3) == true)
    {
     tint (255,0,0); 
    }
    else 
    {
      tint(255);
    }
  
  image2.render();
  image2.rotation +=-5;
  image2.y += 1;
  
  if(image4.isOverlapping(image3) == true)
    {
     tint (255,0,0); 
    }
    else 
    {
      tint(255);
    }
  image4.render();
  image4.y +=1.7;
  
  if(image5.isOverlapping(image3) == true)
    {
     tint (255,0,0); 
    }
    else 
    {
      tint(255);
    }
  image5.render();
  image5.y +=.5;
  
  if(image6.isOverlapping(image3) == true)
    {
     tint (255,0,0); 
    }
    else 
    {
      tint(255);
    }
  image6.render();
  image6.y +=1;
  
  if(image8.isOverlapping(image3) == true)
    {
     tint (255,0,0); 
    }
    else 
    {
      tint(255);
    }
  image8.render();
  image8.y +=3 ;
  
  if(image7.isOverlapping(image3) == true)
    {
     tint (255,0,0); 
    }
    else 
    {
      tint(255);
    }
  image7.render();
  image7.y +=1.2;
  
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



