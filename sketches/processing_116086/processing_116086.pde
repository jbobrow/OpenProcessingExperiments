
SpriteObject troll;
SpriteObject troll2;
SpriteObject troll3;
SpriteObject troll4;
SpriteObject troll5;
SpriteObject troll6;
SpriteObject troll7;
SpriteObject troll8;
SpriteObject nottroll;
float left = 0;
float right = 0;
float x = 0;
float speed = 3.0;


void setup()
{
  size(500, 500);
  nottroll = new SpriteObject("leon.jpg");
  nottroll.y = 500;
  nottroll.x = height/2;
  nottroll.s = .4;
  
  troll = new SpriteObject("unicorn.png");
  troll.y = 0;
  troll.x = random(height/2);
  troll.s = .1;
   
  troll2 = new SpriteObject("unicorn.png");
  troll2.y = 0;
  troll2.x = random(width);
  troll2.s = 0.1;
   
  troll3 = new SpriteObject("unicorn.png");
  troll3.y = 0;
  troll3.x = random(400);
  troll3.s = .1;
  
  troll4 = new SpriteObject("unicorn.png");
  troll4.y = 0;
  troll4.x = random(400);
  troll4.s = .1;
  
  troll5 = new SpriteObject("unicorn.png");
  troll5.y = 0;
  troll5.x = random(height/2);
  troll5.s = .1;
   
  troll6 = new SpriteObject("unicorn.png");
  troll6.y = 0;
  troll6.x = random(height);
  troll6.s = 0.1;
   
  troll7 = new SpriteObject("unicorn.png");
  troll7.y = 0;
  troll7.x = random(400);
  troll7.s = .1;
  
  troll8 = new SpriteObject("unicorn.png");
  troll8.y = 0;
  troll8.x = random(400);
  troll8.s = .1;
}
  
void draw()
{
  background(0);


  troll.render();
  troll.y +=0.7;

  troll2.render();
  troll2.y += 1;
   
  troll3.render();
  troll3.y += 0.8;
  
  troll4.render();
  troll4.y +=.1;

  troll5.render();
  troll5.y += 0.6;
   
  troll6.render();
  troll6.y += 0.3;
  
  troll7.render();
  troll7.y += 0.6;
   
  troll8.render();
  troll8.y += 0.3;
   
  if (troll.isOverlapping(nottroll) == true ||
  troll2.isOverlapping(nottroll) == true ||
  troll3.isOverlapping(nottroll) == true ||
  troll4.isOverlapping(nottroll) == true ||
  troll5.isOverlapping(nottroll) == true ||
  troll6.isOverlapping(nottroll) == true ||
  troll7.isOverlapping(nottroll) == true ||
  troll8.isOverlapping(nottroll) == true
  )
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
    x += (right - left) * speed;


  translate(x,0);

  nottroll.render();
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



