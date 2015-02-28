
Prey1 myprey1 = new Prey1();
Prey2 myprey2 = new Prey2();
Predator mypacman = new Predator();
PImage park;

class Prey1
{
  float x = 200;
  float y = 200;
  float w = 100;
  float h = 100;
  float speed = 2;
  PImage img;
  
  Prey1()
  {
    this.img = requestImage("tennisball.png");
  }
  
  void draw()
  {
    this.x += this.speed;
    
    if (this.x > width - (this.img.width / 2) || this.x < (this.img.width / 2))
    {
      this.speed = -this.speed;
    }
    if (this.img.width > 0)
    {
      pushMatrix();
      translate(this.x, this.y);
      if (this.speed > 0)
      {
        scale(-1, 1);
      }
      imageMode(CENTER);
      image(this.img, 0, 0, this.w, this.h);
      imageMode(CORNER);
      popMatrix();
    }
  }
}

class Prey2
{
  float x = 100;
  float y = 100;
  float w = 100;
  float h = 100;
  float xspeed = 1;
  float yspeed = 1;
  PImage img;
  
  Prey2()
  {
    this.img = requestImage("rugbyball.jpg");
  }
  
  void draw()
  {
    this.x += this.xspeed;
    this.y += this.yspeed;
    
    if (this.x > width - (this.img.width / 2) || this.x < (this.img.width / 2))
    {
      this.xspeed = -this.xspeed;
    }
    
    if (this.y > height - (this.img.height / 2) || this.y < (this.img.height / 2))
    {
      this.yspeed = -this.yspeed;
    }
    
    if (this.img.width > 0)
    {
      pushMatrix();
      translate(this.x, this.y);
      if (this.xspeed < 0)
      {
        scale(-1, 1);
      }
      imageMode(CENTER);
      image(this.img, 0, 0, this.w, this.h);
      imageMode(CORNER);
      popMatrix();
    }
  }
}

class Predator
{
  float speed = 2;
  float x = 300;
  float y = 300;
  PImage img;
  float w = 100;
  float h = 100;
  float easing = 0.01;
    
  Predator()
  {
    this.img = requestImage("pacman.png");
  }
 
  void draw(float targetx, float targety)
  {
    float toX = targetx - this.x;
    float toY = targety - this.y;
    
    this.x += (toX * this.easing);
    this.y += (toY * this.easing);
     
    if (img.width > 0)
    {
      imageMode(CENTER);
      image(img, this.x, this.y, this.w, this.h);
      imageMode(CORNER);
    }
  }
}

void setup()
{
  size(500, 500);
  park = requestImage("citipark.jpg");
}

void draw()
{
  image(park, 0, 0, width, height);
  myprey1.draw();
  myprey2.draw();
   
  float distanceToprey2 = dist(myprey2.x, myprey2.y, mypacman.x, mypacman.y);
  float distanceToprey1 = dist(myprey1.x, myprey1.y, mypacman.x, mypacman.y);
  if (distanceToprey1 < distanceToprey2)
  {
    mypacman.draw(myprey1.x, myprey1.y);
  }
  else
  {
    mypacman.draw(myprey2.x, myprey2.y);
  }
}




