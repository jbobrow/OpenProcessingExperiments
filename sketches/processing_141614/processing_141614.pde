

// Gold Door + Lock
float D1X = 200;
float DW = 20;
float DH = 30;
float DY = 25;
boolean open = false;
boolean GUnlocked = false;
PImage DoorLockG;
PImage Door;
PImage OpenDoor;
float D1XL = 200;
PImage Eyes;
// Gold Key
PImage GoldKey;
float GKX = 58;
float GKY = 500;
boolean GKey = false;
// Silver Door + Lock
boolean open2 = false;
boolean SUnlocked = false;
PImage DoorLockS;
float D2X= 530;
float D2XL = 530;
// Silver Key
PImage SilverKey;
float SKX = 380;
float SKY = 150;
boolean SKey = false;
// Treasure Chest +Lock
float RX = 58;
float RY = 500;
float RLW = 50;
float RXL = 58;
float RYL = 500;
PImage Lock;
PImage dungeon;
PImage Chest;
PImage OpenChest;
boolean OChest = false;
boolean CUnlocked = false;
// Treasure Chest Key
PImage ChestKey;
float CKX = 60;
float CKY = 55;
boolean CKey = false;
// Crates
PImage BigCrate;
float BCX = 750;
float BCXA = 720;
PImage LittleCrate;
float LCX = 720;
boolean PushCrate = false;
boolean PushCrateA = false;
//Barrels
PImage Barrel;
float B1X = 60;
float B1Y = 55;
float B2X = 735;
float B2Y = 525;
boolean OBarrel = false;
boolean OBarrel2 = false;
PImage BrokenBarrel;
//Hammer
PImage Hammer;
float HX = 730;
float HY = 50;
boolean HoldHammer = false;
//Scissors
PImage Scissors;
float SX = 735;
float SY = 525;
boolean HoldScissors = false;
//Rope
PImage Rope;
float RPX = 300;
float RPY = 80;
boolean Cut = false;
float RedCount = 1;
//Torch
float TorchLife = 100;
//Game
boolean Win = false;
PImage WIN;
boolean Lose = false;
PImage LOSE;
//Sound
var BackgroundMusic = new Audio("BackgroundMusic.mp3");

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
  PImage RedghostSpritesheet;
   
  AnimatedSpriteObject(String filename)
  {
    super(filename);
    this.RedghostSpritesheet = this.img;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    this.startFrame = start;
    this.endFrame = end;
    this.currentFrame = this.startFrame;
    this.loop = looping;
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
     
    int colCount = this.RedghostSpritesheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.RedghostSpritesheet.get(
      this.frameColumn * this.frameWidth,
      this.frameRow * this.frameHeight,
      this.frameWidth,
      this.frameHeight);
  }
   
}

class AnimatedSpriteObjectStill extends SpriteObjectStill
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
  PImage RedghostSpritesheet;

 AnimatedSpriteObjectStill(String filename)
  {
    super(filename);
    this.RedghostSpritesheet = this.img;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    this.startFrame = start;
    this.endFrame = end;
    this.currentFrame = this.startFrame;
    this.loop = looping;
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
     
    int colCount = this.RedghostSpritesheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.RedghostSpritesheet.get(
      this.frameColumn * this.frameWidth,
      this.frameRow * this.frameHeight,
      this.frameWidth,
      this.frameHeight);
  }
   
}

AnimatedSpriteObject RedGhost;
AnimatedSpriteObject BlueGhost;
AnimatedSpriteObject GreenGhost;
AnimatedSpriteObjectStill Torches;

