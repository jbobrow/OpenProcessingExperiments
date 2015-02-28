
//declare global variables
int height = 900; //vertical height of screen
int width = 800; //horizontal height of screen
float xLoc = 100; //horizontal position of sprite
float yLoc = 400; //vertical position of sprite
int s; //current second
int h; //current hour
int lastSecond; //previous second
ArrayList bullets; //all the bullets currently on screen
boolean toRemove; //indiciates whether a bullet should be removed
int threshhold; //line at which bullets are removed
int lifeCount; //how many lives you have
int bombMeter; //how much bomb strength you have
boolean gameOver;

int larger; //large limit of circle size
int smaller; //small limit of circle size

PImage spriteDude;
PImage heart;
PImage gameover;
PImage bullet15;

//to keep track of best time
int startHour;
int startMin;
int startSec;

void setup()
{
  size(width, height);
  background(0);
  noStroke();
  smooth();
  bullets = new ArrayList();
  threshhold = -10;
  lifeCount = 10;
  bombMeter = 1000;
  gameOver = false;
  
  startHour = hour();
  startMin = minute();
  startSec = second();
  
  spriteDude = loadImage("spriteDude.gif");
  heart = loadImage("heart.gif");
  gameover = loadImage("gameover.gif");
  bullet15 = loadImage("bullet.gif");

  larger = 15;
  smaller = 15;
}

int i = width;
int sCount = 0;
Bullet b;
int col = 0;

void draw()
{
  if(gameOver == false){
    
    h = hour();
    
    //switches backgrounds depending on hour
    //currently colors, but will be actual drawn backgrounds
    switch(h) {
     case 0: 
        background(0,0,0);
        break;
     case 1: 
       background(33,4,4);
       break;
     case 2: 
        background(54,11,11);
        break;
     case 3: 
        background(77,23,23);
        break;
     case 4:
        background(98,34,34);
        break;
     case 5: 
        background(111,44,44);
        break;
     case 6: 
       background(139,70,70);
       break;
     case 7: 
        background(162,95,95);
        break;
     case 8: 
        background(183,122,122);
        break;
     case 9:
        background(201,150,150);
        break;
     case 10: 
        background(219,179,179);
        break;
     case 11: 
       background(240,215,215);
       break;
     case 12: 
        background(216,210,210);
        break;
     case 13: 
        background(219,179,179);
        break;
     case 14:
        background(201,150,150);
        break;
     case 15: 
        background(183,122,122);
        break;
     case 16: 
       background(162,95,95);
       break;
     case 17: 
        background(139,70,70);
        break;
     case 18: 
        background(111,44,44);
        break;
     case 19:
        background(98,34,34);
        break;
      case 20: 
       background(77,23,23);
       break;
     case 21: 
        background(54,11,11);
        break;
     case 22: 
        background(33,4,4);
        break;
     case 23:
        background(0,0,0);
        break;  
    }
    //background(100,100,col);
    
    //generate bullets each second
    fill(255);
    s = second();
    sCount = s;
    if( s == 0 ) sCount = 0;
    if( s != lastSecond){
      for(int i = 0; i < sCount; i++){
        bullets.add(new Bullet(int(random(width, width + 200)) , int(random(200,height)), int(random(smaller,larger)) ));
      }
      lastSecond = s;
      sCount++;
    }else{ 
      for( int i = 0; i < bullets.size(); i++ ) {
        b = (Bullet) bullets.get(i);
        b.update();
      }
    }
    
    //remove bullets that are off of the screen
    //also keep track of the life that player character has
    for( int i = 0; i < bullets.size(); i++)
    {
      b = (Bullet) bullets.get(i);
      if(10 >= abs(b.xPos - xLoc) && 10 >= abs(b.yPos - yLoc))
        lifeCount--;
      b.removeBullet();
      if(toRemove == true)
        bullets.remove(i);
    }
    
    //player character sprite placeholder
    //fill(255,255,0);
    //ellipse(xLoc, yLoc, 20,20);
    image(spriteDude, xLoc, yLoc);
    
    //movement of player character
    if (keyPressed == true){
        if(key == CODED){
        if( keyCode == UP) {
          if( yLoc < 100)
            yLoc = 100;
          else
            yLoc = yLoc - 7;
        }
        else if( keyCode == DOWN){
          if( yLoc > 785)
            yLoc = 785;
          else
            yLoc = yLoc + 7;
        }
        else if( keyCode == KeyEvent.VK_LEFT ){
          if( xLoc < 10)
            xLoc = 10;
          else
            xLoc = xLoc - 7;
        }
        else if( keyCode == KeyEvent.VK_RIGHT ){
          if( xLoc > 720)
            xLoc = 720;
          else
            xLoc = xLoc + 7;
        }
      }
    }
    
    //stats visualization at the top of screen
    //hearts
    fill(250,202,244);
    for(int i = 0; i < lifeCount; i++)
      image(heart, 40+50*i, 30);
      //ellipse(40 + 50*i, 30, 20, 20);
      
    //bomb meter
    fill(250,214,136);
    rect(50, 70, (0.5)*bombMeter, 20);
    //clock visualization
    fill(255);
    textSize(20);
    text( hour() + ":" + minute() + ":" + second(), 700, 30);
    text( (hour() - startHour) + ":" + (minute() - startMin) + ":" + abs(second() - startSec), 700, 60);
  
    if(lifeCount == 0)
      gameOver = true;
  }
  else{    
    background(255);
    image(gameover, 150,100);
    fill(0);
    text("GAME OVER!", 350, 600);
    text("Press shift to try again.", 300, 700);
    if (keyPressed == true){
        if(key == CODED){
          if( keyCode == KeyEvent.VK_SHIFT) {
            gameOver = false;
            lifeCount = 10;
            bombMeter = 1000;
            bullets = new ArrayList();
            startHour = hour();
            startMin = minute();
            startSec = second();
            xLoc = 100;
            yLoc = 400;
          }
        }
    }
  }
}


