
var audio1 =new Audio("Wark.mp3");
var audio2= new Audio("Tehurn.mp3");
var audio3= new Audio("gg.mp3");
//add boss, loop sound, add win screen
float ggtimer=0;
PImage winscreen;
int bossbulletnumber=0;
int bossshoot=0;
PImage gameover;
PImage titlescreen;
boolean playing=false;
int enemydeadcount=0;
BombSprite chocobomb;
bossbullet[] kwehbullet =new bossbullet[50];
Predator[] enemies=new Predator[20];
float enemytimer=0;
float left=0;
float easing=0.01;
float bosshealth=200;
float bossmaxhealth=200;
float bossrectwidth=200;
Boss boss;
float health=100;
float maxhealth=100;
float rectWidth=100;
int bombtime=1;
int gametime=0;
int gameovers=4;
int title=3;
int winner=5;
int bosstime=2;
float chocobombcount=1;
float chocobombtimer=60;
float chocobombduration=0;
float right=0;
float up=0;
float down=0;
PImage collisionImage;
PImage displayImage;
float playerY=400;
float playerX=20;
float playerVelocityY=0;
float playerVelocityX=0;
float playerSpeed=3;
float JumpSpeed= -5;
float playerSize=26;
float upKey;
float rightKey;
float downKey;
float leftKey;
float gravity=.3;
boolean onGround=true;
boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

BulletObject[] bullet=new BulletObject[10];
int currentBullet=0;

class AnimatedSpriteObject extends SpriteObject
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
   
  AnimatedSpriteObject(String filename)
  {
    super(filename);
    this.spriteSheet = this.img;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    if (startFrame!=start && endFrame!=end)
    {
    this.startFrame = start;
    this.endFrame = end;
    this.currentFrame = this.startFrame;
    this.loop = looping;
    }
  }
   
  void update()
  {
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
      this.directionX=(right-left);
      this.x+=directionX*speed;
      this.directionY=(down-up);
      this.y+=directionY*speed;
  }
  
   
}
 
AnimatedSpriteObject chocobo;
 
