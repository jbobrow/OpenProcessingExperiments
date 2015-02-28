
Player ship;
int bulletCount = 10;
int bulletCountr = 10;
Bullet[] b = new Bullet[bulletCount];
Bullet[] r = new Bullet[bulletCountr];
Bullet green;
Bullet red;
int bulletIndex = 0;
float speed = 1;
float x = 0;
float leftKey = 0;
float rightKey = 0;
float timer = 0;
SpriteObject boss;
var audio1 = new Audio("laser.mp3");
var audio2 = new Audio("theme.mp3");
var audio3 = new Audio("finalboss.mp3");
var audio4 = new Audio("laugh.mp3");
var audio5 = new Audio("win.mp3");

float health = 100;
float Max = 100;
float rectWidth = 200;

float health2 = 100;
float Max2 = 100;
float rectWidth2 = 200;

SpriteObject bad;
SpriteObject good;
boolean hit = false; 
PImage background;
int gameState = 1;
int playState = 0;
int winState = 2;
int loseState = 3;
PImage title;
PImage youlose;
PImage youwin;

void setup()
{
  size(600, 600);

  background = requestImage("background.png");
  title = requestImage("title.jpg");
  youwin = requestImage("youwin.jpg");
  youlose = requestImage("youlose.jpg");
  
  boss = new SpriteObject("boss.png");
  boss.speed = 1;
  boss.directionY = 0;
  boss.directionX = (1);
  boss.x = 50;
  boss.y = 10;
  boss.s = .5;
  
  ship = new Player("ship.png");
  ship.x = 250;
  ship.y = 500;
  ship.s = .1;
  ship.speed = 5;
  
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("green.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.3;
  }
  
    for (int i = 0; i < bulletCountr; i += 1)
  {
    r[i] = new Bullet("red.png");
    r[i].x = -1000;
    r[i].y = -1000;
    r[i].s = 0.3;
  }
  
  good = new SpriteObject("ship.jpg");
  good.x = ship.x;
  good.y = ship.y;
  
  bad = new SpriteObject("boss.jpg");
  bad.x = boss.x;
  bad.y = boss.y;
  
  smooth();
}

void draw()
{
  if (playState == 0)
  {
    if (title.width > 0)
    {
     image(title, 0, 0, 1200, 1200);
    }
    textSize(30);
    text("THE FINAL FIGHT", 175, 50);
    text("LEFT ARROW: MOVE LEFT", 105, 200);
    text("RIGHT ARROW: MOVE RIGHT", 80, 250);
    text("SPACEBAR: SHOOT", 140, 300);
    text("PRESS ENTER TO PLAY", 150, 550);
    {
    audio2.play();
    }
  }
  
  if (gameState == playState)
  {
    if (ship.x > 580)
    {
      ship.x = 580;
    }
    if (ship.x < 20)
    {
      ship.x = 20;
    }
    {
    audio2.pause();
    }
    {
    audio3.play();
    }
    
    pushMatrix();
    if (background.width > 0)
    {
     image(background, width / 2, height / 2, width, height);
    }
    popMatrix();
    
    textSize(20);
    text("Player 1", 135, 540);
  
    textSize(20);
    text("Boss", 450, 540);
 
    for (int i = 0; i < bulletCount; i += 1)
    {
      b[i].update();
      b[i].render();
    }
  
      for (int i = 0; i < bulletCount; i += 1)
    {
      r[i].update();
      r[i].render();
    }
  
    if (health < 25)
    {
      fill(255, 0, 0);
    } 
    else if (health < 50)
    {
      fill(255, 200, 0);
    }
    else
    {
      fill(0, 255, 0);
    }
  
    noStroke();
    float drawWidth = (health / Max) * rectWidth;
    rect(75, 550, drawWidth, 25);
  
    stroke(0);
    noFill();
    rect(75, 550, rectWidth, 25);
  
  
    if (health2 < 25)
    {
      fill(255, 0, 0);
    } 
    else if (health2 < 50)
    {
      fill(255, 200, 0);
    }
    else
    {
      fill(0, 255, 0);
    }
  
    noStroke();
    float drawWidth2 = (health2 / Max2) * rectWidth2;
    rect(375, 550, drawWidth2, 25);
  
    stroke(0);
    noFill();
    rect(375, 550, rectWidth2, 25);
  
    if (health == 0)
      {
        gameState = loseState;
      }
    
    if (health2 == 0)
      {
        gameState = winState;
      }
      
    ship.render();
    ship.update();
    boss.render();
    boss.update();
    
    if (gameState == winState)
    {
      if (youwin.width > 0)
      {
        audio3.pause();
        audio5.play();
       image(youwin, width / 2, height / 2, width, height);
      } 
    }
    if (gameState == loseState)
    {
      if (youlose.width > 0)
      {
        audio3.pause();
        audio4.play();
        image(youlose, width / 2, height / 2, width, height);
      }
    }
  }

    
    if (boss.isOverlapping(b[1]) == true)
    {
      health2 -= 0.5;
     }
    if (ship.isOverlapping(r[1]) == true)
    {
     health -= 1;
    }
}


void keyReleased()
{
  if (key == ' ')
  {
    b[bulletIndex].x = ship.x + 25;
    b[bulletIndex].y = ship.y - 10;
    b[bulletIndex].speed = 10;
    b[bulletIndex].directionY = -1;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
    
    r[bulletIndex].x = boss.x + 25;
    r[bulletIndex].y = boss.y - 10;
    r[bulletIndex].speed = 10;
    r[bulletIndex].directionY = +1;
    bulletIndex += 1;
    if (bulletIndex >= bulletCountr)
    {
      bulletIndex = 0;
    }
    
    r[bulletIndex].x = boss.x - 40;
    r[bulletIndex].y = boss.y - 10;
    r[bulletIndex].speed = 10;
    r[bulletIndex].directionY = +1;
    bulletIndex += 1;
    if (bulletIndex >= bulletCountr)
    {
      bulletIndex = 0;
    }
    {
    audio1.play();
    }
  }
   
  if (keyCode == LEFT)
  {
    leftKey = 0;
  }
  if (keyCode == RIGHT)
  {
    rightKey = 0;
  }
    if (keyCode == ENTER)
  {
    playState = 1;
  }
}
 
void keyPressed()
{
  if (keyCode == LEFT)
  {
    leftKey = 1;
  }
  if (keyCode == RIGHT)
  {
    rightKey = 1;
  }
}

class Bullet extends SpriteObject
{
  Bullet(String filename)
  {
    super(filename);
  }
   
  void update()
  {
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}

class Player extends SpriteObject
{
  Player(String filename)
  {
    super(filename);
  }
   
  void update()
  {
    this.directionX = rightKey - leftKey;
    this.x += this.directionX * this.speed;
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
      
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
     
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
     
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
        
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);
        
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
       
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
  
    
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
        
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}


