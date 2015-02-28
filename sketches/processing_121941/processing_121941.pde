
float speed = 1;
float leftKey = 0;
float rightKey = 0;
float upKey = 0;
float downKey = 0;
float timer = 0.0;
float playerSize = 10;
float health = 100;
float MAX_HEALTH = 100;
float barWidth = 200;
float timer2 = 20;

int fairyIndex = 0;
int fairyCount = 10;
int cloudCount = 25;
int enemyCount = 8;

int gameState = 0;
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;

//Surprise[] f = new Surprise[fairyCount];
Cloud[] cloud = new Cloud[cloudCount];
Enemy[] enemy = new Enemy[enemyCount];

Player tingle;
//Surprise fairy;
PImage evil;
PImage fountain;
SpriteObject fairy;
SpriteObject fairy2;
SpriteObject fairy3;
SpriteObject fairy4;
SpriteObject fairy5;
SpriteObject fairy6;
SpriteObject fairy7;
SpriteObject fairy8;
SpriteObject fairy9;
SpriteObject fairy10;

int numBalls = 24;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
boolean drawBalls = false;

float angle = 0.0;
float radius = 250.0;
float sx = 3.0;
float sy = 1.0;
float sinval = sin(angle);
float cosval = cos(angle);
float x2 = 20 + (cosval*radius);
float y2 = 300 + (sinval*radius);
float speed2 = 0.03;

float angle2 = 0.0;
float speed3 = 0.05;
float radius2 = 400.0; //originally 250
float sx2 = 1.0;
float sy2 = 1.5; //originally 0.5
float sinval2 = sin(angle2);
float cosval2 = cos(angle2);
float n = 230 + (cosval2 * radius2); //originally 300
float m = 350 + (sinval2 * radius2);
float d = 10 + (cosval2 * radius2);
float sx3 = 1.5;
float sy3 = 1.0;
float x3 = 400 + (cosval*radius);
float y3 = 300 + (sinval*radius);

float t = 1.5;
float p = 50;
float speed4 = 5;
float p2 = 0;
float speed5 = 4;
float p3 = 800;
float speed6 = 6;
float p4 = 1000;
float p5 = 0;
float speed7 = 8;

var audio1 = new Audio("clock_town.mp3");

void setup()
{
  size(900,700);
  fairy = new SpriteObject("fairy.png");
  fairy.w = playerSize*7;
  fairy.h = playerSize*11;
  
  fairy2 = new SpriteObject("fairy.png");
  fairy2.w = playerSize*7;
  fairy2.h = playerSize*11;
  
  fairy3 = new SpriteObject("fairy.png");
  fairy3.w = playerSize*7;
  fairy3.h = playerSize*11;
  
  fairy4 = new SpriteObject("fairy.png");
  fairy4.w = playerSize*7;
  fairy4.h = playerSize*11;
  
  fairy5 = new SpriteObject("fairy.png");
  fairy5.w = playerSize*7;
  fairy5.h = playerSize*11;
  
  fairy6 = new SpriteObject("fairy.png");
  fairy6.w = playerSize*7;
  fairy6.h = playerSize*11;
  
  fairy7 = new SpriteObject("fairy.png");
  fairy7.w = playerSize*7;
  fairy7.h = playerSize*11;
  
  fairy8 = new SpriteObject("fairy.png");
  fairy8.w = playerSize*7;
  fairy8.h = playerSize*11;
  
  fairy9 = new SpriteObject("fairy.png");
  fairy9.w = playerSize*7;
  fairy9.h = playerSize*11;
  
  fairy10 = new SpriteObject("fairy.png");
  fairy10.w = playerSize*7;
  fairy10.h = playerSize*11;
  
  evil = requestImage("kargarok.png");
  fountain = requestImage("fairy_fountain.jpg");
  tingle = new Player("tingle_balloon.png");
  tingle.x = 700;
  tingle.y = 250;
  tingle.w = playerSize*8;
  tingle.h = playerSize*13;
  tingle.speed = 5;
  
  /*for(int i = 0; i < fairyCount; i += 1)
  {
    f[i] = new Surprise("fairy.png");
    f[i].x = -1000;
    f[i].y = -1000;
    f[i].w = playerSize*6;
    f[i].h = playerSize*11;
  }*/
  
  for(int i = 0; i < cloudCount; i += 1)
  {
    cloud[i] = new Cloud("cloud.png");
    cloud[i].x = random(width);
    cloud[i].y = random(height);
    cloud[i].directionX = 1;
    cloud[i].speed = random(1,5);
    cloud[i].scaleX = random(0.15,0.35);
    cloud[i].scaleY = cloud[i].scaleX;
  }
  
  for(int i = 0; i < enemyCount; i += 1)
  {
    enemy[i] = new Enemy("ww_enemy.png");
    enemy[i].x = -400;
    enemy[i].y = random(100,650);
    enemy[i].directionX = 1;
    enemy[i].speed = random(4,7);
    enemy[i].scaleX = 0.25;
    enemy[i].scaleY = 0.25;
  }
  
 
}