void setup()
{
  size(800,600);
  rectMode(CENTER);
  noStroke();
  dungeon = requestImage("Background.jpg");
  Chest = requestImage("TreasureChest.png");
  OpenChest = requestImage("OpenChest.png");
  Door = requestImage("Door.png");
  OpenDoor = requestImage("OpenDoor.png");
  GoldKey = requestImage("key.png");
  SilverKey = requestImage("SilverKey.png");
  ChestKey = requestImage("ChestKey.png");
  Lock  = requestImage("Lock.png");
  DoorLockS = requestImage("DoorLockS.png");
  DoorLockG = requestImage("DoorLockG.png");
  BigCrate = requestImage("BigCrate.png");
  LittleCrate = requestImage("LittleCrate.png");
  Barrel = requestImage("Barrel.png");
  Hammer = requestImage("Hammer.png");
  Scissors = requestImage("Scissors.png");
  Rope = requestImage("Rope.png");
  BrokenBarrel = requestImage("Broken.png");
  WIN = requestImage("Win.png");
  LOSE = requestImage("Lose.png");
  Eyes = requestImage("Eyes.png");
  BackgroundMusic.load();
  BackgroundMusic.play();
  RedGhost = new AnimatedSpriteObject("RedghostSpritesheet.png");
  RedGhost.x = 750;
  RedGhost.y = 330;
  RedGhost.frameWidth = 39;
  RedGhost.frameHeight = 50;
  RedGhost.startFrame = 0;
  RedGhost.endFrame = 2;
  RedGhost.frameSpeed = 6.0;
  
  BlueGhost = new AnimatedSpriteObject("BlueGhostSpriteSheet.png");
  BlueGhost.x = 50;
  BlueGhost.y = 160;
  BlueGhost.frameWidth = 41;
  BlueGhost.frameHeight = 50;
  BlueGhost.startFrame = 0;
  BlueGhost.endFrame = 2;
  BlueGhost.frameSpeed = 6.0;
  
  GreenGhost = new AnimatedSpriteObject("GreenGhostSpriteSheet.png");
  GreenGhost.x = 750;
  GreenGhost.y = 110;
  GreenGhost.frameWidth = 42;
  GreenGhost.frameHeight = 48;
  GreenGhost.startFrame = 0;
  GreenGhost.endFrame = 2;
  GreenGhost.frameSpeed = 6.0;
  
  Torches = new AnimatedSpriteObjectStill("TorchSpriteSheet.png");
  Torches.x = 393;
  Torches.y = 240;
  Torches.frameWidth = 18;
  Torches.frameHeight = 47;
  Torches.startFrame = 0;
  Torches.endFrame = 2;
  Torches.frameSpeed = 6.0;
}

