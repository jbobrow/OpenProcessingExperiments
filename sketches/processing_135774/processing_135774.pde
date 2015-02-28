
Bluebird mybluebird = new Bluebird();
Gnbird mygnbird = new Gnbird();
Predator myevilbird = new Predator();

PImage birdgamebackground;

void setup()
{
  size (500, 500);
  birdgamebackground = requestImage("birdgamebackground.jpg");
  //background (0);
}

void draw()
{
  image(birdgamebackground, 0, 0, width, height);
  mybluebird.draw();
  mygnbird.draw();
  
  float distanceToGnbird = dist(mygnbird.x, mygnbird.y, myevilbird.x, myevilbird.y);
  float distanceToBluebird = dist(mybluebird.x, mybluebird.y, myevilbird.x, myevilbird.y);
  if (distanceToBluebird < distanceToGnbird)
  {
    myevilbird.draw(mybluebird.x, mybluebird.y);
  }
  else
  {
    myevilbird.draw(mygnbird.x, mygnbird.y);
  }
}

class Bluebird
{
  float x = 200;
  float y = 200;
  float speed = 2; 
  PImage img; 
  
  Bluebird()
  {
    this.img = requestImage("bluebird.png");
  }
  
  void draw()
  {
    this.x +=this.speed;
    
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
      image(this.img, 0, 0, 73, 80);// I added width and height dimensions here 73, 80 after changing image size in PS
      imageMode(CORNER);
      popMatrix();
    }
  }
}

class Gnbird
{
  float x = 100;
  float y = 100;
  float yspeed = 1;
  float xspeed = 1;
  PImage img;
  float w = 100;
  float h = 100;
  
  Gnbird()
  {
    this.img = requestImage("gnbird.png");
  }
  
  void draw()//I changed all of the this to that here trying to get birds to showup
  {
    this.x += this.xspeed;
    this.y += this.yspeed;
    
    if (this.x > width - (this.img.width / 2) || this.x < (this.img.width /2))
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
       image(img, this.x, this.y, this.w, this.h);//image(this.img, 0, 0, 100, 79);//I added width and height dimensions here 
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
    this.img = requestImage("evilbird.png");
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


