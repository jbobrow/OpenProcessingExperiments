
final int keyDownArraySize = 127;
int ScreenNumber;
//int demonslayer =1;
//int mercedes =1;
int cannonshooter =1;
RedSnail[] mob1;
BlueSnail[] mob2;
Snail[] mob3;
BossSnail[] boss;
int x, y;
int a, b;
int c, d;
int e, f;
int RedSnailNum =0;
int BlueSnailNum =3;
int SnailNum = 3;
int BossSnailNum =1;
float xspeed;
float yjump;
float juvX, juvY, juvSpeed, maxSpeed, ySpeed, gravity;
float juvXspeed, juvYspeed, juvFriction, juvYacceleration, juvAcceleration;
float jump_y = 1;              // jump
float jump_easing = 0.1;
float targetY_jump = 100;
PImage rb;
PImage demonslayerL;
PImage demonslayerR;
PImage demonslayeratkL;
PImage demonslayeratkL1;
PImage demonslayeratkR;
PImage demonslayeratkR1;
PImage demonslayerjumpL;
PImage demonslayerjumpR;
PImage demonslayerhp1;
PImage mathequation1;
PImage mercedes;
PImage mercedesL;
PImage mercedesR;
PImage cannonshooterL;
PImage cannonshooterR;
PImage cannonshooteratk;
PImage map1;
PImage selection;
PImage StartScreen;
PImage Instructions;
PImage RedSnail;
PImage BlueSnail;
PImage Snail;
PImage BossSnail;
boolean upPressed, leftPressed, downPressed, rightPressed;
boolean zPressed, aPressed, sPressed, xPressed;
boolean jump = false;
boolean[] keyDown = new boolean[keyDownArraySize];

int Direction = 1;
int Direction1 = 2;
int Direction2 = 3;
int Direction3 = 4;
int Direction4 = 5;
int Direction5 = 6;
int Direction6 = 7;
int SnailDirection =1;
int SnailDirection2 =2;
int timer;
int juvHeight = 60;
int juvWidth = 80;

import ddf.minim.*;
Minim minim;
AudioPlayer music;



void setup()
{
  size(1000, 1000);
  smooth();
//  minim = new Minim(this);
  //music = minim.loadFile("backgroundmusic.mp3",1024);
//  music.loop();
  a=10;
  b=760;
  c=10;
  d=760;
  e=10;
  f=780;
  x=0;
  /*juvX=10;
  juvY=780;*/
  initJuv();
  initKeyDownArray();
  initPlatforms();
  ScreenNumber = 0;
  timer = 60;
  rb = loadImage("ms3.png");
  mercedesL = loadImage("mercedesstandleft.png");
  mercedesR = loadImage("mercedesstand.png");
  selection = loadImage("msselection.png");
  StartScreen = loadImage("startscreen(1).png");
  map1 = loadImage("map1.png");
  demonslayerL = loadImage("demonslayer.png");
  demonslayeratkL = loadImage("demonslayeratk.png");
  demonslayeratkR = loadImage("demonslayeratkright.png");
  demonslayerjumpL =loadImage("demonslayerjumpleft.png");
  demonslayerjumpR =loadImage("demonslayerjumpright.png");
  demonslayerR = loadImage("DemonSlayerRight.png");
  demonslayerhp1 = loadImage("demonslayerhpbar.png");
  cannonshooterL = loadImage("cannonshooterleft.png");
  cannonshooterR = loadImage("cannonshooter.png");
  cannonshooteratk = loadImage("cannonshotteratk.png");
  Instructions = loadImage("ms4.png");
  RedSnail = loadImage("map1m2.png");
  BlueSnail = loadImage("map1m3.png");
  Snail = loadImage("map1m1.png");
  BossSnail = loadImage("BossSnail.png");
  mathequation1 = loadImage("me1.png");

  mob1 = new RedSnail[RedSnailNum];
  for (int i=0; i<RedSnailNum; i++)
  {
    mob1[i] = new RedSnail();
    mob1[i].x = random(500, 850);
    // mob1[i].y = (270);
    mob1[i].y = (490);
  }

  mob2 = new BlueSnail[BlueSnailNum];
  for (int i=0; i<BlueSnailNum; i++)
  {
    mob2[i] = new BlueSnail();
    mob2[i].x = random(500, 850);
    mob2[i].y = (490);
  }

  mob3 = new Snail[SnailNum];
  for (int i=0; i<SnailNum; i++)
  {
    mob3[i] = new Snail();
    mob3[i].x = random(350, 885);
    mob3[i].y = (715);
  }
  boss = new BossSnail[BossSnailNum];
  for (int i=0; i<BossSnailNum; i++)
  {
    boss[i] = new BossSnail();
    boss[i].x= 580;
    boss[i].y = (90);
  }
}

