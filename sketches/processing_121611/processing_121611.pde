
PImage background;
PImage start;
PImage end;
PImage win;
float timer = 20;

//HEALTH
float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 200;

float Sishealth = 100;
float SisMAX_HEALTH = 100;
float SisrectWidth = 500;

int gameState = 0;

Predator yoshi;
float s = 1;

//GAMESTATE
boolean PLAY_STATE;
boolean GAMEOVER_STATE;
boolean WIN_STATE;
boolean NEWGAME_STATE;
boolean PREGAME_STATE;


int bulletCount = 200;
Bullet[] b = new Bullet[bulletCount];
Bullet star;
int bulletIndex = 0;

float timer2 = 0;
float angle = 0;



//Start Game Code
class Predator extends SpriteObject
{
   
  Predator(String filename)
  {
    super(filename);
  }
   
  float targetX ;
  float targetY;
  float predX;
  float predY;
  float easing = 0.018;
   
 void update()
  
  
  {
    float targetX = daddy.x;
    float dx = targetX - predX;
    if (abs(dx) > 1)
    {
      predX += dx * easing;
    }
    
    float targetY = daddy.y;
    float dy = targetY - predY;
    if (abs(dy) > 1)
    {
      predY += dy * easing;
    }
      
    this.x = predX;
    this.y = predY;
 
     
  }
   
}
  


class MouseRotatingdaddy extends SpriteObject
{
  MouseRotatingdaddy(String filename)
  {
    super(filename);
  }
    
  void lookAt(float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
  }
    
  void update()
  {
    this.lookAt(mouseX, mouseY);
    this.x += (up - down) * this.directionX * this.speed;
    this.y += (up - down) * this.directionY * this.speed;
    this.x += (left - right) * this.directionX * this.speed;
    this.y += (left - right) * this.directionY * this.speed;
  }
}
   
MouseRotatingdaddy daddy;
float down = 0;
float up = 0;
float right = 0;
float left = 0;
  
class Rocket extends SpriteObject
{
  Rocket(String filename)
  {
    super(filename);
  }
     
  void update()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}
  
int rc = 150;
Rocket[] r = new Rocket[rc];
int ri = 0;
  
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

    
void setup()
{
  size(700, 700);
  textSize(25);
  background = requestImage("background.jpg");
  start = requestImage("bio.jpg");
  end = requestImage("dead.jpg");
  win = requestImage("live.jpg");
  daddy = new MouseRotatingdaddy("daddy.png");
  daddy.x = 300;
  daddy.y = 300;
  daddy.directionX = 1;
  daddy.directionY = 0;
  daddy.speed = 3;
  yoshi = new Predator("yoshi.gif");
  yoshi.y = 0;//random(750);
  yoshi.directionX = random(5);
  yoshi.directionY = random(10);
  yoshi.speed = 5;

     
  for (int i = 0; i < rc; i += 1)
  {
    r[i] = new Rocket("rocket.gif");
    r[i].s = .5;
    r[i].x = -1000;
    r[i].y = -1000;
     
  }
  
  //star = new Bullet("star.png");
  //star.s = 0.25;
  //star.x = -1000;
  //star.y = -1000;
   
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("troll.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 1.0;

  }
  PREGAME_STATE = true;
}
   
