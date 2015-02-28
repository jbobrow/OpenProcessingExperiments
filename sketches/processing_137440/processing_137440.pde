

class Player
{
  float x = 100;
  float y = 400;
  float w = 30;
  float h = 20;
  float leftspeed = 0.0;
  float rightspeed = 0.0;
  PImage img;
  
  Bullet[] bullets = new Bullet[10];
  int nextBullet = 0;
  
  Player()
  {
    for (int i =0; i < bullets.length; i+=1)
    {
      this.bullets[i] = new Bullet();
    }
    this.img = requestImage("diver.png");
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
    
    float distanceToBullet = dist(this.x, this.y, myboss.bullet.x, myboss.bullet.y);
    if (distanceToBullet < 15)
    {
      tint(255, 0, 0);
    }
    if (this.img.width > 0)
    {
      imageMode(CENTER);
      image(this.img, this.x, this.y, this.w, this.h);
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
  float w = 5;
  float h = 5;
  float speed = -10;
  PVector direction = new PVector(0, 1); 
  boolean active = false;
  
  void draw()
  {
    this.y += this.direction.y * this.speed;
    this.x += this.direction.x * this.speed;
    ellipse(this.x, this.y, this.w, this.h);
  }
}

class Boss
{
  float x = 100;
  float y = 25;
  float speed = 2;
  Bullet bullet;
  
  Boss()
  {
    this.bullet = new Bullet();
    this.bullet.speed = 10;
    this.bullet.x = this.x;
    this.bullet.y = this.y;
    this.bullet.h = 50;
  }
  
  void draw()
  {
    fill(255);
    for (int i =0; i < myplayer.bullets.length; i+=1)
    {
      if (myplayer.bullets[i].active == true)
      {
        float distanceToTriangle = dist(this.x, this.y, myplayer.bullets[i].x, myplayer.bullets[i].y);
        if (distanceToTriangle < 50)
        {
          fill(255, 0, 0);
        }
      }
    }
    this.x += this.speed;
    if (this.x > width)
    {
      this.speed = -2;
    }
    if (this.x < 0)
    {
      this.speed = 2;
    }
    
    triangle(this.x - 50, this.y + 25, this.x, this.y - 25, this.x + 50, this.y + 25);
    fill(255);
    
    this.bullet.draw();
    
    if (this.bullet.y > height)
    {
      this.bullet.y = this.y;
      this.bullet.x = this.x;
      
      PVector direction = new PVector(myplayer.x - this.x, myplayer.y - this.y);
      direction.normalize();
      this.bullet.direction = direction;
    }
  }
  
}

Player myplayer;
Boss myboss;

void setup()
{
  size(200, 500);
  
  myplayer = new Player();
  myboss = new Boss();
}

void draw()
{
  background(0);
   
  myplayer.draw();
  myboss.draw();
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      myplayer.leftspeed = -3;
    }
    if (keyCode == RIGHT)
    {
      myplayer.rightspeed = 3;
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      myplayer.leftspeed = 0;
    }
    if (keyCode == RIGHT)
    {
      myplayer.rightspeed = 0;
    }
  }
  if (key == ' ')
  {
    myplayer.bullets[myplayer.nextBullet].active = true;
    myplayer.bullets[myplayer.nextBullet].x = myplayer.x;
    myplayer.bullets[myplayer.nextBullet].y = myplayer.y;
    
    myplayer.nextBullet += 1;
    
    if (myplayer.nextBullet >= myplayer.bullets.length)
    {
      myplayer.nextBullet = 0;
    }
  }
}


