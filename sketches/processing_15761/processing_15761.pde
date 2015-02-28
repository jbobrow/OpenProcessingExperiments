
/* Dodge The Tiles
 by: Tani Koulikov
 Started: 11/04/11
 Finished: To be Announced
 */

Tiles[] a;
int speed;
int startTime;
int screenNumber;
float x,y,u,v;

PFont font;
PFont font2;
PFont font3;
PFont font4;
PFont font5;
PFont font6;

class Tiles
{
  float a,b,r;
  int s,v;
  color c;
  
  Tiles()
  {
    a = random(0,600);
    b = random(-400,10);
    c = color(156,165,0);
    r = 40;
    v = (int)random(3,6);
  }
  
  void show()
  {
    fill(c);
    rect(a,b,r,r);
  }
  
  void moveTile()
  {
    b += (r+height) * 0.001 *v;   
  }
}

void setup()
{
  size(600,600);
  font  = loadFont("Magneto-Bold-45.vlw");
  font2 = loadFont("LilyUPCItalic-45.vlw");
  font3 = loadFont("2.vlw");
  font4 = loadFont("Candara-Bold-48.vlw");
  font5 = loadFont("BlackadderITC-Regular-48.vlw");
  font6 = loadFont("BookmanOldStyle-48.vlw");
  x = 300; 
  y = 583;
  
 a=new Tiles[25];
 for(int i=0; i<25; i++)
 {
   a[i] = new Tiles();
 }
}

void draw()
{
  background(0);
  if(screenNumber == 0)
  {
    displayInstructions();
  }
  else if(screenNumber == 1)
  {
    moveCircle();
    drawCircle();
    checkOverlap();
    SpeedandTimer();
    TileDodge();
  }
}

void displayInstructions()
{
  fill(75,90,100);
  textFont(font,50);
  text("Dodge The Tiles", 85, 40);
  fill(90,100,110);
  textFont(font3, 20);
  text("Avoid the falling tiles using the left and right arrow keys",80,290);
  fill(80,90,100);
  textFont(font2,30);
  text("Press Shift to Start Dodging", 358, 590);
  if(keyCode == SHIFT)
  {
    screenNumber = 1;
    startTime = millis();
  }
}
void drawCircle()
{
  fill(0,100,0);
  ellipse(x,y,30,30);
  
}

void moveCircle()
{
  if(keyCode == RIGHT)
  {
    x = x+5;
  }
  if(keyCode == LEFT)
  {
    x = x-5;
  }
  if(x>600)
  {
    x=600;
  }
  if(x<0)
  {
    x=0;
  }
}

void checkOverlap()
{
 for(int i=0; i<25; i++)
 {
  if(dist(x,y, a[i].a,a[i].b)<15)
  {
    screenNumber = 2;
    fill(201,20,20);
    textFont(font5,40);
    text("YOU LOSE!",300,300);
    if(mousePressed == true)
    {
      screenNumber = 0;
    }
  }
 }
}

void SpeedandTimer()
{
  int m = millis();
  int timeLimit = startTime+60000;
  int timeRemaining = timeLimit - m;
  int secondsRemaining = timeRemaining/1000;
  
  if(secondsRemaining <= 0) screenNumber = 3;
  fill(17,109,183);
  textFont(font4,60);
  text(secondsRemaining,255,38);
  
 for(int i=0; i<25; i++)
 {
  a[i].v = 6;
  if(secondsRemaining < 50) a[i].v = 7;
  if(secondsRemaining < 40) a[i].v = 8;
  if(secondsRemaining < 30) a[i].v = 9;
  if(secondsRemaining < 20) a[i].v = 10;
  if(secondsRemaining < 10)
  {
    screenNumber = 3;
    fill(12,125,12);
    textFont(font5,50);
    text("YOU WIN!");
    
 }
}
}

void TileDodge()
{
 for(int i=0; i<25; i++)
 {
   a[i].moveTile();
   a[i].show();
   if (a[i].b > 600)
   {
     a[i].b = random(-300,10);
     a[i].a = (int)random(0,600);
   }
 }
 
}
  



