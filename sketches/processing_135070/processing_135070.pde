
float radius = 20;
float y = 50.0;
float x = 33;
float speed = 1;
 
float predatorX = 300;
float predatorY = 300;
float predatorRadius = 40;
float predatorSpeed = 2;
 
float easing = 0.05;
PImage backgroundimg;

class Bird
{
  int dir = 1;
  float x = 20;
  float y = 20;
  float xspeed = 2;
  float yspeed = 2;
  PImage img;
  
  Bird()
  {
    this.img = requestImage("bird-cartoon-md.png");
  }
  
  void draw()
  {
    image(img, this.x,this.y, 100, 100);
    if(this.x < width && this.x >= 0)
    {
    this.x += this.xspeed;
    //this.y += this.yspeed;
    }
    if (this.x > width - (this.img.width / 2)|| this.x <= 0)
    {
      this.xspeed *= -1;
    }
    if (this.y > height - (this.img.height / 2)|| this.y <= 0)
    {
      this.yspeed = -this.yspeed;
    }
  }
}

Bird mybird = new Bird();

class Bird2
{
  int dir = 1;
  float x = 20;
  float y = 20;
  float xspeed = 2;
  float yspeed = 2;
  PImage img;
  
  Bird2()
  {
    this.img = requestImage("bird.png");
  }
  
  void draw()
  {
    image(img, this.x,this.y, 100, 100);
    if(this.x < width && this.x >= 0)
    {
    this.x += this.xspeed;
    //this.y += this.yspeed;
    }
    if (this.x > width - (this.img.width / 2)|| this.x <= 0)
    {
      this.xspeed *= -1;
    }
    if (this.y > height - (this.img.height / 2)|| this.y <= 0)
    {
      this.yspeed = -this.yspeed;
    }
  }
}

Bird2 mybird2 = new Bird2();

class Predator
{
  float size = 100;
  float speed = 2;
  PVector position = new PVector(300, 300);
  PImage img;
   
  Predator()
  {
    this.img = requestImage("tiger4.png");
  }
   
  void update()
  {
    float toX = x - this.position.x;
    float toY = y - this.position.y;
   
    // Use easing to move with an acceleration
    // add the direction to the prey
    // but multiply by a small value (easing) to slow him down
    //predatorX += (toX * easing);
    //predatorY += (toY * easing);
   
    // check if predator is les than 200 away from prey and double speed if so
    if (dist(x, y, this.position.x, this.position.y) < 200)
    {
      this.speed = 4;
    }
   
    // Move at a constant speed
    PVector direction = new PVector(toX , toY);
    direction.normalize();
    this.position.x += direction.x * this.speed;
    this.position.y += direction.y * this.speed;
  }
   
  void draw()
  {
    //ellipse(this.position.x, this.position.y, this.size, this.size);
    if (img.width > 0 && dist(x, y, this.position.x, this.position.y) > 20)
    {
      image(img, this.position.x, this.position.y, this.size, this.size);
    }
  }
}
 
Predator mypredator = new Predator();
Predator mypredator2 = new Predator();

void setup()
{
  size(500,500);
  backgroundimg = requestImage("Savannah.jpg");
  
  mypredator2.position.y = 0;
}

void draw()
{
  image(backgroundimg, 0, 0, width, height);
  y = y + speed;
   
  if (y > height)
  {
    speed = -speed;
  }
  if (y < 0)
  {
    speed = -speed;
  }
  float waveSpeed = 0.5;
  float waveHeight = 10;
  x = 33 + sin(y * waveSpeed) * waveHeight;
  
  
  float distancetoprey1 = dist(mypredator.position.x,mypredator.position.y,x,y);
  float distancetoprey2 = dist(mypredator.position.x,mypredator.position.y,mypredator2.position.x,mypredator2.position.y);
  
  mypredator.update();
  mypredator.draw();
   
  mypredator2.update();
  mypredator2.draw(); 
  
  mybird.draw();
  mybird2.draw();
}