void setup()
{
  size(500,500);
  //gametime=0;
  frameRate(60);
  gametime=3;
  enemies[0]=new Predator("wark.png");
  enemies[0].enemybehavior=(int)random(1,3);
  enemies[0].directionX = 1;
  enemies[0].x=0;
  enemies[0].y=random(100,400);
  enemies[0].sineY = enemies[0].y;
  enemies[1]=new Predator("wark.png");
  enemies[1].enemybehavior1=(int)random(1,3);
  enemies[1].directionX = 1;
  enemies[1].x=0;
  enemies[1].y=random(100,400);
  enemies[1].sineY = enemies[1].y;
  enemies[2]=new Predator("wark.png");
  enemies[2].enemybehavior2=(int)random(1,3);
  enemies[2].directionX = 1;
  enemies[2].x=0;
  enemies[2].y=random(100,400);
  enemies[2].sineY = enemies[2].y;
  enemies[3]=new Predator("wark.png");
  enemies[3].enemybehavior3=(int)random(1,3);
  enemies[3].directionX = 1;
  enemies[3].x=0;
  enemies[3].y=random(100,400);
  enemies[3].sineY = enemies[3].y;
  enemies[4]=new Predator("wark.png");
  enemies[4].enemybehavior4=(int)random(1,3);
  enemies[4].directionX = 1;
  enemies[4].x=0;
  enemies[4].y=random(100,400);
  enemies[4].sineY = enemies[4].y;
  enemies[5]=new Predator("wark.png");
  enemies[5].enemybehavior5=(int)random(1,3);
  enemies[5].directionX = 1;
  enemies[5].x=0;
  enemies[5].y=random(100,400);
  enemies[5].sineY = enemies[5].y;
  enemies[6]=new Predator("wark.png");
  enemies[6].enemybehavior6=(int)random(1,3);
  enemies[6].directionX = 1;
  enemies[6].x=0;
  enemies[6].y=random(100,400);
  enemies[6].sineY = enemies[6].y;
  enemies[7]=new Predator("wark.png");
  enemies[7].enemybehavior7=(int)random(1,3);
  enemies[7].directionX = 1;
  enemies[7].x=0;
  enemies[7].y=random(100,400);
  enemies[7].sineY = enemies[7].y;
  enemies[8]=new Predator("wark.png");
  enemies[8].enemybehavior8=(int)random(1,3);
  enemies[8].directionX = 1;
  enemies[8].x=0;
  enemies[8].y=random(100,400);
  enemies[8].sineY = enemies[8].y;
  enemies[9]=new Predator("wark.png");
  enemies[9].enemybehavior9=(int)random(1,3);
  enemies[9].directionX = 1;
  enemies[9].x=0;
  enemies[9].y=random(100,400);
  enemies[9].sineY = enemies[9].y;
  enemies[10]=new Predator("wark.png");
  enemies[10].enemybehavior10=(int)random(1,3);
  enemies[10].directionX = 1;
  enemies[10].x=0;
  enemies[10].y=random(100,400);
  enemies[10].sineY = enemies[10].y;
  enemies[11]=new Predator("wark.png");
  enemies[11].enemybehavior11=(int)random(1,3);
  enemies[11].directionX = 1;
  enemies[11].x=0;
  enemies[11].y=random(100,400);
  enemies[11].sineY = enemies[11].y;
  enemies[12]=new Predator("wark.png");
  enemies[12].enemybehavior12=(int)random(1,3);
  enemies[12].directionX = 1;
  enemies[12].x=0;
  enemies[12].y=random(100,400);
  enemies[12].sineY = enemies[12].y;
  enemies[13]=new Predator("wark.png");
  enemies[13].enemybehavior13=(int)random(1,3);
  enemies[13].directionX = 1;
  enemies[13].x=0;
  enemies[13].y=random(100,400);
  enemies[13].sineY = enemies[13].y;
  enemies[14]=new Predator("wark.png");
  enemies[14].enemybehavior14=(int)random(1,3);
  enemies[14].directionX = 1;
  enemies[14].x=0;
  enemies[14].y=random(100,400);
  enemies[14].sineY = enemies[14].y;
  enemies[15]=new Predator("wark.png");
  enemies[15].enemybehavior15=(int)random(1,3);
  enemies[15].directionX = 1;
  enemies[15].x=0;
  enemies[15].y=random(100,400);
  enemies[15].sineY = enemies[15].y;
  enemies[16]=new Predator("wark.png");
  enemies[16].enemybehavior16=(int)random(1,3);
  enemies[16].directionX = 1;
  enemies[16].x=0;
  enemies[16].y=random(100,400);
  enemies[16].sineY = enemies[16].y;
  enemies[17]=new Predator("wark.png");
  enemies[17].enemybehavior17=(int)random(1,3);
  enemies[17].directionX = 1;
  enemies[17].x=0;
  enemies[17].y=random(100,400);
  enemies[17].sineY = enemies[17].y;
  enemies[18]=new Predator("wark.png");
  enemies[18].enemybehavior18=(int)random(1,3);
  enemies[18].directionX = 1;
  enemies[18].x=0;
  enemies[18].y=random(100,400);
  enemies[18].sineY = enemies[18].y;
  enemies[19]=new Predator("wark.png");
  enemies[19].enemybehavior19=(int)random(1,3);
  enemies[19].directionX = 1;
  enemies[19].x=0;
  enemies[19].y=random(100,400);
  enemies[19].sineY = enemies[19].y;
  boss=new Boss("bossMog.png");
  boss.x=-250;
  boss.y=-600;
  boss.speed=3;
  boss.directionX=-1;
  chocobomb= new BombSprite("chocobomb.png");
  winscreen=requestImage("winscreen.png");
  gameover=requestImage("GAMEOVER.png");
  titlescreen=requestImage("title.png");
  collisionImage=requestImage("levels2.png");
  displayImage=requestImage("levelsdetail.png");
  chocobo = new AnimatedSpriteObject("chocobosprites.png");
 // chocobo.x = width/2;
  //chocobo.y = 400;
  chocobo.frameWidth = 24;
  chocobo.frameHeight = 32;//.5;
  chocobo.startFrame = 7;
  chocobo.endFrame = 7;
  chocobo.currentFrame = 7;
  chocobo.frameSpeed = 3.0; // 6fps
  chocobo.speed=4;
  chocobo.w = 30;
  chocobo.h = 30;
  
  for (int i=0; i<10;i++)
  {
    bullet[i]=new BulletObject("greens.png");
    bullet[i].w=20;
    bullet[i].h=20;
    bullet[i].x=-1000;
    bullet[i].y=-1000;
    bullet[i].active=true;
  }
  for (int t=0; t<50;t++)
  {
  kwehbullet[t]=new bossbullet("kweh.png");
  kwehbullet[t].w=20;
  kwehbullet[t].h=20;
  kwehbullet[t].x=2000;
  kwehbullet[t].y=2000;
  kwehbullet[t].active=true;
}
}
boolean chocoboProcessed = false;
void draw()
{
  //println(enemytimer);
//println(enemies[10].enemybehavior10);
  if(gametime==3)
  {
image(titlescreen,0,0,500,500);
  }
  if (gametime==0)
  {
    //println(enemydeadcount);
    enemytimer+=1;
     chocobombtimer-=0.0167;
     chocobomb.active=true;
    
  if (chocobombtimer<0)
  {
    chocobombcount+=1;
    chocobombtimer=60;
  }
  if (chocobo.loaded == true && chocoboProcessed == false)
  {
  if(chocobo.spriteSheet.width>0)
  {
    chocobo.spriteSheet .loadPixels();
    for (int y=0; y<chocobo.spriteSheet .height;y+=1)
    {
    for (int x=0;x<chocobo.spriteSheet .width;x+=1)
    {
      color pixelColor=chocobo.spriteSheet .pixels[y*chocobo.spriteSheet .width+x];

      if (green(pixelColor) == 156)
      {
        //println("found color");
        chocobo.spriteSheet .pixels[y*chocobo.spriteSheet .width+x] = color(255,255,255,0);
      }
    }
    }
    chocobo.spriteSheet .updatePixels();
    chocoboProcessed = true;
  }
  }
  background(0);
    fill(0);
    onGround=false;
  if(collisionImage.width>0)
  {
    playerVelocityY+=gravity;
  playerVelocityX=(rightKey-leftKey)*playerSpeed;
  float nextX=playerX+playerVelocityX;
  float nextY=playerY+playerVelocityY;
    collisionImage.loadPixels();
    for (int y=0; y<collisionImage.height;y+=1)
    {
    for (int x=0;x<collisionImage.width;x+=1)
    {
      color pixelColor=collisionImage.pixels[y*collisionImage.width+x];
         float platformSize=10;
       float platformX= x*platformSize;
  float platformY=y*platformSize;
  boolean collided=isRectOverlapping(nextX,playerY, nextX+playerSize, playerY+playerSize,
  platformX,platformY, platformX+platformSize,platformY+platformSize);
  
  if (collided==true && red(pixelColor)==0)
 
  {
if(playerVelocityX<0 && playerX>=platformX+platformSize)
{
  playerVelocityX=0;
}
if (playerVelocityX >0 &&playerX+playerSize<platformX)
  {
    playerVelocityX=0;
  }
  }
  collided=isRectOverlapping(playerX,nextY, playerX+playerSize, nextY+playerSize,
  platformX,platformY, platformX+platformSize,platformY+platformSize);

  if (collided==true && red(pixelColor)==0)
  {
    if (playerVelocityY>0 && playerY + playerSize <platformY)
    {
      playerVelocityY=0;
      onGround=true;
    }
    if (playerVelocityY<0&& playerY>platformY+platformSize)
    {
      playerVelocityY=0;
    }
  }
  }  
  }
  }

  if(displayImage.width>0)
  {
    imageMode(CORNER);
    image(displayImage,0,0,500,500);
  }
  playerX+=playerVelocityX;
  playerY+=playerVelocityY;
  //fill(255, 0, 0);
  //rect(playerX,playerY,20,20);
  chocobo.update();
  chocobo.render();
  chocobo.x=playerX;
  chocobo.y=playerY;
  
   for(int i=0; i<10; i++)
   {
     bullet[i].update();
     bullet[i].render();
     //bullet[i].active=true;
     if(bullet[i].x<10)
   {
     bullet[i].alive=false;
     bullet[i].x=800;
     bullet[i].y=900;
   }
   if(boss.alive==true && bullet[i].active==true && bullet[i].isOverlapping(boss))
   {
     bullet[i].active=false;
     bosshealth-=5;
   }
     if (enemies[0].alive == true && bullet[i].isOverlapping(enemies[0]))
    {
      enemies[0].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[1].alive == true && bullet[i].isOverlapping(enemies[1]))
    {
      enemies[1].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[2].alive == true && bullet[i].isOverlapping(enemies[2]))
    {
      enemies[2].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[3].alive == true && bullet[i].isOverlapping(enemies[3]))
    {
      enemies[3].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[4].alive == true && bullet[i].isOverlapping(enemies[4]))
    {
      enemies[4].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[5].alive == true && bullet[i].isOverlapping(enemies[5]))
    {
      enemies[5].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[6].alive == true && bullet[i].isOverlapping(enemies[6]))
    {
      enemies[6].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[7].alive == true && bullet[i].isOverlapping(enemies[7]))
    {
      enemies[7].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[8].alive == true && bullet[i].isOverlapping(enemies[8]))
    {
      enemies[8].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[9].alive == true && bullet[i].isOverlapping(enemies[9]))
    {
      enemies[9].alive = false;
      enemydeadcount+=1;
    }
    if (enemies[10].alive == true && bullet[i].isOverlapping(enemies[10]))
    {
      enemies[10].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[11].alive == true && bullet[i].isOverlapping(enemies[11]))
    {
      enemies[11].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[12].alive == true && bullet[i].isOverlapping(enemies[12]))
    {
      enemies[12].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[13].alive == true && bullet[i].isOverlapping(enemies[13]))
    {
      enemies[13].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[14].alive == true && bullet[i].isOverlapping(enemies[14]))
    {
      enemies[14].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[15].alive == true && bullet[i].isOverlapping(enemies[15]))
    {
      enemies[15].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[16].alive == true && bullet[i].isOverlapping(enemies[16]))
    {
      enemies[16].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[17].alive == true && bullet[i].isOverlapping(enemies[17]))
    {
      enemies[17].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[18].alive == true && bullet[i].isOverlapping(enemies[18]))
    {
      enemies[18].alive = false;
      enemydeadcount+=1;
    }
         if (enemies[19].alive == true && bullet[i].isOverlapping(enemies[19]))
    {
      enemies[19].alive = false;
      enemydeadcount+=1;
    }
   }
   for(int t=0; t<50;t+=1)
   {
     kwehbullet[t].update();
     kwehbullet[t].render();
   
   if(kwehbullet[t].active==true && kwehbullet[t].isOverlapping(chocobo))
   {
     kwehbullet[t].active=false;
     health-=5;
   }
   }
   //enemy 1 code
   if (enemytimer>300 && enemies[0].alive==true)
    {
    if (enemies[0].enemybehavior==1)
    {
      enemies[0].update();
      enemies[0].render();      
      //sin wave
    }
    if (enemies[0].enemybehavior==2)
    {
     enemies[0].easing();
     enemies[0].render();  
    }
     if(enemies[0].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[0].active == true)
       {
       health-=10;
       enemies[0].active = false;     
       }
     }
     else
     {
       enemies[0].active = true;    
     }
    }
    ///////////////////////////////////
if (enemytimer>600 && enemies[1].alive==true)
    {
    if (enemies[1].enemybehavior1==1)
    {
      enemies[1].update();
      enemies[1].render();      
      //sin wave
    }
    if (enemies[1].enemybehavior1==2)
    {
     enemies[1].easing();
     enemies[1].render();  
    }
     if(enemies[1].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[1].active == true)
       {
       health-=10;
       enemies[1].active = false;     
       }
     }
     else
     {
       enemies[1].active = true;    
     }
    }
    if (enemytimer>900 && enemies[2].alive==true)
    {
    if (enemies[2].enemybehavior2==1)
    {
      enemies[2].update();
      enemies[2].render();      
      //sin wave
    }
    if (enemies[2].enemybehavior2==2)
    {
     enemies[2].easing();
     enemies[2].render();  
    }
     if(enemies[2].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[2].active == true)
       {
       health-=10;
       enemies[2].active = false;     
       }
     }
     else
     {
       enemies[2].active = true;    
     }
    }
    if (enemytimer>1200 && enemies[3].alive==true)
    {
    if (enemies[3].enemybehavior3==1)
    {
      enemies[3].update();
      enemies[3].render();      
      //sin wave
    }
    if (enemies[3].enemybehavior3==2)
    {
     enemies[3].easing();
     enemies[3].render();  
    }
     if(enemies[3].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[3].active == true)
       {
       health-=10;
       enemies[3].active = false;     
       }
     }
     else
     {
       enemies[3].active = true;    
     }
    }
    if (enemytimer>1500 && enemies[4].alive==true)
    {
    if (enemies[4].enemybehavior4==1)
    {
      enemies[4].update();
      enemies[4].render();      
      //sin wave
    }
    if (enemies[4].enemybehavior4==2)
    {
     enemies[4].easing();
     enemies[4].render();  
    }
     if(enemies[4].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[4].active == true)
       {
       health-=10;
       enemies[4].active = false;     
       }
     }
     else
     {
       enemies[4].active = true;    
     }
    }
    if (enemytimer>1800 && enemies[5].alive==true)
    {
    if (enemies[5].enemybehavior5==1)
    {
      enemies[5].update();
      enemies[5].render();      
      //sin wave
    }
    if (enemies[5].enemybehavior5==2)
    {
     enemies[5].easing();
     enemies[5].render();  
    }
     if(enemies[5].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[5].active == true)
       {
       health-=10;
       enemies[5].active = false;     
       }
     }
     else
     {
       enemies[5].active = true;    
     }
    }
    if (enemytimer>2100 && enemies[6].alive==true)
    {
    if (enemies[6].enemybehavior6==1)
    {
      enemies[6].update();
      enemies[6].render();      
      //sin wave
    }
    if (enemies[6].enemybehavior6==2)
    {
     enemies[6].easing();
     enemies[6].render();  
    }
     if(enemies[6].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[6].active == true)
       {
       health-=10;
       enemies[6].active = false;     
       }
     }
     else
     {
       enemies[6].active = true;    
     }
    }
    if (enemytimer>2400 && enemies[7].alive==true)
    {
    if (enemies[7].enemybehavior7==1)
    {
      enemies[7].update();
      enemies[7].render();      
      //sin wave
    }
    if (enemies[7].enemybehavior7==2)
    {
     enemies[7].easing();
     enemies[7].render();  
    }
     if(enemies[7].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[7].active == true)
       {
       health-=10;
       enemies[7].active = false;     
       }
     }
     else
     {
       enemies[7].active = true;    
     }
    }
    if (enemytimer>2700 && enemies[8].alive==true)
    {
    if (enemies[8].enemybehavior8==1)
    {
      enemies[8].update();
      enemies[8].render();      
      //sin wave
    }
    if (enemies[8].enemybehavior8==2)
    {
     enemies[8].easing();
     enemies[8].render();  
    }
     if(enemies[8].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[8].active == true)
       {
       health-=10;
       enemies[8].active = false;     
       }
     }
     else
     {
       enemies[8].active = true;    
     }
    }
    if (enemytimer>3000 && enemies[9].alive==true)
    {
    if (enemies[9].enemybehavior9==1)
    {
      enemies[9].update();
      enemies[9].render();      
      //sin wave
    }
    if (enemies[9].enemybehavior9==2)
    {
     enemies[9].easing();
     enemies[9].render();  
    }
     if(enemies[9].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[9].active == true)
       {
       health-=10;
       enemies[9].active = false;     
       }
     }
     else
     {
       enemies[9].active = true;    
     }
    }
    if (enemytimer>3300 && enemies[10].alive==true)
    {
    if (enemies[10].enemybehavior10==1)
    { 
      enemies[10].update();
      enemies[10].render();      
      //sin wave
    }
    if (enemies[10].enemybehavior10==2)
    {
     enemies[10].easing();
     enemies[10].render();  
    }
     if(enemies[10].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[10].active == true)
       {
       health-=10;
       enemies[10].active = false;     
       }
     }
     else
     {
       enemies[10].active = true;    
     }
    }
    if (enemytimer>3600 && enemies[11].alive==true)
    {
    if (enemies[11].enemybehavior11==1)
    {
      enemies[11].update();
      enemies[11].render();      
      //sin wave
    }
    if (enemies[11].enemybehavior11==2)
    {
     enemies[11].easing();
     enemies[11].render();  
    }
     if(enemies[11].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[11].active == true)
       {
       health-=10;
       enemies[11].active = false;     
       }
     }
     else
     {
       enemies[11].active = true;    
     }
    }
    if (enemytimer>3900 && enemies[12].alive==true)
    {
    if (enemies[12].enemybehavior12==1)
    {
      enemies[12].update();
      enemies[12].render();      
      //sin wave
    }
    if (enemies[12].enemybehavior12==2)
    {
     enemies[12].easing();
     enemies[12].render();  
    }
     if(enemies[12].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[12].active == true)
       {
       health-=10;
       enemies[12].active = false;     
       }
     }
     else
     {
       enemies[12].active = true;    
     }
    }
    if (enemytimer>4200 && enemies[13].alive==true)
    {
    if (enemies[13].enemybehavior13==1)
    {
      enemies[13].update();
      enemies[13].render();      
      //sin wave
    }
    if (enemies[13].enemybehavior13==2)
    {
     enemies[13].easing();
     enemies[13].render();  
    }
     if(enemies[13].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[13].active == true)
       {
       health-=10;
       enemies[13].active = false;     
       }
     }
     else
     {
       enemies[13].active = true;    
     }
    }
    if (enemytimer>4500 && enemies[14].alive==true)
    {
    if (enemies[14].enemybehavior14==1)
    {
      enemies[14].update();
      enemies[14].render();      
      //sin wave
    }
    if (enemies[14].enemybehavior14==2)
    {
     enemies[14].easing();
     enemies[14].render();  
    }
     if(enemies[14].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[14].active == true)
       {
       health-=10;
       enemies[14].active = false;     
       }
     }
     else
     {
       enemies[14].active = true;    
     }
    }
    if (enemytimer>4800 && enemies[15].alive==true)
    {
    if (enemies[15].enemybehavior15==1)
    {
      enemies[15].update();
      enemies[15].render();      
      //sin wave
    }
    if (enemies[15].enemybehavior15==2)
    {
     enemies[15].easing();
     enemies[15].render();  
    }
     if(enemies[15].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[15].active == true)
       {
       health-=10;
       enemies[15].active = false;     
       }
     }
     else
     {
       enemies[15].active = true;    
     }
    }
    if (enemytimer>5100 && enemies[16].alive==true)
    {
    if (enemies[16].enemybehavior16==1)
    {
      enemies[16].update();
      enemies[16].render();      
      //sin wave
    }
    if (enemies[16].enemybehavior16==2)
    {
     enemies[16].easing();
     enemies[16].render();  
    }
     if(enemies[16].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[16].active == true)
       {
       health-=10;
       enemies[16].active = false;     
       }
     }
     else
     {
       enemies[16].active = true;    
     }
    }
    if (enemytimer>5400 && enemies[17].alive==true)
    {
    if (enemies[17].enemybehavior17==1)
    {
      enemies[17].update();
      enemies[17].render();      
      //sin wave
    }
    if (enemies[17].enemybehavior17==2)
    {
     enemies[17].easing();
     enemies[17].render();  
    }
     if(enemies[17].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[17].active == true)
       {
       health-=10;
       enemies[17].active = false;     
       }
     }
     else
     {
       enemies[17].active = true;    
     }
    }
    if (enemytimer>5700 && enemies[18].alive==true)
    {
    if (enemies[18].enemybehavior18==1)
    {
      enemies[18].update();
      enemies[18].render();      
      //sin wave
    }
    if (enemies[18].enemybehavior18==2)
    {
     enemies[18].easing();
     enemies[18].render();  
    }
     if(enemies[18].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[18].active == true)
       {
       health-=10;
       enemies[18].active = false;     
       }
     }
     else
     {
       enemies[18].active = true;    
     }
    }
    if (enemytimer>6000 && enemies[19].alive==true)
    {
    if (enemies[19].enemybehavior19==1)
    {
      enemies[19].update();
      enemies[19].render();      
      //sin wave
    }
    if (enemies[19].enemybehavior19==2)
    {
     enemies[19].easing();
     enemies[19].render();  
    }
     if(enemies[19].isOverlapping(chocobo))
     {
       //drains health too fast
       if (enemies[19].active == true)
       {
       health-=10;
       enemies[19].active = false;     
       }
     }
     else
     {
       enemies[19].active = true;    
     }
    }
