
PImage stars;
Void player;
Void zodiac;
Void enemy1;
Void enemy2;
Void item;
Void hazard;
SpriteObject explode;
float timer = 20;
int score = 0;
int gameState = 0;
int INTRO_STATE = 0;
int PLAY_STATE = 1;
int GAMEOVER_STATE = 2;
int WIN_STATE = 3;
float health = 100;
float MAX_HEALTH = 100;
float barWidth = 85;

void setup()
{
  size(700,700);
  stars = requestImage("Star-field.jpg");
  zodiac = new Void("Zodiac_Ophiuchus.jpg");
  zodiac.x = random(100, 650);
  zodiac.y = random(100, 650);
  zodiac.s = 0.4;
  enemy1 = new Void("enemy1.jpg");
  enemy1.x = random(100, 650);
  enemy1.y = random(100, 650);
  enemy1.s = 0.5;
  enemy2 = new Void("enemy2.jpg");
  enemy2.x = random(100, 650);
  enemy2.y = random(100, 650);
  item = new Void("item.jpg");
  item.x = random(100, 650);
  item.y = random(100, 650);
  hazard = new Void("Spiked_Metal_Ball.jpg");
  hazard.x = random(650, 650);
  hazard.y = random(650, 650);
  hazard.s = 0.3;
  explode = new SpriteObject("explosions.jpg");
  player = new Void("black_hole.jpg");
  player.s = 0.5; 
}
void draw()
{ 
  if(stars.width > 0)
  {
   imageMode(CORNER);
   image(stars, 0, 0, width*2, height*2);
  }
  
  if (gameState == INTRO_STATE)
  {
   background(0,27,255);
   textSize(25);
   text("Welcome to Void Catcher!", 10, 50);
   text("Your goal is to collect as many objects as possible", 10, 150);
   text("before time runs out.", 10, 200);
   text("Drag your mouse to lead the Void to the objects.", 10, 250);
   text("When your time is up, your score will be shown.", 10, 350);
   text("If you get hit by the spiked balls enough times,", 10, 450);
   text("it's game over.", 10, 500);
   text("Good Luck and Happy Gaming!", 10, 600);
   text("Click the left mouse button to continue.", 10, 650);
   if (mousePressed && (mouseButton == LEFT)) 
   {
     gameState = PLAY_STATE;
   }
  }
  
  if (gameState == PLAY_STATE)
  {
    timer -= 0.0167;
    if(health<0)
    {
      health = 0;
    }
    if(health>MAX_HEALTH)
    {
      health = MAX_HEALTH;
    }
    noStroke();
    if (health < 25)
    {
      fill(255,0,0);
    }
    else if (health < 50)
    {
      fill(255,200,0);
    }
    else
    {
      fill(0,255,0);
    }
    float healthWidth = (health/MAX_HEALTH) * barWidth;
    rect(600,20,healthWidth,10);
    stroke(0);
    noFill();
    rect(400,20,barWidth,10);
    
    textSize(20);
    fill(224, 255, 0);
    text("Time: " + timer, 40, 50);
    
    player.targetX = mouseX;
    player.targetY = mouseY;
    player.render();
    player.update();
    
    zodiac.targetX = player.x;
    zodiac.targetY = player.y;
    zodiac.render();
    zodiac.update();
    
    enemy1.targetX = player.x;
    enemy1.targetY = player.y;
    enemy1.render();
    enemy1.update();
    
    enemy2.targetX = player.x;
    enemy2.targetY = player.y;
    enemy2.render();
    enemy2.update();
    
    item.targetX = player.x;
    item.targetY = player.y;
    item.render();
    item.update();
    
    hazard.targetX = player.x;
    hazard.targetY = player.y;
    hazard.render();
    hazard.update();
    
    if (enemy2.isOverlapping(player) == true)
    {
      score += 1;
      enemy2.x = random(200, 650);
      enemy2.y = random(200, 650);
    }
    if (enemy1.isOverlapping(player) == true)
    {
      score += 3;
      enemy1.x = random(10, 150);
      enemy1.y = random(10, 150);
    }
    if (zodiac.isOverlapping(player) == true)
    {
      score += 20;
      zodiac.x = random(150, 650);
      zodiac.y = random(150, 650);
    }
    if (item.isOverlapping(player) == true)
    {
      score += 15;
      item.x = random(30, 150);
      item.y = random(30, 150);
    }
    if (hazard.isOverlapping(player) == true)
    {
      health -= 20;
      hazard.x = random(650, 650);
      hazard.y = random(650, 650);
    }
    
    
    if (enemy2.isOverlapping(enemy1) == true)
    {
      enemy2.x = random(200, 650);
      enemy2.y = random(200, 650);
    }
    if (enemy2.isOverlapping(item) == true)
    {
      enemy2.x = random(200, 650);
      enemy2.y = random(200, 650);
    }
    if (enemy2.isOverlapping(zodiac) == true)
    {
      enemy2.x = random(200, 650);
      enemy2.y = random(200, 650);
    }
    if (enemy1.isOverlapping(enemy2) == true)
    {
      enemy1.x = random(10, 150);
      enemy1.y = random(10, 150);
    }
    if (enemy1.isOverlapping(item) == true)
    {
      enemy1.x = random(10, 150);
      enemy1.y = random(10, 150);
    }
    if (enemy1.isOverlapping(zodiac) == true)
    {
      enemy1.x = random(10, 150);
      enemy1.y = random(10, 150);
    }
    if (zodiac.isOverlapping(enemy1) == true)
    {
      zodiac.x = random(150, 650);
      zodiac.y = random(150, 650);
    }
    if (zodiac.isOverlapping(enemy2) == true)
    {
      zodiac.x = random(150, 650);
      zodiac.y = random(150, 650);
    }
    if (zodiac.isOverlapping(item) == true)
    {
      zodiac.x = random(150, 650);
      zodiac.y = random(150, 650);
    }
    if (item.isOverlapping(enemy2) == true)
    {
      item.x = random(30, 150);
      item.y = random(30, 150);
    }
    if (item.isOverlapping(enemy1) == true)
    {
      item.x = random(30, 150);
      item.y = random(30, 150);
    }
    if (item.isOverlapping(zodiac) == true)
    {
      item.x = random(30, 150);
      item.y = random(30, 150);
    }

    
    if (timer < 0 && health != 0)
    {
      score += 0;
      gameState = WIN_STATE;
    }
    if (health == 0)
    {
      score += 0;
      gameState = GAMEOVER_STATE;
    }
  }
  
  if (score < 0)
  {
    score = 0;
  }
  
  if (gameState == WIN_STATE)
  {
    background(255);
    fill(0, 255, 0);
    textSize(65);
    text("You Win!", 100, 250);
    text("Your score: " + score, 100, 350);
  }
  if (gameState == GAMEOVER_STATE)
  {
   background(255,0,0);
   fill(0);
   textSize(35);
   text("Game Over, Yeah!!!", 100, 250);
   text("Your score: " + score, 100, 350);
  }
}

class Void extends SpriteObject
{
  float targetX;
  float targetY;
  color newColor;
  float easing = 0.02;

  Void(String filename)
  {
    super(filename);
  }
  
  void update()
  {
    //player.targetX = mouseX;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {
      x += dx * easing;
    }
    //player.targetY = mouseY;
    float dy = targetY - y;
    if(abs(dy) > 1) 
    {
      y += dy * easing;
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
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
  
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - ( this.w * 0.5 * this.s);
    float right = this.x + ( this.w * 0.5 * this.s);
    float top = this.y - ( this.h * 0.5 * this.s);
    float bottom = this.y + ( this.h * 0.5 * this.s);
    
    float otherLeft = other.x - ( other.w * 0.5 * other.s);
    float otherRight = other.x + ( other.w * 0.5 * other.s);
    float otherTop = other.y - ( other.h * 0.5 * other.s);
    float otherBottom = other.y + ( other.h * 0.5 * other.s);
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      //this.speed += 2;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      //this.speed -= 2;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      //this.s = 0.5;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      //this.s = 2;
    }
     
    this.y += directionY * speed * random(0.1, 5);
    this.x += directionX * speed * random(0, 5);
    
     
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