void draw()
{
  if (ScreenNumber == 0)
  {
    image(StartScreen, 0, 0);
    // rect(375,610,275,195);
    // rect(535,800,65,63);
    fill(0);
    text("If you are new to the game then click the lightbulb above the maple admin.", 125, 600);
    textSize(20);
    if (mouseX>370 && mouseX<650 && mouseY>620 && mouseY<795 && mousePressed )
    {
      ScreenNumber = 3;
      mousePressed = false;
    }
    if (mouseX>535 && mouseX<599 && mouseY>800 && mouseY<863 && mousePressed )
    {
      ScreenNumber = 2;
      mousePressed = false;
    }
  }
  if (ScreenNumber == 2)
  {
    image(Instructions, 0, 0);
    // rect(685,865,85,27);
    // rect(775,865,90,27);
    //rect(112,867,123,25);
    if (mouseX>685 && mouseX<770 && mouseY>865 && mouseY<882 && mousePressed )
    {
      ScreenNumber = 3;
      mousePressed = false;
    }
    if (mouseX>775 && mouseX<865 && mouseY>865 && mouseY<882 && mousePressed )
    {
      ScreenNumber=0;
    }
    if (mouseX>112 && mouseX<235 && mouseY>867 && mouseY<892 && mousePressed)
    {
      ScreenNumber=0;
    }
  }

  if (ScreenNumber == 3)
  {
    image(selection, 0, 0);
    //rect(670,515,325,515);
    text("Only the Demon Slayer character is working at the moment.", 62, 500);
    textSize(30);
    if ( mouseX<325 && mouseX>10  && mouseY>515 && mouseY<1000 && mousePressed)
    {
      mousePressed = true;
      x=1;
      ScreenNumber = 4;
    }
    if (mouseX<665 && mouseX>340 && mouseY>515 && mouseY<1000 && mousePressed)
    {
      mousePressed = true;
      x=2;
      ScreenNumber = 4;
    }
    if (mouseX<995 && mouseX>670 && mouseY>515 && mouseY<1000 && mousePressed)
    {
      mousePressed = true;
      x=3;
      ScreenNumber =4;
    }
  }
  if (ScreenNumber == 4)
  {
    image(map1, 0, 0);
    drawdshpb1();
    drawme1();
    movePlayers();
    fill(0);
    textSize(30);
    text("Press the A key to attack and Z to jump.", 100, 400);
    text("Press the left and right arrow keys to move.", 100, 450);
    if (BlueSnailNum ==3)
    {
      fill(255, 0, 0);
      textSize(100); 
      text("3", 415, 132);
    }
    if (BlueSnailNum ==2)
    {
      fill(255, 0, 0);
      textSize(100); 
      text("2", 415, 132);
    }
    if (BlueSnailNum ==1)
    {
      fill(255, 0, 0);
      textSize(100); 
      text("1", 415, 132);
    }
    if (SnailNum ==3)
    {
      fill(255, 0, 0);
      textSize(100); 
      text("3", 415, 260);
    }
    if (SnailNum ==2)
    {
      fill(255, 0, 0);
      textSize(100); 
      text("2", 415, 260);
    }
    if (SnailNum ==1)
    {
      fill(255, 0, 0);
      textSize(100); 
      text("1", 415, 260);
    }
    if (BlueSnailNum == 1 && SnailNum ==1)
    {
      BossSnailNum=0;
      ScreenNumber=5;
    }

    for (int i=0; i<mob1.length; i++)
    {
      mob1[i].show();
      mob1[i].x= mob1[i].x+ random(-2, 2);
      if (mob1[i].x<500)
      {
        mob1[i].x= 520;
      }
      if (mob1[i].x>850)
      {
        mob1[i].x=830;
      }
    }
    for (int i=0; i<mob2.length; i++)
    {
      mob2[i].show();
      mob2[i].x= mob2[i].x+ random(-2, 2);
      if (mob2[i].x<500)
      {
        mob2[i].x= 520;
      }
      if (mob2[i].x>850)
      {
        mob2[i].x=830;
      }
    }
    for (int i=0; i<mob3.length; i++)
    {
      mob3[i].show();
      mob3[i].x= mob3[i].x+ random(-2, 2);
      if (mob3[i].x<350)
      {
        mob3[i].x= 370;
      }
      if (mob3[i].x>875)
      {
        mob3[i].x=870;
      }
    }
    for (int i=0; i<boss.length; i++)
    {
      boss[i].show();
    }

    if (x==2)
    {
      //  image(mercedesL, c, d);
      if (Direction == 2) 
      {
        image(mercedesR, c, d);
      }
      if (Direction1== 0) 
      {
        image(mercedesL, c, d);
      }
    }
    if (x==3)
    {
      /* println(juvX);
       println(juvY);*/
      println(Direction);
      if (Direction == 1)
      {
        image(demonslayerR, juvX, juvY, juvHeight, juvWidth);
        juvY = juvY + ySpeed;
        ySpeed = ySpeed + gravity;
      }
      if (Direction == 0) 
      {
        image(demonslayerL, juvX, juvY, juvHeight, juvWidth);
        juvY = juvY + ySpeed;
        ySpeed = ySpeed + gravity;
      }
      if (juvY > (height - juvHeight)) {
        ySpeed = ySpeed * 0;
      }
      if (aPressed && Direction4==5)
      {
        image(demonslayeratkL, juvX, juvY, juvHeight, juvWidth);
      }
      if (aPressed && Direction6 ==7)
      {
        image(demonslayeratkR, juvX, juvY, juvHeight, juvWidth);
      }
      /*   if (zPressed && Direction==1)
       {
       image(demonslayerjumpR,juvX, juvY, juvHeight, juvWidth);
       }
       
       if (zPressed && Direction==2)
       {
       image(demonslayerjumpL,juvX, juvY, juvHeight, juvWidth);
       } */
      else if (juvX>243 && juvY>=800)
      {
        juvY=juvY+125;
        //juvX=340;
      }
      for (int i=0; i<mob1.length; i++) 
        if ((mob1[i].x>=juvX-20) && (mob1[i].x<=juvX+20) && (mob1[i].y>=juvY-20) && (mob1[i].y<=juvY+20) && aPressed)
        {
          RedSnailNum--;
        }
      for (int i=0; i<mob2.length; i++) 
        if (aPressed && (mob2[i].x>=juvX-20) && (mob2[i].x<=juvX+20) && (mob2[i].y>=juvY-20) && (mob2[i].y<=juvY+20))
        {
          BlueSnailNum=1;
        }
      for (int i=0; i<mob3.length; i++) 
        if (aPressed && (mob3[i].x>=juvX-20) && (mob3[i].x<=juvX+20) && (mob3[i].y>=juvY-20) && (mob3[i].y<=juvY+20))
        {
          SnailNum=1;
        }


      /*  if (aPressed && Direction5 ==6)
       {
       image(demonslayeratkR, a, b);
       }
       */
      /*if (rightPressed = true)
       {
       image(demonslayerR, a, b);
       }
      /* if (leftPressed = true)
       {
       image(demonslayerL, a, b);
       }
       */
      /*  rect(500, 290, 350, 50);
       rect (500, 512, 350, 50);
       rect(350, 700, 535, 50);*/
      if (juvY>780)
      {
        juvY=780;
      }
    }
    if (x==1)
    {
      if (Direction2 == 3) 
      {
        image(cannonshooterR, e, f);
      }
      if (Direction == 0) 
      {
        image(cannonshooterL, e, f);
      }
      if (aPressed && Direction4 == 5) 
      {
        image(cannonshooteratk, e, f);
      }
    }
    if (ScreenNumber ==5)
    {
      background(0);
      fill(255);
      textSize(30);
      text ("My journey to get my revenge on the Black Mage will be", 50, 500);
      text ("continued...", 50, 550);
    }
  }
}

