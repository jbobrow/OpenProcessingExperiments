
Deer mydeer;
Rabbit myrabbit;  
Rabbit myrabbit2; 
Predator mywolf;
PImage grass; 

void setup() 
{ 
  size(500, 500); 
  grass = requestImage("grass.png"); 
  mydeer = new Deer(); 
  myrabbit = new Rabbit();
  myrabbit2 = new Rabbit();
  myrabbit2.x= 300;
  mywolf = new Predator();
} 
void draw() 
{ 
  image(grass, 0,0,width, height); 
  mydeer.draw(); 
  myrabbit.draw(); 
  myrabbit2.draw();
  float distanceToRabbit = dist(myrabbit.x, myrabbit.y, mywolf.x, mywolf.y); 
  float distanceToRabbit2 = dist(myrabbit2.x, myrabbit2.y, mywolf.x, mywolf.y); 
  float distanceToDeer = dist(mydeer.x, mydeer.y, mywolf.x, mywolf.y); 

  if (distanceToDeer < distanceToRabbit && mydeer.eaten == false) 
  { 
    mywolf.draw(mydeer.x, mydeer.y); 
  } 
  else if (myrabbit.eaten == false)
  { 
    mywolf.draw(myrabbit.x, myrabbit.y); 
  }
  else if (myrabbit2.eaten == false)
  { 
    mywolf.draw(myrabbit2.x, myrabbit2.y); 
  }
  else
  {
    mywolf.draw(mywolf.x, mywolf.y);
  } 
  
  if (distanceToRabbit < 20 && myrabbit.eaten == false)
  {
    myrabbit.eaten = true;
    mywolf.w = mywolf.w*1.5;
    mywolf.h = mywolf.h*1.5;
  }
  if (distanceToRabbit2 < 20 && myrabbit2.eaten == false)
  {
    myrabbit2.eaten = true;
    mywolf.w = mywolf.w*1.5;
    mywolf.h = mywolf.h*1.5;
  }
  if (distanceToDeer < 50 && mydeer.eaten == false)
  {
    mydeer.eaten = true;
     mywolf.w = mywolf.w*2;
    mywolf.h = mywolf.h*2;
  }
} 

class Deer
{ 
  float x = 200; 
  float y = 200; 
  float speed = 2; 
  PImage img; 
  boolean eaten = false;
  Deer() 
  { 
    this.img = requestImage("deer.png"); 
  }

  void draw() 
  { 
    this.x += this.speed; 
   
    if (this.x > width - (this.img.width / 2) || this.x < (this.img.width / 2)) 
    { 
      this.speed = -this.speed;  
    } 
   
    if (this.img.width > 0 && this.eaten == false) 
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

class Rabbit
{ 
  float x = 100; 
  float y = 100;
  float yspeed = 1; 
  float xspeed = 1; 
  PImage img; 
  PImage deathimg; 
  float timer = random(10,60);
  boolean eaten = false;
  
  Rabbit() 
  { 
    this.img = requestImage("rabbit.png"); 
    this.deathimg = requestImage("death.jpg");
  } 

  void draw()
  { 
    if (this.eaten == false)
    {
      timer = timer - (1 / 30.0);
    }
    if (timer <= 0)
    {
      this.eaten = true;
      
    }
    else
    {
      this.x += this.xspeed; 
      this.y += this.yspeed; 
    }

    if (this.x > width - (this.img.width / 2) || this.x < (this.img.width / 2)) 
    { 
      this.xspeed = -this.xspeed;  
    } 

    if (this.y > height - (this.img.height / 2) || this.y < (this.img.height / 2)) 
    { 
      this.yspeed = -this.yspeed;  
    } 
   

    if (this.img.width > 0 && this.eaten == false) 
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
    if (this.img.width > 0 && timer <= 0) 
    {   
      pushMatrix(); 
      translate(this.x, this.y); 
      if (this.xspeed < 0) 
      { 
        scale(-1, 1); 
      } 
      imageMode(CENTER); 
      image(this.deathimg, 0, 0); 
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
    this.img = requestImage("wolf.png");
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



