
PImage ship;
PImage enemy;
PImage background;
PImage menu;
PImage winpic;
PImage losepic;

float timer = 30;
int gamestate = 0; 
int MENU_STATE = 0;
int PLAY_STATE = 1;
int WIN_STATE = 2;
int LOSE_STATE = 3;
int clicker = 0;
boolean enemyHit = false;

Ship myship;
Enemy myenemy;

void setup()
{
  size(500, 500);
  background = requestImage("background.jpg");
  winpic = requestImage("winpic.png");
  losepic = requestImage("losepic.jpg");
  menu = requestImage("menu.jpg");
   
  myship = new Ship();
  myenemy = new Enemy();  
}
 
void draw()
{
  if(gamestate == MENU_STATE)
  {
    background(0);
    image(menu, 0, 0, width, height);
    
    if(mousePressed == true)
    {
      clicker += 1;
    }
    
    if (clicker == 1)
    {
      gamestate = PLAY_STATE;
    }
  }
  if (gamestate == PLAY_STATE)
  {
  background(0);
  image(background, width, height);
  timer = timer - (1.0/30.0);
  myship.draw();
  myenemy.draw();
  
  fill(255);
  text("Timer: " + (int)timer, 30, 120);
  
  if (timer <= 20)
  {
    myenemy.draw();
  }
  
  if(timer <= 10)
  {
    myenemy.draw();
  }
  
  } 
  if(myenemy.hp <= 0 && timer <= 0)
  
  {
    gamestate = LOSE_STATE;
    image(losepic, 250, 250, width, height);
  }
  else if(myenemy.hp <= 0 && timer < 30)
  {
    gamestate = WIN_STATE;
    image(winpic,250,250,width,height);
  }
  if(myship.hp <= 0)
  {
    gamestate = LOSE_STATE;
    image(losepic, 250, 250, width, height);
  }
  if (myship.hp < 45)
  {
    fill(255,0,0);
  }
  else if (myship.hp < 75)
  {
    fill(255,255,0);
  }
  else
  {
    fill(0,255,0);
  }
  //player hp
  noStroke();
  rect(10, 470, 80 * (myship.hp / 100), 20);
  
  noFill();
  stroke(255);
  rect(10, 470, 80, 20);
  
  fill(255);
  
  //enemy hp
  fill(0,255,0);
  rect(10, 10, 40 * (myenemy.hp / 100), 20);
  
  noFill();
  stroke(255);
  rect(10, 10, 40, 20);
  
  fill(255);
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
  float hp = 100;
     
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
     
    float distanceToBullet = dist(this.x, this.y, myenemy.bullet.x, myenemy.bullet.y);
    if (distanceToBullet < 15)
    {
      this.hp -=5;
      tint(255,0,0);
    }
   
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
  float hp = 100;

   
  Enemy()
  {
     this.bullet = new Bullet();
     this.bullet.speed = 7;
     this.bullet.x = this.x;
     this.bullet.y = this.y;
     this.bullet.h = 50;
     enemy = requestImage("enemy.png");
  }
   
  void draw()
  {
    fill(255,0,0);
    for (int i =0; i < myship.bullets.length; i+=1)
    {
      if (myship.bullets[i].active == true)
      {
        float distanceToEnemy = dist(this.x, this.y, myship.bullets[i].x, myship.bullets[i].y);
        if(distanceToEnemy < 50)
        {
          this.hp -= 1;
          enemyHit = true;
          tint(255, 0, 0);
        }    
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
    
    noTint();
    this.bullet.draw();
    
    if (this.bullet.y > height)
    {
      this.bullet.y = this.y;
      this.bullet.x = this.x;
      
      PVector direction = new PVector(myship.x - this.x, myship.y - this.y);
      direction.normalize();
      this.bullet.direction = direction;
    }
  }   
}