void keyPressed()
{
  int pastTime = second();
  if(key == CODED){
    if( keyCode == KeyEvent.VK_SHIFT )
      {
        if(bombMeter > 0){
          threshhold = 500;
          bombMeter--;
          fill(255,227,134);
          for(int i = -350; i < 500; i=i+50)
          triangle(xLoc+60, yLoc+50, xLoc+60, yLoc+20, 500, yLoc+i );
        }
      }
  }
}

void keyReleased()
{
  threshhold = -10;
}

class Bullet{
 int xPos, yPos, speed, m, bulletSize;
 boolean goUp;
 
 Bullet(int x, int y, int b){
   yPos = y;
   xPos = x;
   speed = 0;
   m = minute();
   goUp = false;
   bulletSize = b;
   //num = n;
 }
 
 void removeBullet() {
   if( xPos < threshhold)
     toRemove = true;
   else
     toRemove = false;   
 }
 
 void update() {
   
   ellipse(xPos, yPos, bulletSize, bulletSize);
   
   if( 0 <= m && m < 15)
   {
     xPos = xPos - speed/15;
     speed++;
     larger = 15;
     smaller = 15;
   }
   else if( 15 <= m && m < 30)
   {
     xPos = xPos + int(random(0, 15) ) - 2* speed/15;
     larger  = 10;
     smaller = 10;
     if(goUp == false)
       {
         yPos = yPos - int(random(0,10)) ;
         goUp = true;
       }
       
     if(goUp == true) 
     {
       yPos = yPos + int(random(0,10)) ;
       goUp = false;
     }
     
       speed++;
   }
   else if( 30 <= m && m < 45)
   {
     xPos = xPos - 3*speed/15;
     smaller = 5;
     larger = 10;
     if(goUp == false)
       {
         yPos = yPos - 1;
         goUp = true;
       }
       
     if(goUp == true) 
     {
       yPos = yPos + 1;
       goUp = false;
     }
     
       speed++;
   }
   else if( 45 <= m && m < 60)
     {
       xPos = xPos - speed/15;
       larger = 50;
       smaller = 2;
       if(goUp == false)
       {
         yPos = yPos - int(random(0,10)) ;
         goUp = true;
       }
       
     if(goUp == true) 
     {
       yPos = yPos + int(random(0,10)) ;
       goUp = false;
     }
     
       speed++;
     }
 }
}

