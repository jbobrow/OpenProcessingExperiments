
Deer mydeer = new Deer(); 
Rabbit myrabbit = new Rabbit(); 
Predator mywolf = new Predator();
PImage grass; 

void setup() 
{ 
  size(500, 500); 
  grass = requestImage("grass.png"); 
} 
void draw() 
{ 
  image(grass, 0,0,width, height); 
  mydeer.draw(); 
  myrabbit.draw(); 
  float distanceToRabbit = dist(myrabbit.x, myrabbit.y, mywolf.x, mywolf.y); 
  float distanceToDeer = dist(mydeer.x, mydeer.y, mywolf.x, mywolf.y); 

  if (distanceToDeer < distanceToRabbit) 
  { 
    mywolf.draw(mydeer.x, mydeer.y); 
  } 
  else 
  { 
    mywolf.draw(myrabbit.x, myrabbit.y); 
  } 
} 

class Deer
{ 
  float x = 200; 
  float y = 200; 
  float speed = 2; 
  PImage img; 
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

class Rabbit
{ 
  float x = 100; 
  float y = 100;
  float yspeed = 1; 
  float xspeed = 1; 
  PImage img; 
  Rabbit() 
  { 
    this.img = requestImage("rabbit.png"); 
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