void keyPressed()
{
  if (keyCode < keyDownArraySize) {
    keyDown[keyCode] = true;
  }
  if (keyCode == RIGHT) 
  {
    Direction = 1;
    Direction1 = 2;
    Direction2= 3;
    // Direction4= 5;
    rightPressed = true;
  }
  if (keyCode == LEFT)  
  {
    Direction = 0;
    Direction1 = 0;
    Direction2 = 0;
    Direction3 = 0;
    leftPressed = true;
  }
  if (key =='z')
  {
    zPressed = true;
    // Direction= 2;
    jumping();
  }
  if (key =='a' && Direction ==1)
  { 
    Direction5= 6;
    Direction6= 7;
    Direction= 2;
    aPressed = true;
  }
  if (keyDown [10]) {
  }
  if (key =='a' && Direction ==0)
  {

    Direction4=5; 
    Direction =2;
    aPressed = true;
  }
  if (key =='a' && Direction ==1)
  {
    Direction5=6;
    Direction6 =7;
    Direction =2;
    aPressed = true;
  }
  if (key =='s')
  {
    Direction =0;
    sPressed=true;
  }

  else if (aPressed == false)
  {
    //  Direction=2;
    Direction3=0;
    Direction4=0;
    Direction5=0;
    Direction6=0;
  }
  else if (sPressed == false)
  {
    Direction=2;
  }
  /* else*/
  /*else if (keyCode == UP)    upPressed = true;
   else if (keyCode == DOWN)  downPressed = true;*/
}
void checkScreenBounds() {
  if (juvX > width) {
    juvX = 0;
  }
  else if (juvX < 0) {
    juvX = width;
  }
  if (juvY >= (height - juvHeight)) {
    juvY = (height - juvHeight);
  }
}
void handleInput() {
  if (keyDown[RIGHT]) {
    juvXspeed += juvSpeed;
  }
  if (keyDown[LEFT]) {
    juvXspeed -= juvSpeed;
  }
}