//end enemy 1, copy pasta time

     if(health<25)
 {
   textSize(20);
   fill(255,0,0);
   text("Health:",330,15);
 }
 else if (health<50)
 {
   textSize(20);
   fill(255,200,0);
   text("Health:",330,15);
 }
 else{
   textSize(20);
  fill(0,255,0);
  text("Health:",330,15);
 }
  noStroke();
  
  float drawWidth=(health/maxhealth)*rectWidth;
  rect(400,0,drawWidth,20);
  //outline
  stroke(0);
  noFill();
  rect(400,0,100,20);
   fill(0,0,0);
   textSize(20);
   text("Time Until Next Chocobo Bomb: "+int(chocobombtimer),0,52);
   text("Chocobo Bomb Count: "+int(chocobombcount),0,20);
   fill(0,0,0);
   float bosswidth=(bosshealth/bossmaxhealth)*bossrectwidth;
   if (enemydeadcount>=20)
   {
     if(boss.x==-250 && boss.y==-600)
     {
       boss.x=0;
       boss.y=0;
     }
       //boss script 
       bossshoot+=random(1,4);
       noStroke();
       fill(255,0,0);
       rect(300,480,bosswidth,20);
       stroke(0);
       noFill();
       rect(300,480,200,20);
       fill(255,0,0);
       textSize(20);
       text("Boss Health:",177,497);
       
     enemies[0].alive=false;
     enemies[1].alive=false;
     enemies[2].alive=false;
     enemies[3].alive=false;
     enemies[4].alive=false;
     enemies[5].alive=false;
     enemies[6].alive=false;
     enemies[7].alive=false;
     enemies[8].alive=false;
     enemies[9].alive=false;
     enemies[10].alive=false;
     enemies[11].alive=false;
     enemies[12].alive=false;
     enemies[13].alive=false;
     enemies[14].alive=false;
     enemies[15].alive=false;
     enemies[16].alive=false;
     enemies[17].alive=false;
     enemies[18].alive=false;
     enemies[19].alive=false;
     boss.update();
     boss.render();
    if(boss.x<=0)
    {
   if(boss.directionX==-1)
     {
       boss.directionX=0;
       boss.directionY=1;
     }
       kwehbullet[bossbulletnumber].speed=2;
       kwehbullet[bossbulletnumber].directionX=1;
       kwehbullet[bossbulletnumber].directionY=0;
     }
     if(boss.y>=370)
     {
     if(boss.directionY==1)
     {
       boss.directionY=0;
       boss.directionX=1;
     }
       kwehbullet[bossbulletnumber].speed=2;
       kwehbullet[bossbulletnumber].directionY=-1;
       kwehbullet[bossbulletnumber].directionX=0;
     }
     if(boss.x>=421)
     {
       if(boss.directionX==1)
     {
       boss.directionX=0;
       boss.directionY=-1;
     }
       kwehbullet[bossbulletnumber].speed=2;
       kwehbullet[bossbulletnumber].directionX=-1;
       kwehbullet[bossbulletnumber].directionY=0;
     }
     if(boss.y<=0)
     {
       if(boss.directionY==-1)
     {
       boss.directionY=0;
       boss.directionX=-1;
     }
       kwehbullet[bossbulletnumber].speed=2;
       kwehbullet[bossbulletnumber].directionY=1;
       kwehbullet[bossbulletnumber].directionX=0;
     }
     if(boss.isOverlapping(chocobo)) 
     {
       if(boss.active==true)
     {
       boss.active=false;
       health-=30;
     }
     }
     else
     {
     boss.active=true;
     }
     if(bossshoot>30)
     {
       kwehbullet[bossbulletnumber].x=boss.x;
       kwehbullet[bossbulletnumber].y=boss.y;
       kwehbullet[bossbulletnumber].speed=2;
       bossbulletnumber+=1;
       if(bossbulletnumber>=50)
       {
         bossbulletnumber=0;
       }
       bossshoot=0;
     }
     
     
//end boss   
}   
 }

  //chocobomb

  if(gametime==1)
  {
   if (playing==false)
   {
audio1.play();
playing=true;
   }
    chocobombduration+=0.0167;
    //chocobomb animation
    fill(random(255),random(255),random(255));
    rect(0,0,500,500);
    chocobomb.render();
    chocobomb.x=250;
    chocobomb.y=250;
    if(boss.alive==true)
    {
      if(chocobomb.active==true)
    {
      if (chocobomb.isOverlapping(boss))
      {
        chocobomb.active=false;
        bosshealth-=20;
      }
    }
    }
     if (enemies[0].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[0]))
    {
      enemies[0].alive = false;
      enemydeadcount+=1;
    }
     }
         if (enemies[1].alive == true)
         {
         if (chocobomb.isOverlapping(enemies[1]))
         
    {
      enemies[1].alive = false;
      enemydeadcount+=1;
    }
         }
         if (enemies[2].alive == true)
         {
           if(chocobomb.isOverlapping(enemies[2]))
    {
      enemies[2].alive = false;
      enemydeadcount+=1;
    }
         }
         if (enemies[3].alive == true)
        { 
         if (chocobomb.isOverlapping(enemies[3]))
    {
      enemies[3].alive = false;
      enemydeadcount+=1;
    }
        }
         if (enemies[4].alive == true)
         {
           if(chocobomb.isOverlapping(enemies[4]))
    {
      enemies[4].alive = false;
      enemydeadcount+=1;
    }
         }
         if (enemies[5].alive == true)
        {
          if(chocobomb.isOverlapping(enemies[5]))
    {
      enemies[5].alive = false;
      enemydeadcount+=1;
    }
        }
         if (enemies[6].alive == true)
         {
         if(chocobomb.isOverlapping(enemies[6]))
    {
      enemies[6].alive = false;
      enemydeadcount+=1;
    }
         }
         if (enemies[7].alive == true)
         {
           if(chocobomb.isOverlapping(enemies[7]))
    {
      enemies[7].alive = false;
      enemydeadcount+=1;
    }
         }
         if (enemies[8].alive == true)
         {
           if(chocobomb.isOverlapping(enemies[8]))
    {
      enemies[8].alive = false;
      enemydeadcount+=1;
    }
         }
         if (enemies[9].alive == true)
         {
           if(chocobomb.isOverlapping(enemies[9]))
    {
      enemies[9].alive = false;
      enemydeadcount+=1;
    }
         }
         if (enemies[10].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[10]))
    {
      enemies[10].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[11].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[11]))
    {
      enemies[11].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[12].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[12]))
    {
      enemies[12].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[13].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[13]))
    {
      enemies[13].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[14].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[14]))
    {
      enemies[14].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[15].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[15]))
    {
      enemies[15].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[16].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[16]))
    {
      enemies[16].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[17].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[17]))
    {
      enemies[17].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[18].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[18]))
    {
      enemies[18].alive = false;
      enemydeadcount+=1;
    }
     }
     if (enemies[19].alive == true)
     {
     if (chocobomb.isOverlapping(enemies[19]))
    {
      enemies[19].alive = false;
      enemydeadcount+=1;
    }
     }
    if (chocobombduration>2)
    {
      gametime=0;
      if (playing==true)
      {
       //audio1.pause();
       playing=false;
      }
      chocobombduration+=0;
      chocobombduration=0;
    }
  }
  if( health<=0 || chocobo.y>600)
  {
    gametime=gameovers;
  }
  if (gametime==4)
  {
    background(0);
    imageMode(CORNER);
    image(gameover,0,0,500,500);
      
      audio3.play();
      //audio3.loop()==true;
  }
  if(enemydeadcount==20 && bosshealth<=0)
  {
    gametime=5;
  }
  if(gametime==5)
  {
    imageMode(CORNER);
    image(winscreen,0,0,500,500);
    audio2.play();
  }
}
void keyReleased()
{
 if (key=='x' && gametime==0)
 {
   bullet[currentBullet].alive=true;
   bullet[currentBullet].active=true;
   bullet[currentBullet].x=chocobo.x;
   bullet[currentBullet].y=chocobo.y;
   bullet[currentBullet].speed=5;
    if (shootdirectionX != 0 || shootdirectionY !=0)
    {
      bullet[currentBullet].directionX = shootdirectionX;
      bullet[currentBullet].directionY = shootdirectionY;
    }
    currentBullet += 1;
    if (currentBullet >= 10)
    {
      currentBullet = 0;
    }
  }
if(key=='z' && chocobombcount>0 && gametime==0)
{
  gametime=1;
  chocobombcount-=1; 
}
if(key=='x'&& gametime==3)
{
  gametime=0;
}

if (key==CODED)
{
  if (keyCode==LEFT)
  {
    left=0;
    leftKey=0;
  }
  if(keyCode==RIGHT)
  {
    right=0;
    rightKey=0;
  }
  if (keyCode==UP)
  {
    up=0;
    upKey=0;
  }
  if(keyCode==DOWN)
  {
    down=0;
    downKey=0;
  }
}
}
float shootdirectionX;
float shootdirectionY;
void keyPressed()
{
  if(key==' ')
{
  if (onGround==true)
  {
    playerVelocityY=JumpSpeed;
  }
}
   if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      chocobo.setAnimation(9,11,true);
      shootdirectionX = -1;
      shootdirectionY=0;
      leftKey=1;
    }
    if (keyCode == RIGHT)
    {
      // or use the helper function that does the same thing.
      // start, end, looping
      chocobo.setAnimation(3, 5, true);
      shootdirectionX = 1;
      shootdirectionY = 0;
      rightKey=1;
    }
    if (keyCode == UP)
    {
      chocobo.setAnimation(0, 2, true);
      shootdirectionY=-1;
      shootdirectionX=0;
    }
    if (keyCode == DOWN)
    {
      chocobo.setAnimation(6,8,true);
      shootdirectionY=1;
      shootdirectionX=0;
    }
 
  }


  if (key == CODED)
  {
  /*  if(keyCode==UP)
    {
      up=1;
    }
    if (keyCode==DOWN)
    {
      down=1;
    }*/
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }
}
class BulletObject extends AnimatedSpriteObject
{
  BulletObject(String filename)
  {
    super(filename);
  }
   
