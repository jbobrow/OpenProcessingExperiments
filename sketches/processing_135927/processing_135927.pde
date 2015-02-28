
/*@pjs preload="popo.png, Crook.png, city.jpg"; */

PImage robber;
PImage city; 
PImage img; 
PImage suit;
PImage cop; 

float timer = 10;


Person baby;
Crook crook;
Predator popo; 

void setup()
{
  size(800, 500);
  city = requestImage("city.jpg");
  baby = new Person();
  crook = new Crook();
  popo = new Predator();
}
 
void draw()
{
  timer = timer - (1.0 / 30.0);

  image(city, 0,0,width, height);
  baby.draw();

   
  float distanceToCrook = dist(crook.x, crook.y, popo.x, popo.y);
  float distanceToBaby = dist(baby.x, baby.y, popo.x, popo.y);
  if (distanceToBaby < distanceToBaby)
  {
    popo.draw(baby.x, baby.y);
  }
  else
  {
    popo.draw(crook.x, crook.y);
  }
  
  
  if (distanceToCrook > 20)
  {
    crook.draw();
  }
  
  
}

 
 
class Person
{
  float x = 200;
  float y = 200;
  float speed = 2;
  PImage img;
  PImage img2; 
  float w = 55;
  float h = 100;
  
  Person()
  {
    this.img2 = requestImage("baby.png");
    
      
    this.img = requestImage("suit.png");
    
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
      if(timer >=0)
      {
      image(this.img2, 0, 0, this.w, this.h);
      }
      else
      {image(this.img, 0, 0, this.w, this.h);}
      imageMode(CORNER);
      popMatrix();
    }
  }
  
}
  

 
 
class Crook
{
  float x = 100;
  float y = 300;
  float yspeed = 1;
  float xspeed = 1;
  PImage img;
  float w = 150;
  float h = 200;
  
  Crook()
  {
    this.img = requestImage("Crook.png");
  }
   
  void draw()
  {
    this.x += this.xspeed;
    this.y += this.yspeed;
 
    if (this.x > width - (this.w / 2) || this.x < (this.w / 2))
    {
      this.xspeed = -this.xspeed;
    }
    if (this.y > height - (this.h / 2) || this.y < (this.h / 2))
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
      image(this.img, 0, 0,this.w,this.h);
      imageMode(CORNER);
      popMatrix();
    }
  }
}
 
class Predator
{
  float speed = 5;
  float x = 1000;
  float y = 0;
  PImage img;
  float w = 100;
  float h = 100;
  float easing = 0.02;
    
  Predator()
  {
    this.img = requestImage("popo.png");}
 
  void draw(float targetx, float targety)
  {
    float toX = targetx - this.x;
    float toY = targety - this.y;
    
    // Use easing to move with an acceleration
    // add the direction to the prey
    // but multiply by a small value (easing) to slow him down
    this.x += (toX * this.easing);
    this.y += (toY * this.easing);
    
    if (dist(crook.x, crook.y, this.x, this.y) < 50)
    {
      this.easing = .05;
    }
   
    if (img.width > 0)// && dist(targetx, targety, this.position.x, this.position.y) > 20)
    {
      imageMode(CENTER);
      image(img, this.x, this.y, this.w, this.h);
      imageMode(CORNER);
    }
  }
}





