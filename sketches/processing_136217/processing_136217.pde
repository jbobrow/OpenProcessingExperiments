
Dragon mydragon;
Babydragon mybabydragon; 
Dragonknight mydragonknight;
PImage woods;
PImage tombs;
float timer = 0;
PImage ghosts;

void setup()
{
  size (1100, 600);
  woods = requestImage ("background.png");
  tombs = requestImage ("tomb.png");
  ghosts = requestImage ("ghost.png");
   mydragon = new Dragon ();
   mybabydragon = new Babydragon ();
   mydragonknight = new Dragonknight ();
}

void draw ()
{
  image (woods, 0, 0, width, height);
  mybabydragon.draw();
  mydragon.draw();
  
  float distanceToDragon = dist(mydragon.x, mydragon.y, mydragonknight.x, mydragonknight.y);
  float distanceToBabydragon = dist(mybabydragon.x, mybabydragon.y, mydragonknight.x, mydragonknight.y);
  if (distanceToBabydragon < distanceToDragon )
  {
    mydragonknight.draw(mybabydragon.x, mybabydragon.y);
  }
  else
  {
    mydragonknight.draw(mydragon.x, mydragon.y);
  }
}

class Babydragon
{
  float x = 200;
  float y = 200;
  float speed = 2;
  PImage img;
  float timer = 0;
  
  Babydragon()
  {
    this.img = requestImage ("monster1.png");
  }
  
  void draw()
  {
    timer = timer + (1.0/30.0);

    if (timer < 17.5)
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
      if (timer > 17.5)
      {
        image(tombs,0, 0, 80, 80);
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
  

class Dragon
{
  float x = 100;
  float y = 100;
  float yspeed =1;
  float xspeed =1;
  float speed = 2;
  PImage img;
  
  Dragon()
  {
    this.img = requestImage ("blackgirl.png");
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
      if (timer > 17.5)
      {
        image(ghosts,0, 0, 80, 80);
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
 
class Dragonknight
{
  float speed = 2;
  float x = 300;
  float y = 300;
  PImage img;
  float w = 100;
  float h = 100;
  float easing = 0.01;
  float radius = .5;
 

Dragonknight()
{
  this.img = requestImage ("monster3.png");
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
    if (timer > 17.5 && this.w == 100)
    {
        this.w *= 2;
        this.h *= 2;
    }
  }
}