void draw()
{
   if (PREGAME_STATE ==true)
   {
     
 // background(#040A48);
     if (background.width>0)
  { 
    imageMode(CORNER);
    image(start,0,0,800,800);
    
  }
  textSize(25);
  text("SPACEBAR TO START",125,640);
  
  if (keyPressed == true)
  {
   if( key == ' ')
   {
     PLAY_STATE = true;
   }
  }
   }
  
  if (PLAY_STATE == true)
  {
    
      if (background.width>0)
  { 
    imageMode(CORNER);
    image(background,0,0,1000,1000);
    
  }
    // count timer down
    timer -= 0.0167;
    timer2 += 0.0167;

   
    // game ends after 10 seconds
    if (timer < 0)
    {
      timer = 0;
    }
  pushMatrix();
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
   
  // Draw bar
  noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidth = (health / MAX_HEALTH) * rectWidth;
  rect(475, 25, drawWidth, 30);
   
  // Outline
  stroke(0);
  noFill();
  rect(475, 25, rectWidth, 30);
  popMatrix();
  
  // Change color
  if (Sishealth < 25)
  {
    fill(random(255));
  } 
  else if (Sishealth < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(255,0, 0);
  }
   
  // Draw bar
  noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float SisdrawWidth = (Sishealth / SisMAX_HEALTH) * SisrectWidth;
  rect(75,625, SisdrawWidth, 30);
   
  // Outline
  stroke(0);
  noFill();
  rect(75, 625, SisrectWidth, 30);

  
  daddy.update();
  daddy.render();
  
  yoshi.update();
  yoshi.render();


    
  for (int i = 0; i < rc; i += 1)
  {
    
    r[i].update();
    r[i].render();
    
    if (Sishealth > 0 && r[i].isOverlapping(yoshi, 20, 20) == true)
    {
      Sishealth -= .3;
      
    }
    
    if(r[i].isOverlapping(yoshi,0,0) && r[i].destroyed == false)
    {
      r[i].destroyed = true;
    }
    
  }
    fill(255);
    text("TIME: " + (int)timer, 0, 30);
    text("HEALTH", 475, 20);
    text(" Big", 75, 625);
    text(" Sister", 125, 625);
    
    
    
     if (timer2 > .1)
  {
    if (random(0, 1) < .25) // 25% chance
    {
      b[bulletIndex].x = yoshi.x;
      b[bulletIndex].y = yoshi.y;
      b[bulletIndex].speed = random(5);
      b[bulletIndex].directionY = daddy.directionY;// random(10);
      b[bulletIndex].directionX = daddy.directionX;//random(15);
      bulletIndex += 1;
      if (bulletIndex >= bulletCount)
      {
        bulletIndex = 0;
      }
    }
    timer2 = 0;
  }
   
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i].update();
    b[i].render();
    
    if(health > 0 && b[i].isOverlapping(daddy, 5, 5) == true)
    {
      health -= .8;
    }
    
      if(b[i].isOverlapping(daddy, 5, 5) && b[i].destroyed == false)
    {
      b[i].destroyed = true;
    }
  }
  
  if(timer < 1)
 {
   PLAY_STATE = false;
   GAMEOVER_STATE = true;
 }
 
 if (health < 1)
 {
   PLAY_STATE = false;
   GAMEOVER_STATE = true;
 }
 
  if (Sishealth < 1)
 {
   PLAY_STATE =false;
   WIN_STATE = true;
 }
  
 }
 
 
 
 if(WIN_STATE == true)
{
 
     if (background.width>0)
  {
    imageMode(CORNER);
    image(win,-100,-100, 1000,1000);
    
  }
  
  pushMatrix();
  textSize(60);
  text("You Defeated", 300,400);
  text("the Sister", 375, 475);
  fill(#18DEF2);
  popMatrix();
  
  pushMatrix();
  textSize(28);
  text ("Press R for Replay", 200,640);
  popMatrix();
 
}
 
 if (GAMEOVER_STATE == true)
 {
  //background(#C60202);
  //textSize(30);
  
     if (background.width>0)
  {
    imageMode(CORNER);
    image(end,-200,-200,1200,1200);
    
  }
  textSize(45);
  text("YOU LOST.",435,520);
  textSize(28);
  text ("Press R for Replay", 200,640);
  fill(255,0,0);
  }
  
   if (keyPressed == true)
  {
   if( key == 'r')
   {
     PREGAME_STATE = true;
     GAMEOVER_STATE = false;
     WIN_STATE =false;
     PLAY_STATE =false;
     timer = 20;
     timer2= 20;
     health = 100;
     Sishealth = 100;
     yoshi.x = 800;
     
   }
  }

}
  
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    r[ri].x = daddy.x;
    r[ri].y = daddy.y;
    r[ri].directionX = daddy.directionX;
    r[ri].directionY = daddy.directionY;
    r[ri].speed = 10;
    ri += 1;
    if (ri >= rc)
    {
      ri = 0;
    }
  }
}
   
void keyPressed()
{
    
    if (key == ' ')
    {
      up = 1;
    }
    
}
   
void keyReleased()
{
 
    if (key == ' ')
    {
      up = 0;
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
  boolean destroyed = false;
        
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
       
  boolean isOverlapping(SpriteObject other, float otherShrinkWidth, float otherShrinkHeight)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
          
    float otherLeft = other.x - (other.w * 0.5 * other.s) + otherShrinkWidth;
    float otherRight = other.x + (other.w * 0.5 * other.s) - otherShrinkWidth;
    float otherTop = other.y - (other.h * 0.5 * other.s) + otherShrinkHeight;
    float otherBottom = other.y + (other.h * 0.5 * other.s) - otherShrinkHeight;
          
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
          
    if (loaded && destroyed == false)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(0));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}