void jumping() {
  juvY -= 100;
}
void initPlatforms() {
  //draw platforms here
  rect(500, 290, 350, 50);
  rect (500, 512, 350, 50);
  rect(350, 700, 535, 50);
}
void keyReleased()
{
  if (keyCode < keyDownArraySize) {
    keyDown[keyCode] = false;
  }
  if (rightPressed = true)
  {
    rightPressed = false;
  } 
  if (leftPressed = true)
  {
    leftPressed = false;
  } 
  if (upPressed = true)
  {
    upPressed = false;
  } 
  if (downPressed = true)
  {
    downPressed = false;
  } 
  if (zPressed =true)
  {
    zPressed = false;
    Direction=0;
  }
  if (aPressed = true)
  {
    //  Direction =1;
    Direction3 =0; 
    Direction4 = 0;
    Direction5 =0;
    Direction6 =0;
    aPressed= false;
  }
  if (sPressed = true)
  {
    Direction =0;
    sPressed = false;
  }
}
void initJuv() {

  //juvX = float (width / 2);
  //juvY = float (height - juvHeight);
  juvAcceleration = .10;
  gravity = 0.05;
  ySpeed = 0;
  juvFriction = .7;
  juvSpeed = 3;
  maxSpeed = 10;
}
void initKeyDownArray() {
  for (int i=0; i<keyDownArraySize; i++) {
    keyDown[i] = false;
  }
}

void movePlayers()
{
  if (rightPressed) /* a=a+3;*/ juvX=juvX+3;
  if (leftPressed)  /*a=a-3;*/ juvX=juvX-3;
  if (zPressed)   juvY=juvY-5;
  //  if (aPressed && Direction == false) 
  //  {
  //    image();
  // }
  //if (upPressed)    b=b-3;
  // if (downPressed)  b=b+3;
  if (rightPressed) c=a+3;
  if (leftPressed) c=a-3;
  //if (upPressed)    d=d-3;
  //if (downPressed)  d=d+3; 
  if (rightPressed) e=e+3;
  if (leftPressed) e=e-3;
  //if (upPressed)    f=f-3;
  // if (downPressed)  f=f+3; 
  // if (rightPressed) g=g+3;
  //if (leftPressed)  g=g-3;
  // if (upPressed)    h=h-3;
  // if (downPressed)  h=h+3;
}

void drawdshpb1()
{
  image(demonslayerhp1, 0, 935, 1000, 65);
}
void drawme1()
{
  image (mathequation1, 0, 0);
}
class demonslayer
{
  float a, b;
} 
//class demonslayer
//{
//float a, b;
//} 


class mercedes
{
  float c, d;
}

class cannonshooter
{
  float e, f;
}

class RedSnail
{
  float x, y;
  void show()
  {
    image(RedSnail, x, y, 30, 30);
  }
}

class BlueSnail
{
  float x, y;
  void show()
  {
    image(BlueSnail, x, y, 30, 30);
  }
}

class Snail
{
  float x, y;
  void show()
  {
    image(Snail, x, y, 30, 30);
  }
}

class BossSnail
{
  float x, y;
  void show()
  {
    image(BossSnail, x, y, 200, 200);
  }
}
class timer
{
  float x, y;
  void show()
  {
  }
}


