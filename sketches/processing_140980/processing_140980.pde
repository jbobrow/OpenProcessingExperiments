
/* @pjs preload="Fireball_NSMB.png, SEMANGAT 45.TTF, explodingplanet.png, tardis_in_space.jpg, NIGHTMARE 5.TTF , planet1.png, planet2.png, planet3.png, planet4.png, planet5.png, explosionsprite.png, SPACE.jpg"; */
//referencing processing.org/examples/storinginput.html
int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int num = 60;
int clickcount = 0;

PImage fireball;
PImage mybackground;
PImage losescreen;
PImage winscreen;
PImage myimg1;
PImage myimg2;
PImage myimg3;
PImage myimg4;
PImage myimg5;
PFont NIGHTMARE5;
PFont SEMANGAT;

float timer = 30;
float planetTimer = 0;
float myplanets = 0;
float planetx = 0;
float planety = 0;
float planetx2 = 0;
float planety2 = 0;
float planetx3 = 0;
float planety3 = 0;
float planetx4 = 0;
float planety4 = 0;
float planetx5 = 0;
float planety5 = 0;
float planetsize = 75;
float mouseDist = 0;
float mx [] = new float [num];
float my [] = new float [num];
AnimatedSprite explosion;

void setup()
{
  size (600, 600);
  frameRate(30);
  fireball = requestImage("Fireball_NSMB.png");
  losescreen = requestImage("tardis_in_space.jpg");
  winscreen = requestImage("explodingplanet.png");
  mybackground = requestImage("SPACE.jpg");
  myimg1 = requestImage("planet1.png");
  myimg2 = requestImage("planet2.png");
  myimg3 = requestImage("planet3.png");
  myimg4 = requestImage("planet4.png");
  myimg5 = requestImage("planet5.png");
  explosion = new AnimatedSprite("explosionsprite.png", 64, 64);
 
  NIGHTMARE5 = createFont("NIGHTMARE 5.TTF", 42);
  SEMANGAT = createFont("SEMANGAT 45.TTF", 50);
}

void draw()
{
  if (gamestate == PLAY_STATE)
  {
    timer = timer - 1.0 / 30.0;
    planetTimer = planetTimer + (1.0 / 30.0);
    if (timer >= 1 && timer < 30);
    {
      if (mybackground.width > 0)
      {
        image(mybackground, 0, 0, width, height);
      }
      int which = frameCount % num;
      mx[which] = mouseX;
      my[which] = mouseY;
   
      for (int i = 0; i < num; i++)
        {
          int index = (which+1 + i) % num;
          if (i > 0)
          {  
          image(fireball, mx[index], my[index], i, i);
          }
         }         
 
    if (planetTimer > 0.5)
   {
      planetTimer = 0;
      planetx = random(width - planetsize);
      planety = random(0, height - planetsize);
      planetx2 = random(width - planetsize);
      planety2 = random(100, height - planetsize);
      planetx3 = random(width - planetsize);
      planety3 = random(450, height - planetsize);
      planetx4 = random(width - planetsize);
      planety4 = random(225, height - planetsize);
      planetx5 = random(width - planetsize);
      planety5 = random(300, height - planetsize);
    }
    if (myimg1.width > 0)
    {
      image(myimg1, planetx, planety, planetsize, planetsize);
    }
   if (myimg2.width > 0)
    {
      image(myimg2, planetx2, planety2, planetsize, planetsize);
    }
    if (myimg3.width > 0)
    {
      image(myimg3, planetx3, planety3, planetsize, planetsize);
    }
   if (myimg4.width > 0)
    {
      image(myimg4, planetx4, planety4, planetsize, planetsize);
    }
    if (myimg5.width > 0)
    {
      image(myimg5, planetx5, planety5, planetsize, planetsize);
    }
    fill(255);
    text("TIME: " + (int) timer, 50, 50);
    text("CLICKS: " + (int)clickcount, 50, 75);
    
    if (timer < 0)
    {
      if (clickcount >= 15)
      {
        gamestate = WIN_STATE;
      }
      else
      {
        gamestate = LOSE_STATE;
      }
    }
  }
  if (gamestate == LOSE_STATE)
  {
    if (losescreen.width > 0)
      {
        image(losescreen, 0, 0, width, height);
      }
      fill(255, 0, 0);
      textFont(NIGHTMARE5);
      textAlign(CENTER);
      text("The Doctor has foiled your plan to purge the world!", 0, 100, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
    if (winscreen.width > 0)
      {
        image(winscreen, 0, 0, width, height);
      }
      fill(255);
      textFont(SEMANGAT);
      textAlign(CENTER);
      text("You have achieved ULTIMATE DOMINATION OF THE UNIVERSE!", 0, 100, width, 100);
  }
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    if (mouseX > planetx3
    && mouseY > planety3
    && mouseX < (planetx3 + planetsize)
    && mouseY < (planety3 + planetsize))
    {
      clickcount = clickcount + 1;
      explosion.setAnimation(0, 32, true);
      pushMatrix();
      translate(planetx3, planety3);
      scale(1.5);
      explosion.draw();
      popMatrix();
    }
    if (mouseX > planetx
    && mouseY > planety
    && mouseX < (planetx + planetsize)
    && mouseY < (planety + planetsize))
    {
      planetsize = planetsize / 1.5;
    }
    if (mouseX > planetx4
    && mouseY > planety4
    && mouseX < (planetx4 + planetsize)
    && mouseY < (planety4 + planetsize))
    {
      planetsize = planetsize * .95;
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


