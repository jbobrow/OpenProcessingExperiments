
/*Things to do
timer
score
*/

boolean canhurtBB=true;
import java.util.Iterator;

int screenNumber;

PImage image1,image2,image3,image4,thePlayer,theEnemy,theBoss;
PImage bground1,bground2;
int bgroundy, bgroundy2;

PFont font;

int startTime;
int x, y;

int pScore;
int pHealth = 25;

boolean upPressed, leftPressed, downPressed, rightPressed, rPressed;
ArrayList<Bullet> bullets;
boolean canShoot; 
theEnemy[] e;
theBoss[] BB;



void setup ()
{
  size(400, 500);
  smooth();
  background(0);
  rectMode(CENTER);
  imageMode(CENTER);
  noStroke();
  font = loadFont("Stencil-24.vlw");
  
  x = width / 2;
  y = 450;
  
  bullets = new ArrayList<Bullet>();
  canShoot = true;
  
  e = new theEnemy[5];
  for(int i=0; i<5; i++)
  {
    e[i] = new theEnemy();
  }
  BB = new theBoss[1];
  for(int i=0; i<1; i++)
  {
    BB[i] = new theBoss();
  }

  screenNumber = 0; 
  
  thePlayer = loadImage ("thePlayer.gif");
  theBoss = loadImage ("BOSS.gif");
  theEnemy = loadImage ("theEnemy.gif");
  image1 = loadImage ("Introduction.gif");
  image2 = loadImage ("Instructions1.gif");
  image3 = loadImage ("Congrats.gif");
  image4 = loadImage ("Dead.gif");
  
  bground1 = loadImage("theBackground.gif");
  bground2 = loadImage("theBackground2.gif");
  bgroundy = -2000;
  bgroundy2 = bgroundy-5000;
}


void draw ()
{
  noStroke();
  bgroundy +=1;
  bgroundy2+=1;
  //Introduction
  if (screenNumber == 0)
  {
    map1();
  }
  
  //Instruction
 else if (screenNumber == 1)
  {
    map2();
  }
  
  
  //Gameplay
  else if (screenNumber == 2)
  {
    image(bground1,200,bgroundy);
    image(bground2,200,bgroundy2);
    if(bgroundy-2500>height) bgroundy = bgroundy2-5000;
    if(bgroundy2-2500>height)bgroundy2 = bgroundy-5000;
    
    theBossShow();
    thePlayer();
    theEnemyShow();
    for (Iterator iterator = bullets.iterator(); iterator.hasNext();) 
    {
      Bullet s = (Bullet) iterator.next();
      s.show();
      if(s.y < 10) iterator.remove();
      for(int i=0; i<5; i++)
      {
        if(dist(s.x,s.y,e[i].a,e[i].b)<19)
        {
          s.x = -1000;
          noStroke();
          fill(255,255,0);  
          ellipse(e[i].a+random(-10,10), e[i].b+random(-10,10), 25, 25);
          e[i].eHealth -=1;
          pScore += 50;
          if(e[i].eHealth < 1)
          {
            fill(255,255,0);  
            ellipse(e[i].a, e[i].b, 55, 55);
            pScore += 200;
            e[i].b = random(-400,0);
            e[i].eHealth = 3;
          }
        }
      }
    }
    displayScore();
    Timer();
    displayPHealth();
  }
  
  
  //End Game
 else if (screenNumber == 3)
  {
    map4();
  }
  
  if(screenNumber == 4)
  {
    map5();
  }
}


void theEnemyShow()
{
  for(int i=0; i<5; i++)
  {
    e[i].eBullet();   
    e[i].show();
    e[i].move();
    if(e[i].b > 520)
    {
      pScore -= 100;
      e[i].b = random(-100,-1000);
      e[i].a = random(20,380);
    }
  }
}


void theBossShow()
{
  for(int i=0; i<1; i++)
  {
    BB[i].BBullets();
    BB[i].show();
  }
}


void displayPHealth()
{
    fill(255,150);
    textFont(font, 25);
    text(pHealth, 340, 490);
    text("LIVES", 320, 460);
    if (pHealth < 1)
    {
      map5();
    }
}
  


