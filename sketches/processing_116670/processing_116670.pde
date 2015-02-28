
SpriteObject alone;
SpriteObject fairy;
SpriteObject fairy1;
SpriteObject fairy2;
SpriteObject fairy3;
SpriteObject fairy4;
SpriteObject fairy5;
SpriteObject fairy6;
SpriteObject fairy7;




float left = 0;
float right = 0;
float x = 0;
float speed = 6.0;
float drop = 20;

void setup()
{

size( 700, 700);
  alone = new SpriteObject("alone.png");
  alone.x = height/2;
  alone.y = 650;
  alone.s = 0.01;
  
  
  fairy =  new SpriteObject("fairy.png");
  fairy.x = random(700);
  fairy.y = 100;
  fairy.s = .3;

    fairy1 =  new SpriteObject("fairy.png");
  fairy1.x = random(700);
  fairy1.y = 50;
  fairy1.s = .2;
  
  
  
    fairy2 =  new SpriteObject("fairy.png");
  fairy2.x = random(700);
  fairy2.y = 100;
  fairy2.s = .19;

  fairy3 =  new SpriteObject("fairy.png");
  fairy3.x = random(700);
  fairy3.y = 30;
  fairy3.s = .16;

  fairy4 =  new SpriteObject("fairy.png");
  fairy4.x = random(700);
  fairy4.y = 200;
  fairy4.s = .15;

  fairy5 =  new SpriteObject("fairy.png");
  fairy5.x = random(700);
  fairy5.y = 0;
  fairy5.s = .09;

  fairy6 =  new SpriteObject("fairy.png");
  fairy6.x = random(700);
  fairy6.y = 0;
  fairy6.s = .07;

  fairy7 =  new SpriteObject("fairy.png");
  fairy7.x =random(700);
  fairy7.y = 90;
  fairy7.s = .13;
   
  


}





void draw()

{
background(0);

  


fairy.y +=1;
fairy1.y += 2;
fairy2.y += 3;
fairy3.y +=1.4;
fairy4.y += .4;
fairy5.y += 4;
fairy6.y += 3.5;
fairy7.y += 2.3;
 alone.x += (right - left) * speed;


{
   if (alone.isMouseOverlapping() == false)
  {
    alone.render();
  }

  alone.render();
  fairy.render();
  fairy1.render();
  fairy2.render();
  fairy3.render();
  fairy4.render();
  fairy5.render();
  fairy6.render();
  fairy7.render();

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
  float rotation = 0.0;
  float s = .01;
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




