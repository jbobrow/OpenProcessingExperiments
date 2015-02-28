
PImage ship;
PImage enemy;
PImage background;

void setup()
{
  size(500, 500);
  background = requestImage("background.jpg");
   
  myship = new Ship();
  myenemy = new Enemy();
  
}
 
void draw()
{
  background(0);
  image(background, width, height);
    
  myship.draw();
  myenemy.draw();
 
  
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      myship.leftspeed = -3;
    }
    if (keyCode == RIGHT)
    {
      myship.rightspeed = 3;
    }
    
  }
}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      myship.leftspeed = 0;
    }
    if (keyCode == RIGHT)
    {
      myship.rightspeed = 0;
    }
  }
  if (key == ' ')
  {
    myship.bullets[myship.nextBullet].active = true;
    myship.bullets[myship.nextBullet].x = myship.x;
    myship.bullets[myship.nextBullet].y = myship.y;
     
    myship.nextBullet += 1;
     
    if (myship.nextBullet >= myship.bullets.length)
    {
      myship.nextBullet = 0;
    }
  }
}



class Ship
{
  float x = 250;
  float y = 400;
  float w = 70;
  float h = 50;
  float leftspeed = 0.0;
  float rightspeed = 0.0;
  
   
  Bullet[] bullets = new Bullet[10];
  int nextBullet = 0;
   
  Ship()
  {
    for (int i =0; i < bullets.length; i+=1)
    {
      this.bullets[i] = new Bullet();
    }
    ship = requestImage("ship.png");
  }
   
  void draw()
  {
    if (this.x < (this.w / 2))
    {
       this.leftspeed = 0;
    }
    if (this.x > width - (this.w / 2))
    {
       this.rightspeed = 0;
    }
       
    this.x += this.leftspeed + this.rightspeed;
     
    
   
    if (ship.width > 0)
    {
      imageMode(CENTER);
      image(ship, this.x, this.y, this.w, this.h);
    }
    noTint();
     
    for (int i =0; i < bullets.length; i+=1)
    {
      if (this.bullets[i].active == true)
      {
        this.bullets[i].draw();
      }
    }
  }
}
 
class Bullet
{
  float x = 100;
  float y = 400;
  float w = 15;
  float h = 15;
  float speed = -10;
  PVector direction = new PVector(0, 1);
  boolean active = false;
   
  void draw()
  {
    this.y += this.direction.y * this.speed;
    this.x += this.direction.x * this.speed;
    ellipse(this.x, this.y, this.w, this.h);
    
    if (key == '1')
    {
      fill(255,0,0);
    }
    if (key == '2')
    {
      fill(0,255,0);
    }
    if (key == '3')
    {
      fill(0,0,255);
    }
    
  }
  
}
 
class Enemy
{
  float x = 250;
  float y = 50;
  float w = 100;
  float h = 80;
  float speed = 4;
  Bullet bullet;
  

   
  Enemy()
  {
     enemy = requestImage("enemy.png");
  }
   
  void draw()
  {
    fill(255);
    for (int i =0; i < myship.bullets.length; i+=1)
    {
      if (myship.bullets[i].active == true)
      {
        float distanceToEnemy = dist(this.x, this.y, myship.bullets[i].x, myship.bullets[i].y);
      
        
      }
    }
    this.x += this.speed;
    if (this.x > width)
    {
      this.speed = -4;
    }
    if (this.x < 0)
    {
      this.speed = 4;
    }
     
     if (enemy.width > 0)
    {
      imageMode(CENTER);
      image(enemy, this.x, this.y, this.w, this.h);
    }
    
  }
   
}
 
Ship myship;
Enemy myenemy;

 



