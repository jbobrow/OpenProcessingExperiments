
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/137440*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
var laserSound = new Audio("Laser_Shoot14.wav");
var laserSound2 = new Audio("Laser_Shoot16.wav");
float screenShakeTimer = 0;
float shotTimer = 0.5;
boolean spaceKeyPressed = false;
boolean bossHit = false;
AnimatedSprite explosion;

class Player
{
  float x = 100;
  float y = 400;
  float w = 30;
  float h = 20;
  float leftspeed = 0.0;
  float rightspeed = 0.0;
  PImage img;
  float hp = 100;
  
  Bullet[] bullets = new Bullet[50];
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
      screenShakeTimer = .2;
  
      this.hp -= 10;
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
  float w = 25;
  float h = 50;
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
  float hp = 100;
  
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
          this.hp -= 1;
          screenShakeTimer = .5;
          bossHit = true;
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
      laserSound2.load();
      laserSound2.play();
      
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
  explosion = new AnimatedSprite("explosion.png", 64, 64);
}

void draw()
{
  background(0);

  if (myboss.hp <= 0)
  {
    fill(255);
    text("BOSS DEAD", 50, 250);
  }
  else if (myplayer.hp <= 0)
  {
    fill(255);
    text("ME DEAD", 50, 250);
  }
  else
  {
    
    if (spaceKeyPressed && shotTimer > 0.2)
    {
      shotTimer = 0;
      laserSound.load();
      laserSound.play();
      
      
      fill(255, 255, 0);
      ellipse(myplayer.x,myplayer.y - 10, 20, 20); 
      
      myplayer.bullets[myplayer.nextBullet].active = true;
      myplayer.bullets[myplayer.nextBullet].x = myplayer.x;
      myplayer.bullets[myplayer.nextBullet].y = myplayer.y;
      myplayer.bullets[myplayer.nextBullet].direction = new PVector(random(-0.2, 0.2), 1);
      myplayer.bullets[myplayer.nextBullet].direction.normalize(); 
      
      myplayer.nextBullet += 1;
      
      if (myplayer.nextBullet >= myplayer.bullets.length)
      {
        myplayer.nextBullet = 0;
      }
    }
     
    myplayer.draw();
    myboss.draw();
    
    
    screenShakeTimer -= 1 / 30.0;
    shotTimer += 1 / 30.0;
    if (screenShakeTimer > 0)
    {
      float shakeAmount = random(-10, 10);
      
      if (bossHit == true)
      {
        explosion.setAnimation(0, 24, true);
        shakeAmount = random(-20, 20);
        
        pushMatrix();
        translate(myboss.x, myboss.y);
        scale(random(1, 10));
        explosion.draw();
        popMatrix();
      }
      
      PImage screenImage = get();
      imageMode(CORNER);
      image(screenImage, shakeAmount, shakeAmount);
    }
    else
    {
      bossHit = false;
    }
  }
  
  // color player hp bar based on health
  if (myplayer.hp < 45)
  {
    fill(255, 0, 0);
  }
  else if (myplayer.hp < 75)
  {
    fill(255, 255, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
  // player hp bar
  noStroke();
  rect(10, 470, 80 * (myplayer.hp / 100), 20);
  
  noFill();
  stroke(255);
  rect(10, 470, 80, 20);
  
  fill(255);
  
  // boss hp bar
  fill(0, 255, 0);
  rect(10, 10, 40 * (myboss.hp / 100), 20);
  
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
      myplayer.leftspeed = -3;
    }
    if (keyCode == RIGHT)
    {
      myplayer.rightspeed = 3;
    }
  }
  if (key == ' ')
  {
    spaceKeyPressed = true;
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
    spaceKeyPressed = false;
  }

}

class AnimatedSprite
{
  int frameRow;
  int frameColumn;
  int frameWidth;
  int frameHeight;
  int startFrame;
  int endFrame;
  float currentFrame;
  boolean loop = true;
  float frameSpeed = 12.0;
  PImage spriteSheet;
  PImage img;
   
  AnimatedSprite(String filename, int widthOfOneFrame, int heightOfOneFrame)
  {
    this.spriteSheet = requestImage(filename);
    this.frameWidth = widthOfOneFrame;
    this.frameHeight = heightOfOneFrame;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    if (start != this.startFrame || end != this.endFrame)
    {
      this.startFrame = start;
      this.endFrame = end;
      this.currentFrame = this.startFrame;
    } 
       
    this.loop = looping;
  }
   
  void draw()
  {
    if (this.spriteSheet.width <= 0)
    {
      return;
    }
     
    // Increment currentFrame by the frameRate related to current fps)
    this.currentFrame += (this.frameSpeed / frameRate);
    if ((int)this.currentFrame > this.endFrame)
    {
      if (this.loop == true)
      {
        this.currentFrame = this.startFrame;
      }
      else
      {
        this.currentFrame = this.endFrame;
      }
    }
     
    int colCount = this.spriteSheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.spriteSheet.get(
      this.frameColumn * this.frameWidth,
      this.frameRow * this.frameHeight,
      this.frameWidth,
      this.frameHeight);
       
    image(this.img, 0, 0, frameWidth, frameHeight);
  }
   
}
 



