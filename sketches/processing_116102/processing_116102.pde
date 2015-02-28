
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
SpriteObject ship;
float y = 0;

void setup()
{
  
  size(500,500);
  ship = new SpriteObject("ship.jpg");
  ship.x = 0;
  ship.y = 450;
  ship.s = .2;
  
}

void draw()
{
  background(0);
  ship.x += (right - left) * speed;
  ship.render();
  y += 1;  
  if (ship.isOverlappingRect(0, y, 50, y+50) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
  ellipseMode(CORNER);
  ellipse(0,y,50,50);
  
  if (ship.isOverlappingRect(450, y-250, 450+50, y+50) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
   ellipse(240,y,50,50);
   
  if (ship.isOverlappingRect(450, y-250, 450+50, y+50) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
   rect(450,y-250,50,50);
   
  if (ship.isOverlappingRect(150, y, 150+50, y+50) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
   ellipse(150,y,50,50);
   
   
  if (ship.isOverlappingRect(200, y-150, 250+100, y-100) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
   triangle(200,y-100,250,y-150,300,y-100);
   
  if (ship.isOverlappingRect(300, y+25, 300+50, y+50) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }   
   rect(300,y+25,50,50);
   
   if (ship.isOverlappingRect(350, y-150, 400+100, y-100) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }  
   triangle(350,y-100,400,y-150,425,y-100);
   
   if (ship.isOverlappingRect(35, y-50, 35+50, y+50) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
   
   rect(35,y-50,50,50);
   
   if (ship.isOverlappingRect(200, y-150, 250+100, y-100) == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
   
   triangle(200,y-100,250,y-150,300,y-100);

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
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
  
  boolean isOverlappingRect(float otherLeft, float otherTop, float otherRight, float otherBottom) 
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);

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



