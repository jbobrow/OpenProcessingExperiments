
Pokeball mypokeball;
Haunter myhaunter;
Duskull myduskull;
float timer = 0;

PImage mansion;
PImage tomb;

void setup()
{
  size(1131, 707);
  mansion = requestImage("Pokemon_Haunted_Mansion.jpg");
  tomb = requestImage("tombstone.png");
   mypokeball = new Pokeball();
   myhaunter = new Haunter();
   myduskull = new Duskull();
  
}

void draw()
{
  image(mansion, 0, 0, width, height);
  myhaunter.draw();
  myduskull.draw();
  
  float distanceToDuskull = dist (myduskull.x, myduskull.y, mypokeball.x, mypokeball.y);
  float distanceToHaunter = dist (myhaunter.x, myhaunter.y, mypokeball.x, mypokeball.y);
  if (distanceToHaunter < distanceToDuskull)
  {
    mypokeball.draw(myhaunter.x, myhaunter.y);
  }
  else
  {
    mypokeball.draw(myduskull.x, myduskull.y);
  }
}

class Haunter
{
  float x = 400;
  float y = 400;
  float speed = 1.5;
  PImage img;
  float timer = 0;
  
  Haunter()
  {
    this.img = requestImage("Haunter.png");
  }
  
  void draw()
  {
    timer = timer + (1.0/30.0);
    
    if (timer < 19)
  {
    this.x += this.speed;
  }
    
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
        scale(-1, -1);
      }
      imageMode(CENTER);
      if (timer > 19)
      {
        image(tomb, 0, 0, 100, 100);
      }
      else
      {
        image(this.img, 0, 0);
      }
      imageMode(CORNER);
      popMatrix();
    }
  }
}

class Duskull
{
  float x = 200;
  float y = 250;
  float yspeed = 2;
  float xspeed = 2;
  PImage img;
  
 Duskull()
  {
    this.img = requestImage("Duskull.png");
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
      image(this.img, 0, 0);
      imageMode(CORNER);
      popMatrix();
    }
  }
}

class Pokeball
{
  float speed = 1;
  float x = 900;
  float y = 500;
  PImage img;
  float w = 100;
  float h = 100;
  float easing = 0.01;
  
  Pokeball()
  {
    this.img = requestImage("Pokeball.png");
  }
  
  void draw(float targetx, float targety)
  {
    timer = timer + (1.0/30.0);
    
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
    if (timer > 19 && this.w == 100)
    {
      this.w *= 3;
      this.h *= 3;
    }
  }
}