void draw()
{
  if (tingle.hitTimer > .4) //originally .8
  {
    background(255, 0, 0);
  }
  else
  {
    background(#7AB7E8);
  }
  timer = timer + 0.0167;
  timer2 -= 0.0167;
  angle += speed2;
  angle2 += speed3;
  p += speed4;
  p2 += speed5;
  p3 -= speed6;
  p4 -= speed5;
  p5 += speed7;
  
  if(gameState == PLAY_STATE)
  {
    if(audio1.paused == true)
    {
      audio1.load();
      audio1.play();
    }
    
    for(int i = 0; i < cloudCount; i += 1)
    {
      cloud[i].update();
      cloud[i].render();
    }
    
    tingle.hitTimer -= 0.0167;
    for(int i = 0; i < enemyCount; i += 1)
    {
      enemy[i].update();
      enemy[i].render();
    }
    
    tingle.update();
    tingle.render();
    
    /*for(int i = 0; i < fairyCount; i += 1)
    {
      f[i].update();
      f[i].render();
    }*/
    
    if (drawBalls == true)
    {
      for(int g = 0; g < numBalls; g ++)
      {
        balls[g].collide();
        balls[g].move();
        balls[g].display();
      }
    }
    
    if(health < 0)
    {
      health = 0;
    }
    noStroke();
    if(health < 40)
    {
      fill(255,0,0);
    }
    else if(health < 70)
    {
      fill(255,200,0);
    }
    else
    {
      fill(0,255,0);
    }
    float healthWidth = (health/MAX_HEALTH) * barWidth;
    rect(600,600, healthWidth,25);
    stroke(0);
    noFill();
    rect(600,600,barWidth, 25);
    
    textSize(40);
    fill(0);
    text("TIME: " + (int)timer2,700,100);
    
    if(timer2 < 17 && timer2 > 14)
    {
      textSize(100);
      fill(0);
      text("KEEP IT UP!",30,650);
    }
    if(timer2 < 13 && timer2 > 10)
    {
      textSize(80);
      fill(0);
      text("YOU GOT IT!",30,650);
    }
    if(timer2 < 9 && timer2 > 7)
    {
      textSize(75);
      fill(0);
      text("DON'T GIVE UP!", 20, 650);
    }
    if(timer2 < 6 && timer2 > 3)
    {
      textSize(70);
      fill(0);
      text("ALMOST THERE!",30,650);
    }
    
    if(health <= 0 == true)
    {
      gameState = GAMEOVER_STATE;
    }
    
    if(timer2 < 0)
    {
      if(health > 0)
      {
        gameState = WIN_STATE;
      }
    }
  }
  if(gameState == WIN_STATE)
  {
    //background(#EFF557);
    if(fountain.width > 0)
    {
      imageMode(CORNER);
      image(fountain,0,0,width,height);
    }
    textSize(70);
    fill(0,255,0);
    text("CONGRATULATIONS!",100,390);
    
    fairy.x = x2 + cos(angle*sx)*radius/2;
    fairy.y = y2 + sin(angle*sy)*radius/2;
    fairy.render();
    
    fairy2.x = n + cos(angle * sx2) * radius2/2;
    fairy2.y = m + sin(angle * sy2) * radius2/2;
    fairy2.render();
    
    fairy3.x = d + cos(angle * sx2) * radius2/2;
    fairy3.y = m + sin(angle * sx2) * radius2/2;
    fairy3.render();
    
    fairy4.x = d + cos(angle * t) * radius2/2;
    fairy4.y = m + sin(angle * sx2) * radius2/2;
    fairy4.render();
    
    fairy5.x = 800;
    fairy5.y = p;
    fairy5.render();
    if(p > height + (playerSize*11))
    {
      p = -(playerSize*11);
    }
    fairy6.x = p2;
    fairy6.y = 600;
    fairy6.render();
    if(p2 > width + (playerSize*7))
    {
      p2 = -(playerSize*7);
    }
    fairy7.x = 100;
    fairy7.y = p3;
    fairy7.render();
    if(p3 < 0 - (playerSize*11))
    {
      p3 = height + (playerSize*11);
    }
    fairy8.x = p4;
    fairy8.y = 100;
    fairy8.render();
    if(p4 < 0 - (playerSize*7))
    {
      p4 = width + (playerSize*7);
    }
    fairy9.x = x3 + cos(angle*sx3)*radius/2;
    fairy9.y = y3 + sin(angle*sy3)*radius/2;
    fairy9.render();
    
    fairy10.x = 450;
    fairy10.y = p5;
    fairy10.render();
    if(p5 > height + (playerSize*11))
    {
      p5 = -(playerSize*11);
    }
  }
  if(gameState == GAMEOVER_STATE)
  {
    background(0);
    for(int g = 0; g < numBalls; g++)
    {
      balls[g] = new Ball(random(width),random(height),random(30,70),g,balls);
    }
    noStroke();
    fill(#E8A11C);
    for(int g = 0; g < numBalls; g ++)
    {
      balls[g].collide();
      balls[g].move();
      balls[g].display();
    }
    textSize(100);
    fill(#FFFFFF);
    text("CONTINUE ?",170,390);
  }
}

void keyReleased()
{
  /*if(key == ' ')
  {
    gameState = WIN_STATE;
  }
  if(key == ' ')
  {
    f[fairyIndex].x = tingle.x;
    f[fairyIndex].y = tingle.y;
    f[fairyIndex].speed = 5;
    f[fairyIndex].directionX = -1;
    fairyIndex += 1;
    if(fairyIndex >= fairyCount)
    {
      fairyIndex = 0;
    }
  }*/
  
  if(keyCode == LEFT)
  {
    leftKey = 0;
  }
  if(keyCode == RIGHT)
  {
    rightKey = 0;
  }
  if(keyCode == UP)
  {
    upKey = 0;
  }
  if(keyCode == DOWN)
  {
    downKey = 0;
  }
}

void keyPressed()
{
  if(keyCode == LEFT)
  {
    leftKey = 1;
  }
  if(keyCode == RIGHT)
  {
    rightKey = 1;
  }
  if(keyCode == UP)
  {
    upKey = 1;
  }
  if(keyCode == DOWN)
  {
    downKey = 1;
  }
  if(key == 't' )
  {
    if (drawBalls == false)
    {
      drawBalls = true;
    }
    else
    {
      drawBalls = false;
    }
  }
}

class Ball 
{
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) 
  {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() 
  {
    for (int i = id + 1; i < numBalls; i++) 
    {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) 
      { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() 
  {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) 
    {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) 
    {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) 
    {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) 
    {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() 
  {
    ellipse(x, y, diameter, diameter);
  }
}

/*class Surprise extends SpriteObject
{
  Surprise(String filename)
  {
    super(filename);
  }
  void update()
  {
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}*/

class Player extends SpriteObject
{
  float hitTimer = 0;
  Player(String filename)
  {
    super(filename);
  }
  void update()
  {
    this.directionX = rightKey - leftKey;
    this.x += this.directionX * this.speed;
    this.directionY = downKey - upKey;
    this.y += this.directionY * this.speed;
    
    if(x > width - w * 0.5)
    {
      x = width - w * 0.5;
    }
    if(x < 0 + w * 0.5)
    {
      x = w * 0.5;
    }
    if(y > height - h * 0.5)
    {
      y = height - h * 0.5;
    }
    if(y < 0 + h * 0.5)
    {
      y = h * 0.5;
    }
  }
  
  void render()
  {
    if (hitTimer > 0)
    {
      tint(255, 0, 0);
    }
    else
    {
      noTint();
    }
    super.render();
    noTint();
    /*else
    {
      tint(255, 255, 255);
    }
    super.render();
    tint(255, 255, 255);*/
  }
}

class Enemy extends Cloud
{
  boolean hitTingle = false;
  Enemy(String filename)
  {
    super(filename);
  }
  
  void update()
  {
     this.y += directionY * speed;
     this.x += directionX * speed;
    
      if(x > width + w * 0.5)
      {
        x = 0 - w * 0.5;
        y = random(height);
        
        hitTingle = false;
      }
      
      if (x < 0)
      {
        for(int i = 0; i < enemyCount; i += 1)
        {
          if (enemy[i] != this && isOverlapping(enemy[i]) == true)
          {
            enemy[i].x = random(-600,-200);
            enemy[i].y = random(100,650);
            
          }
        }
      }

     if (hitTingle == false && isOverlapping(tingle) == true)
     {
       tingle.hitTimer = 0.5; //originally 1
       hitTingle = true;
       health -= 10;
       //println(health);
      if (health <= 30)
      {
        for(int i = 0; i < enemyCount; i += 1)
        {
          enemy[i].img = evil;
          enemy[i].loaded = false;
        }
      }
     }
  }
}

class Cloud extends SpriteObject
{
  Cloud(String filename)
  {
    super(filename);
  }
  
  void update()
  {
     this.y += directionY * speed;
     this.x += directionX * speed;
    
    if(x > width + w * 0.5)
    {
      x = 0 - w * 0.5;
      y = random(height);
    }
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
  float scaleX = 1.0;
  float scaleY = 1.0;
  PImage img;
  boolean loaded = false;
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
      
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.scaleX))
      && mouseX < (this.x + (this.w * 0.5 * this.scaleX))
      && mouseY > (this.y - (this.h * 0.5 * this.scaleY))
      && mouseY < (this.y + (this.h * 0.5 * this.scaleY)))
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
    float left = this.x - (this.w * 0.5 * this.scaleX);
    float right = this.x + (this.w * 0.5 * this.scaleX);
    float top = this.y - (this.h * 0.5 * this.scaleY);
    float bottom = this.y + (this.h * 0.5 * this.scaleY);
         
    float otherLeft = other.x - (other.w * 0.5 * other.scaleX);
    float otherRight = other.x + (other.w * 0.5 * other.scaleX);
    float otherTop = other.y - (other.h * 0.5 * other.scaleY);
    float otherBottom = other.y + (other.h * 0.5 * other.scaleY);
         
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  void update()
  {
    if (this.x > width - (this.w * this.scaleX * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.scaleX * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.scaleY * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.scaleY * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.scaleY * 0.5);
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
      scale(this.scaleX, this.scaleY);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}


