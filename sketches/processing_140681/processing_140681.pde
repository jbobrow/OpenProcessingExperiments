
Alien myalien;
Ghost myghost;
Zombie myzombie;

PImage ghost;
PImage alien;
PImage aliendead;
PImage zombie;
PImage graveyard;
PImage tombstone;
float timer = 0;

 
void setup()
{
  size (600, 600);
  graveyard = requestImage ("graveyard.jpg");
  tombstone = requestImage ("tombstone.png");
  aliendead = requestImage ("aliendead.png");
  myalien = new Alien ();
  myghost = new Ghost ();
  myzombie = new Zombie ();
}
 
void draw ()
{
  println(timer);
  image (graveyard, 0, 0, width, height);
  myzombie.draw();
  myalien.draw();
   
  float distanceToAlien = dist(myalien.x, myalien.y, myghost.x, myghost.y);
  float distanceToZombie = dist(myzombie.x, myzombie.y, myghost.x, myghost.y);
  if (distanceToZombie < distanceToAlien)
  {
    myghost.draw(myzombie.x, myzombie.y);
  }
  else
  {
    myghost.draw(myalien.x, myalien.y);
  }
}
 
class Zombie
{
  float x = 550;
  float y = 550;
  float speed = 1.5;
  PImage img;
  float timer = 0;
   
  Zombie()
  {
    this.img = requestImage ("zombie.png");
  }
   
  void draw()
  {
    timer = timer + (1.0/30.0);
 
    if (timer < 20)
    {
      this.x += this.speed;
    }
     
    if(this.x > width - (this.img.width / 2) || this.x < (this.img.width / 2))
    {
      this.speed =- this.speed;
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
      if (timer > 15 && this.speed == 1.5)
      {
        this.speed *= .2;
      }
      if (timer > 20)
      {
        image(tombstone,0, 0, 80, 80);
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
   
 
class Alien
{
  float x = 150;
  float y = 150;
  float yspeed =1;
  float xspeed =1;
  float speed = 2;
  PImage img;
   
  Alien()
  {
    this.img = requestImage ("alien.png");
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
      if (this.speed > 0)
      {
        scale(-1, 1);
      }
      imageMode(CENTER);
      if (timer > 15)
      {
        image(aliendead,0, 0, 80, 80);
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
  
class Ghost
{
  float speed = 2;
  float x = 450;
  float y = 150;
  PImage img;
  float w = 100;
  float h = 100;
  float easing = 0.01;
  float radius = .5;
  
 
Ghost()
{
  this.img = requestImage ("ghost.png");
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
  }
}