void draw()
{
  imageMode(CORNER);
  image(dungeon,0,0,width,height);
  imageMode(CENTER);
  rect(RX,RY,20,20);
  image(Chest,RX,RY,RLW,RLW);
  image(Lock,RXL,RYL,20,20);
  image(Door,D1X,DY,DW,DH);
  image(DoorLockG,D1XL,DY,15,15);
  image(Door,D2X,DY,DW,DH);
  image(DoorLockS,D2XL,DY,15,15);
  image(Hammer,HX,HY,20,35);
  image(BigCrate,BCX,50,40,50);
  image(BigCrate,BCXA,50,40,50);
  image(LittleCrate,LCX,40,20,30);
  image(Barrel,B1X,B1Y,33,42);
  image(Barrel,B2X,B2Y,33,42);
  image(Rope,RPX,RPY,60,200);
 if(RedCount == 1)
 {
    RedGhost.update();
    RedGhost.render();
  }
  BlueGhost.update();
  BlueGhost.render();
  GreenGhost.update();
  GreenGhost.render();
  Torches.update();
  Torches.render();
  if(GKey == true)
  {
    if(GKX > (D1X-10) && GKY > (DY-15) && GKX < (D1X + 10) && GKY < (DY + 15))
    {
      D1XL = 900;
      GKY = 900;
      GUnlocked = true;
    }
  }
  if(SKey == true)
  {
    if (SKX > (D2X-10) && SKY > (SKY-15) && SKX < (SKX + 10) && SKY < (SKY + 15))
    {
      D2XL = 900;
      SKY = 900;
      SUnlocked = true;
    }
  }
  if(CKey == true)
  {
    if(CKX> (RX-20) && CKY > (RY-20) && CKX < (RX + 20) && CKY < (RY + 20))
    {
      RYL = 900;
      CKY = 900;
      CUnlocked = true;
    }
  }
  if(HoldHammer == true)
  {
    if(HX> (B1X-17) && HY > (B1Y-21) && HX < (B1X + 17) && HY < (B1Y + 21))
    {
      B1Y = 900;
      OBarrel = true;
    }
  }
  if(HoldHammer == true)
  {
    if(HX> (B2X-17) && HY > (B2Y-21) && HX < (B2X + 17) && HY < (B2Y + 21))
    {
      B2Y = 900;
      OBarrel2 = true;
    }
  }
  if(HoldScissors == true)
  {
    if(SX> (RPX-30) && SY > (RPY-100) && SX < (RPX + 30) && SY < (RPY + 100))
    {
      RPY = 900;
      SY = 900;
      Cut = true;
    }
  }
    
  if(open == true && GUnlocked == true)
  {
    image(OpenDoor,D1X,DY,DW,DH);
    image(Eyes,205,DY,15,10);
  }
  if(open2 == true && SUnlocked == true)
  {
    image(OpenDoor, D2X,DY,DW,DH);
    Win = true;
  }
  if(OChest == true && CUnlocked == true)
  {
    image(OpenChest,RX,RY,RLW,RLW);
    image(GoldKey,GKX,GKY,20,35);
  }
  if(OBarrel == true)
  {
    image(BrokenBarrel,60,55,60,60);
    image(ChestKey,CKX,CKY,20,35);
  }
  if(OBarrel2 == true)
  {
    image(BrokenBarrel,735,525,60,60);
    image(Scissors,SX,SY,35,20);
  }
  if(OBarrel == true && OBarrel2 == true)
  {
    HY = 900;
  }
  if(Cut == true)
  {
    image(BrokenBarrel,380,150,60,60);
    image(SilverKey,SKX,SKY,20,35);
  }
  //Torch Health
  textSize(20);
  fill(237,130,23);
  text("Torch Life:", 300,550);
  rectMode(CORNER);
  noStroke();
   if(TorchLife < 75 && TorchLife > 50)
  {
    fill(255,211,13);
  }
  if(TorchLife < 50 && TorchLife > 25)
  {
    fill(255,137,3);
  }
  if(TorchLife < 25)
  {
    fill(217,5,2);
  }
  if(TorchLife == 100 && TorchLife > 75)
  {
    fill(35,173,0);
  }
  rect(410,530,TorchLife,20);
  noFill();
  stroke(255);
  rect(410,530,100,20);
  rectMode(CENTER);

  if(TorchLife < 0)
  {
    TorchLife = 0;
    Lose = true;
  }
  if(GreenGhost.x> (Torches.x-20) && GreenGhost.y > (Torches.y-50) && GreenGhost.x < (Torches.x + 20) && GreenGhost.y < (Torches.y + 50))
  {
    TorchLife = TorchLife - .25;
  }
  if (Win == true)
  {
    image(WIN,400,300,width,height);
  }
  if(Lose == true)
  {
    image(LOSE,400,300,width,height);
  }
}

