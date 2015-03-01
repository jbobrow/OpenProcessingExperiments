
/* @pjs preload="back.jpg,Spaceship.png,cpu.png, title.jpg, win.png,lose.jpg, green.png, red.png"; */
Player ship;
int laserCount = 10;
int laserCountr = 10;
laser[] b = new laser[laserCount];
laser[] r = new laser[laserCountr];
laser green;
laser red;
int laserIndex = 0;
float speed = 1;
float x = 0;
float leftKey = 0;
float rightKey = 0;
float timer = 0;
SpriteObject cpu;
var audio1 = new Audio("laser.mp3");
var audio2 = new Audio("laugh.mp3");
var audio3 = new Audio("win.mp3");

float mana = 100;
float Max = 100;
float rectWidth = 200;

float mana2 = 100;
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
PImage lose;
PImage win;

void setup()
{
  size(600, 600);

  background = requestImage("back.jpg");
  title = requestImage("title.jpg");
  win = requestImage("win.png");
  lose = requestImage("lose.jpg");
  
  cpu = new SpriteObject("cpu.png");
  cpu.speed = 1;
  cpu.directionY = 0;
  cpu.directionX = (1);
  cpu.x = 50;
  cpu.y = 10;
  cpu.s = .5;
  
  ship = new Player("Spaceship.png");
  ship.x = 250;
  ship.y = 500;
  ship.s = .15;
  ship.speed = 5;
  
  for (int i = 0; i < laserCount; i += 1)
  {
    b[i] = new laser("green.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.3;
  }
  
    for (int i = 0; i < laserCountr; i += 1)
  {
    r[i] = new laser("red.png");
    r[i].x = -1000;
    r[i].y = -1000;
    r[i].s = 0.3;
  }
  
  good = new SpriteObject("Spaceship.png");
  good.x = ship.x;
  good.y = ship.y;
  
  bad = new SpriteObject("cpu.jpg");
  bad.x = cpu.x;
  bad.y = cpu.y;
  
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
    text("PREPARE FOR BATTLE", 130, 50);
    textSize(25);
    text("LEFT ARROW: MOVE LEFT", 145, 220);
    text("RIGHT ARROW: MOVE RIGHT", 120, 270);
    text("SPACEBAR: SHOOT", 180, 320);
    textSize(30);
    text("PRESS ENTER TO PLAY", 130, 550);
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
    
    pushMatrix();
    if (background.width > 0)
    {
     image(background, width / 2, height / 2, width, height);
    }
    popMatrix();
    
    textSize(20);
    text("Player", 135, 540);
  
    textSize(20);
    text("CPU", 450, 540);
 
    for (int i = 0; i < laserCount; i += 1)
    {
      b[i].update();
      b[i].render();
    }
  
      for (int i = 0; i < laserCount; i += 1)
    {
      r[i].update();
      r[i].render();
    }
  
    if (mana < 25)
    {
      fill(255, 0, 0);
    } 
    else if (mana < 50)
    {
      fill(255, 200, 0);
    }
    else
    {
      fill(0, 255, 0);
    }
  
    noStroke();
    float drawWidth = (mana / Max) * rectWidth;
    rect(75, 550, drawWidth, 25);
  
    stroke(0);
    noFill();
    rect(75, 550, rectWidth, 25);
  
  
    if (mana2 < 25)
    {
      fill(255, 0, 0);
    } 
    else if (mana2 < 50)
    {
      fill(255, 200, 0);
    }
    else
    {
      fill(0, 255, 0);
    }
  
    noStroke();
    float drawWidth2 = (mana2 / Max2) * rectWidth2;
    rect(375, 550, drawWidth2, 25);
  
    stroke(0);
    noFill();
    rect(375, 550, rectWidth2, 25);
  
    if (mana == 0)
      {
        gameState = loseState;
      }
    
    if (mana2 == 0)
      {
        gameState = winState;
      }
      
    ship.render();
    ship.update();
    cpu.render();
    cpu.update();
    
    if (gameState == winState)
    {
      if (win.width > 0)
      {
        audio3.play();
       image(win, width / 2, height / 2, width, height);
      } 
    }
    if (gameState == loseState)
    {
      if (lose.width > 0)
      {
        audio2.play();
        image(lose, width / 2, height / 2, width, height);
      }
    }
  }

    
    if (cpu.isOverlapping(b[1]) == true)
    {
      mana2 -= .5;
     }
    if (ship.isOverlapping(r[1]) == true)
    {
     mana -= 1;
    }
}


void keyReleased()
{
  if (key == ' ')
  {
    b[laserIndex].x = ship.x + 25;
    b[laserIndex].y = ship.y - 10;
    b[laserIndex].speed = 10;
    b[laserIndex].directionY = -1;
    laserIndex += 1;
    if (laserIndex >= laserCount)
    {
      laserIndex = 0;
    }
    
    r[laserIndex].x = cpu.x + 25;
    r[laserIndex].y = cpu.y - 10;
    r[laserIndex].speed = 10;
    r[laserIndex].directionY = +1;
    laserIndex += 1;
    if (laserIndex >= laserCountr)
    {
      laserIndex = 0;
    }
    
    r[laserIndex].x = cpu.x - 40;
    r[laserIndex].y = cpu.y - 10;
    r[laserIndex].speed = 10;
    r[laserIndex].directionY = +1;
    laserIndex += 1;
    if (laserIndex >= laserCountr)
    {
      laserIndex = 0;
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

class laser extends SpriteObject
{
  laser(String filename)
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



