
Dolphin mydolphin = new Dolphin();
Diver mydiver = new Diver();
Predator myoctopus = new Predator();
PImage ocean;

void setup()
{
  size(500, 500);
  ocean = requestImage("underwater.jpg");
}

void draw()
{
  image(ocean, 0,0,width, height);
  mydolphin.draw();
  mydiver.draw();
  
  float distanceToDiver = dist(mydiver.x, mydiver.y, myoctopus.x, myoctopus.y);
  float distanceToDolphin = dist(mydolphin.x, mydolphin.y, myoctopus.x, myoctopus.y);
  if (distanceToDolphin < distanceToDiver)
  {
    myoctopus.draw(mydolphin.x, mydolphin.y);
  }
  else
  {
    myoctopus.draw(mydiver.x, mydiver.y);
  }
}


class Dolphin
{
  float x = 200;
  float y = 200;
  float speed = 2;
  PImage img;
  
  Dolphin()
  {
    this.img = requestImage("dolphin_blue.png");
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
      image(this.img, 0, 0);
      imageMode(CORNER);
      popMatrix();
    }
  }
}


class Diver
{
  float x = 100;
  float y = 100;
  float yspeed = 1;
  float xspeed = 1;
  PImage img;
  
  Diver()
  {
    this.img = requestImage("diver.png");
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
    this.img = requestImage("octopus.png");
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


