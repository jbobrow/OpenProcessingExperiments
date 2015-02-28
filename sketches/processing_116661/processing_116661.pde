
SpriteObject daddy;
SpriteObject[] yoshis = new SpriteObject[8];
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
color daddyColor = color(255);



void setup()

{
    size(500,500);
    daddy = new SpriteObject("daddy.png");
    daddy.x =50.0;
    daddy.y = width / 1.1;
    daddy.s =1.0;

    
    for (int i = 0; i < 8; i++)
    {
      yoshis[i] = new SpriteObject("yoshi.png");
      yoshis[i].x = random(500 +50);
      yoshis[i].y = width / 12.0;
      yoshis[i].s =1.0; 
       yoshis[i].speed =random(1.0, 3.0); 
    }
}


void draw()
{
  background(0);
  


  fill (255);
  
  for (int i = 0; i < 8; i++)
    {
      if (yoshis[i].isOverlapping(daddy) == true)
      {
        tint(255,0,0);
        daddyColor = color(0, 225, 0 );
      }
      else
      {
        tint(255);
      }
      yoshis[i].render();
      yoshis[i].y += yoshis[i].speed;      
    }
  
  
  //move spriteObject
  x += (right - left) * speed;
  daddy.x = x;
   
  
  if (daddy.isMouseOverlapping() == false)
  {
    tint(daddyColor);
    daddy.render();
    daddyColor = color(255);
  }
  
}

 


 void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
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
  float speed;
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
     if (mouseX> (this.x - (this.w * 0.5 * this.s))
       && mouseX <(this.x + (this.w * 0.5 * this.s))
       &&mouseY > (this.y - (this.w * 0.5 * this.s))
       &&mouseY < (this.y + (this.w * 0.5 * this.s)))
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