void mouseDragged()
{
   if(mouseX> (GKX-10) && mouseY > (GKY-20) && mouseX < (GKX + 10) && mouseY < (GKY + 20) && HoldHammer == false && HoldScissors == false && SKey == false && CKey == false)
  {
    GKX = mouseX;
    GKY = mouseY;
  }
  if(mouseX> (SKX-10) && mouseY > (SKY-20) && mouseX < (SKX + 10) && mouseY < (SKY + 20) && HoldHammer == false && HoldScissors == false && GKey == false && CKey == false)
  {
    SKX = mouseX;
    SKY = mouseY;
  }
  if(mouseX> (CKX-10) && mouseY > (CKY-20) && mouseX < (CKX + 10) && mouseY < (CKY + 20)  && HoldHammer == false && HoldScissors == false && SKey == false && GKey == false)
  {
    CKX = mouseX;
    CKY = mouseY;
  }
  if(mouseX> (BCX-20) && mouseY > (25) && mouseX < (BCX + 20) && mouseY < (75) && HoldHammer == false)
  {
    if((BCX > 650) && (BCX < 780))
    {
      BCX = mouseX;
      PushCrate = true;
    }
  }
  else
    {
      PushCrate = false;
    }
  if(mouseX> (BCXA-20) && mouseY > (25) && mouseX < (BCXA + 20) && mouseY < (75))
  {
    if((BCXA > 640) && (BCXA < 730) && (BCXA < (BCX-25)))
    {
      BCXA = mouseX;
      PushCrateA = true;
    }
    else
    {
      BCXA = (BCX-30);
    }
  }
  else
  {
    PushCrateA = false;
  }
  if(mouseX> (LCX-10) && mouseY > (15) && mouseX < (LCX + 10) && mouseY < (45))
  {
    if((LCX > 650) && (LCX < 780))
    {
      LCX = mouseX;
    }
  }
  if(mouseX> (HX-20) && mouseY > (HY-20) && mouseX < (HX + 20) && mouseY < (HY + 20) && HoldScissors == false && GKey == false && SKey == false && CKey == false && PushCrate == false && PushCrateA == false)
  {
    HX = mouseX;
    HY = mouseY;
  }
  if(mouseX> (SX-10) && mouseY > (SY-20) && mouseX < (SX + 10) && mouseY < (SY + 20) && HoldHammer == false && GKey == false && SKey == false && CKey == false)
  {
    SX = mouseX;
    SY = mouseY;
  }
}

void mousePressed()
{
  if(mouseX> (RX-20) && mouseY > (RY-20) && mouseX < (RX + 20) && mouseY < (RY + 20))
  {
    OChest = true;
  }
  if (mouseX > (D1X-10) && mouseY > (DY-15) && mouseX < (D1X + 10) && mouseY < (DY + 15))
  {
    open= true;
  }
 if(mouseX> (GKX-10) && mouseY > (GKY-20) && mouseX < (GKX + 10) && mouseY < (GKY + 20))
  {
    GKey = true;
  }
  else
  {
    GKey = false;
  }
  if(mouseX> (SKX-10) && mouseY > (SKY-20) && mouseX < (SKX + 10) && mouseY < (SKY + 20))
  {
    SKey = true;
  }
  else
  {
    SKey = false;
  }
  if(mouseX> (CKX-10) && mouseY > (CKY-20) && mouseX < (CKX + 10) && mouseY < (CKY + 20))
  {
    CKey = true;
  }
  else
  {
    CKey = false;
  }
  if (mouseX > (D2X-10) && mouseY > (DY-15) && mouseX < (D2X + 10) && mouseY < (DY + 15))
  {
    open2= true;
  }
  if(mouseX> (SX-10) && mouseY > (SY-20) && mouseX < (SX + 10) && mouseY < (SY + 20))
  {
    HoldScissors = true;
  }
  else
  {
    HoldScissors = false;
  }
  if(mouseX> (HX-10) && mouseY > (HY-20) && mouseX < (HX + 10) && mouseY < (HY + 20))
  {
    HoldHammer = true;
  }
  else
  {
    HoldHammer = false;
  }
}

void mouseReleased()
{
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  PImage img;
  boolean loaded = false;
  float rad = 4;
  float hover = 0;
  float move = 0;
  float time = 1000;
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
     
  void render()
  {
    move = move + 1;
    hover = cos(frameCount* 0.1) * rad;
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
      this.x = this.x + (Torches.x-this.x)/time;
      this.y = this.y + (Torches.y - this.y)/time;
      if(open == true)
      {
        time = 500;
      }
      imageMode(CENTER);
      pushMatrix();
      translate((this.x), (this.y + hover));
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

class SpriteObjectStill
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  PImage img;
  boolean loaded = false;
  float HP = 100;

 SpriteObjectStill(String filename)
  {
    this.img = requestImage(filename);
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
      if(mouseX> (this.x-9) && mouseY > (this.y-24) && mouseX < (this.x + 9) && mouseY < (this.y + 24))
      {
        HP = HP - 1;
      }
    }
         
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