  void update()
  {
    this.y += directionY * speed;
    this.x += directionX * speed;
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
  boolean alive = true;
  boolean active = true;
       
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
       this.y+=directionY*speed;
       this.x+=directionX*speed;
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
         
    if (loaded && alive)
    {
      imageMode(CORNER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.scaleX, this.scaleY);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}
class BombSprite extends SpriteObject
{
BombSprite(String filename)
  {
    super(filename);
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
class Predator extends SpriteObject
{
  float enemybehavior;
  float enemybehavior1;
  float enemybehavior2;
  float enemybehavior3;
  float enemybehavior4;
  float enemybehavior5;
  float enemybehavior6;
  float enemybehavior7;
  float enemybehavior8;
  float enemybehavior9;
  float enemybehavior10;
  float enemybehavior11;
  float enemybehavior12;
  float enemybehavior13;
  float enemybehavior14;
  float enemybehavior15;
  float enemybehavior16;
  float enemybehavior17;
  float enemybehavior18;
  float enemybehavior19;
  float sineY;
  Predator(String filename)
  {
    super(filename);
    this.speed = 2;
  }
 void easing()
{ 

  float targetX=chocobo.x;
  float targetY=chocobo.y;
  float dx=targetX-x;
  float dy=targetY-y;
  PVector direction = new PVector(dx, dy);
  direction.normalize();
  x += direction.x * speed;
  y += direction.y * speed;
}

 void update()
{ 
  float waveHeight = 120;
  float waveSpeed = 1.5;  
  y = sineY + (sin(radians(x * waveSpeed)) * waveHeight);
  super.update();
}
}
class Boss extends SpriteObject
{
   Boss(String filename)
  {
    super(filename);
  }
  void update()
  {
 this.y+=directionY*speed;
    this.x+=directionX*speed;
  }
}
class bossbullet extends BulletObject
{
  bossbullet(String filename)
  {
    super(filename);
  }
}


