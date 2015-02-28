
float leftD = 0;
float rightD = 0;
float z = 0;
float speed = 5;
float h = 0;
float g = 0;
float x = 0;
float a =0;
float b = 0;
float c = 0;
float d = 0;
float e = 0;
float f = 0;

SpriteObject mario;
 
void setup()
{
   
  size(450, 450);
  mario = new SpriteObject("mario.png");
  mario.x = width / 2;
  mario.y = height * 0.9;
  mario.s = 0.2;
}
 
 
void draw()
{
  background(0);
  mario.x += (rightD - leftD) * speed;
  float left = mario.x - (mario.w * 0.5 * mario.s);
  float right = mario.x + (mario.w * 0.5 * mario.s);
  float top = mario.y - (mario.h * 0.5 * mario.s);
  float bottom = mario.y + (mario.h * 0.5 * mario.s);
   
  if (rectRectIntersect(left, top, right, bottom, 50, h, 50 + 50, h + 50) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  ellipse(50, h, 50, 50);
   
    if (rectRectIntersect(left, top, right, bottom, 150, a, 150 + 50, a + 30) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  rect(150, a, 50, 30);
   
  if (rectRectIntersect(left, top, right, bottom, 250, b, 250 + 30, b + 30) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  ellipse(250, b, 30, 30);
   
    if (rectRectIntersect(left, top, right, bottom, 350, c, 350 + 30, c + 50) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  rect(350, c, 30, 50);
   
    if (rectRectIntersect(left, top, right, bottom, 100, g, 100 + 25, g + 25) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  ellipse(100, g, 25, 25);
   
    if (rectRectIntersect(left, top, right, bottom, 200, d, 200 + 25, d + 40) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  ellipse(200, d, 25, 40);
   
    if (rectRectIntersect(left, top, right, bottom, 300, e, 300 + 40, e + 25) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  rect(300, e, 40, 25);
   
    if (rectRectIntersect(left, top, right, bottom, 400, f, 400 + 40, f + 40) == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(255);
  }
  ellipse(400, f, 40, 40);
   
  mario.render();
   
  g += 1;
  h += 1.8;
  a += 2;
  b += 3;
  c += 2.5;
  d += 1.6;
  e += 1.5;
  f += 1.3;
   
}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftD = 0;
    }
    if (keyCode == RIGHT)
    {
      rightD = 0;
    }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftD = 1;
    }
    if (keyCode == RIGHT)
    {
      rightD = 1;
    }
  }
}
   
   
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
      return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
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
        this.w = this.img.width/3;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height/3;
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



