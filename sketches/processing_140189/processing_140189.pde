
/* @pjs preload="bullet.png, grave.png, station.png, doomspiral.jpeg,explosion.png,player.png"; */

// Had to make a few changes to game premise, 
//wound up coding the whole thing on an android app and porting it.


//You are the brave king of the galaxy, facing off against the
//beast of the vortex, a mysterious monster that has appeared
//and threatens your kingdom.
// You must vanquish this foe using your mirror-bullets.

//I was interested in controlling bullets through player reactions,
//so I focused on altering the code to create difficult player
//conditions.

// Used code from class (http://www.openprocessing.org/sketch/139128)
//and took sprites from the interwebs 
//(sources available on request: you can also see this
// by looking at the file attributes.)
// Made sfx in Bfxr.
// Music by Rolemusic borrowed from freemusicarchive.org
//Song title "Sea Battles in Space"

//I decided to primarily use tints and sound for feedback 
//as the "shaking" was making me nauseous.
//



//sounds
var collisionsound = new Audio("collision.wav");
var movementsound = new Audio("movement.wav");
var hitsound = new Audio("hit.wav");
var deathsound = new Audio("deathsound.wav");
var landedsound = new Audio("landed.wav");
var musicsound = new Audio("SBiS.wav");



//playstates
int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;

//game attributes
float timer = 0.0;
float shotTimer = 0.5;
PImage doomspiral;
PImage station;
PImage grave;
AnimatedSprite explosion;

//payer attributes (played as universal)
float radius = 20;
float speed = 1;

//objective= collect ore
float myorescore =0.0;



//booleans for movement
boolean isLeftDown = false;
boolean isRightDown = false;
boolean isUpDown = false;
boolean isDownDown = false;
//booleans for rotation
boolean isFPressed = false;
boolean isSPressed = false;
//boolean for firing
boolean isSpacePressed = false;
boolean bossHit = false;




//CLASSES


//player class- MOVES FINE.
class Player
{
//player dimensions
 float x=350;
 float y=600;
 float w = 40;
 float h = 40;
//player attributes
 float speed = 3;
 float size = 40;
 float radius = 40;
 float hp = 100;
 //bounding vectors
 float leftspeed = 0.0;
 float rightspeed = 0.0;
 //rotation - NOT WORKING
 float rotation = 0.0;
 float directionX;
 float directionY;
 //player vectors
 PVector position= new PVector(0,0);
 PImage img;
 
  Bullet[] bullets = new Bullet[50];
  int nextBullet = 0;

 


Player()
 {
   for (int i =0; i < bullets.length; i+=1)
    {
      //bullets depend on player movement
      this.bullets[i] = new Bullet();
      this.bullets[i].x = this.x;
      this.bullets[i].y = this.y;
      this.bullets[i].h = 10;
    }
    

   this.img = requestImage("player.png");
 }
// void update()
 
 
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
      hitsound.load();
      hitsound.play();
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
        PVector direction = new PVector(myboss.x - this.x, myboss.y - this.y);
        direction.normalize();
        this.bullets[i].direction = direction;
      }
    }

      
      imageMode(CORNER);
     

  }
}


class Bullet
{
  float x = 100;
  float y = 400;
  float w = 5;
  float h = 5;
  float directionX;
  float directionY;
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
  float x = 350;
  float y = 350;
  float hp = 100;
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
          collisionsound.load();
          collisionsound.play();
          this.hp -= 10;
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
      this.bullet.y = this.y;
      this.bullet.x = this.x;
       
      PVector direction = new PVector(myplayer.x - this.x, myplayer.y - this.y);
      direction.normalize();
      this.bullet.direction = direction;
    }
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


//drawing of items
Player myplayer = new Player(); 
Boss myboss = new Boss();


//game setup
void setup()
{
    size(700, 700);
    textSize(30);
    frameRate(30);
    println(timer);
    noStroke();
    myplayer.img = requestImage("player.png");
    doomspiral = requestImage("doomspiral.jpeg");
    station = requestImage("station.png");
    explosion = new AnimatedSprite("explosion.png", 64, 64);
}
 
 
 
 
 
 
 
//game draw terminal 
void draw()
{
 // musicsound.load();
  // musicsound.play();
   //LOSESTATE ACTIVE
  if (gamestate == LOSE_STATE)
    {
      deathsound.load();
      deathsound.play();
      background(#CD3333);
      textAlign(CENTER);
      text("Congratulations, you've doomed us all...", 0,350, width, 100);  
  }
    
  //WINSTATE ACTIVE
  if (gamestate == WIN_STATE)
    {
      background(#3333CD);
      image(station,0,0,width,height);
      textAlign(CENTER);
      text("Well done, you've defeated the vortex!", 0,350,width,100);
      text("The station is safe!", 0,400,width,100);
 
    }
    
   //PLAYSTATE ACTIVE
  if (gamestate == PLAY_STATE)
  { 
    if(myboss.hp <=0)
      {
        gamestate = WIN_STATE;
      }
    else if (myplayer.hp <= 0)
      {
        gamestate = LOSE_STATE;
      }
      
      else
      {
        if (isSpacePressed && shotTimer > 0.2)
          {
            shotTimer = 0;
          }
  //background image
      image(doomspiral,0,0,width,height);
  

  //timer
      timer = timer + (1.0/30.0);    
    
     
         
        myplayer.nextBullet += 1;
       
        if (myplayer.nextBullet >= myplayer.bullets.length)
          {
            myplayer.nextBullet = 0;
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
  if (bossHit == true)
      {
        landedsound.load();
      landedsound.play();
        explosion.setAnimation(0, 24, true);
 pushMatrix();
        translate(myboss.x, myboss.y);
        scale(random(1, 10));
        explosion.draw();
        popMatrix();
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


   
//playerkeys
  if (isRightDown == true)
    {
        myplayer.x += myplayer.speed;
    }
  if (isLeftDown == true)
    {
        myplayer.x -= myplayer.speed;
    }
  if (isDownDown == true)
    {
        myplayer.y += myplayer.speed;
    }
  if (isUpDown == true)
    {
      movementsound.load();
      movementsound.play();
        myplayer.y -= myplayer.speed;
        myplayer.speed=5;
    }
  if (isFPressed)
    {
      myplayer.rotation += 1;
    }
  if (isSPressed)
     {
      myplayer.rotation -= 1;
     }
   

    
//player goes here.
  myplayer.draw();
  myboss.draw();

  }
}








//key pressing/releasing
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = true;
    }
    if (keyCode == RIGHT)
    {
      isRightDown = true;
    }
    if (keyCode == UP)
    {
      isUpDown = true;
    }
    if (keyCode == DOWN)
    {
      isDownDown = true;
    }
  }
  if (key == 's')
  {
    isSPressed = true;
  }
  if (key == 'f')
  {
    isFPressed = true;
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = false;
    }
    if (keyCode == RIGHT)
    {
      isRightDown= false;
    }
    if (keyCode == UP)
    {
      isUpDown = false;
    }
    if (keyCode == DOWN)
    {
      isDownDown = false;
    }
  }
  if (key == 's')
  {
    isSPressed = false;
  }
  if (key == 'f')
  {
    isFPressed = false;
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



