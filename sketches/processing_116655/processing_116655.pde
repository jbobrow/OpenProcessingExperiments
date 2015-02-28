
SpriteObject meteor;
SpriteObject meteor1;
SpriteObject meteor2;
SpriteObject meteor3;
SpriteObject meteor4;
SpriteObject meteor5;
SpriteObject meteor6;
SpriteObject meteor7;
SpriteObject jax;


void setup(){
  size(500,500);
  
  jax = new SpriteObject("jax.png");
  
  jax.x = 100;
  jax.y = 470;
  jax.s = 0.5;

  meteor = new SpriteObject("meteor.png");
   meteor.x = 100;
  meteor.y =  100;
  meteor.s = 0.4;
  
  meteor1 = new SpriteObject("meteor1.png");
  meteor1.x = 350;
  meteor1.y = 50;
  meteor1.s = 0.5;
  
    meteor2 = new SpriteObject("meteor2.png");
  meteor2.x = 450;
  meteor2.y = 0;
  meteor2.s = 0.45;
  
    meteor3 = new SpriteObject("meteor3.png");
  meteor3.x = 50;
  meteor3.y = 0;
  meteor3.s = 0.35;
  
    meteor4 = new SpriteObject("meteor4.png");
  meteor4.x = 250;
  meteor4.y = 25;
  meteor4.s = 0.65;
  
    meteor5 = new SpriteObject("meteor5.png");
  meteor5.x = 50;
  meteor5.y = 100;
  meteor5.s = 0.4;
  
    meteor6 = new SpriteObject("meteor6.png");
  meteor6.x = 170;
  meteor6.y = 0;
  meteor6.s = 0.65;
  
    meteor7 = new SpriteObject("meteor7.png");
  meteor7.x = 400;
  meteor7.y = 50;
  meteor7.s = 0.7;
  
  
  
 
}



void draw(){
  
  
  
  /*meteor1.x = 350;
  meteor1.y = 50;
  meteor1.s = 0.6;   */
  
  background(0);
  if (meteor.isMouseOverlapping() == false)
  {
   meteor.render();
   meteor1.render();
   meteor2.render();
   meteor3.render();
   meteor4.render();
   meteor5.render();
   meteor6.render();
   meteor7.render();
   jax.render();
  }
  
   
  meteor.y += 1;
  meteor1.y += 1.3;
  meteor2.y += 0.4;
  meteor3.y += 0.75;
  meteor4.y += 1.5;
  meteor5.y += 1.2;
  meteor6.y += 0.6;
  meteor7.y += 0.9;
  
  if (jax.isOverlapping(meteor))
  {
    tint(255,0,0);
  }
  else
  {
    tint(255);
  }
  
  

}

void keyPressed(){
 if (keyCode == RIGHT)
{
 jax.x += 20;
}

if (keyCode == LEFT)
{
  jax.x -= 20;
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
 
}


