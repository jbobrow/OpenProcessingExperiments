
Dragon mydragon = new Dragon ();
Babydragon mybabydragon = new Babydragon ();
Dragonknight mydragonknight = new Dragonknight ();
PImage woods;

void setup()
{
  size (900, 314);
  woods = requestImage ("background.png");
}

void draw ()
{
  image (woods, 0, 0, width, height);
  mybabydragon.draw();
  mydragon.draw();
  
  float distanceToDragon = dist(mydragon.x, mydragon.y, mydragonknight.x, mydragonknight.y);
  float distanceToBabydragon = dist(mybabydragon.x, mybabydragon.y, mydragonknight.x, mydragonknight.y);
  if (distanceToBabydragon < distanceToDragon)
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
  
  Babydragon()
  {
    this.img = requestImage ("monster1.png");
  }
  
  void draw()
  {
    this.x += this.speed;
    
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
      image(this.img, 0, 0);
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
  PImage img;
  
  Dragon()
  {
    this.img = requestImage ("monster2.png");
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
 
class Dragonknight
{
  float speed = 2;
  float x = 300;
  float y = 300;
  PImage img;
  float w = 100;
  float h = 100;
  float easing = 0.01;

Dragonknight()
{
  this.img = requestImage ("monster3.png");
}

  void draw(float targetx, float targety)
  {
    float toX = targetx - this.x;
    float toY = targety - this.y;
    
    // Use easing to move with an acceleration
    // add the direction to the prey
    // but multiply by a small value (easing) to slow him down
    this.x += (toX * this.easing);
    this.y += (toY * this.easing);
     
    if (img.width > 0)// && dist(targetx, targety, this.position.x, this.position.y) > 20)
    {
      imageMode(CENTER);
      image(img, this.x, this.y, this.w, this.h);
      imageMode(CORNER);
    }
  }
}



