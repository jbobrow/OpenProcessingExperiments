
/**
 Jimmy Lin
 November 4 2010
 **/
Raindrop [] a;
int screenNumber;
PFont font;
PImage lonely;
PImage plane;
float t,r;
int screenNum;
int startTime;
int m,timeLimit,timeRemaining,secondsRemaining;


void setup()
{
  size(600,600);
  lonely = loadImage ("lonely.gif");
  plane = loadImage ("plane.gif");
  screenNumber=0;

  a=new Raindrop[30];
  for(int i=0; i<30; i=i+1)
  {
    a[i] = new Raindrop();
    a[i].x1 = random(-200,width);
    a[i].x2 = a[i].x1+20;
    a[i].y1 = 0;
    a[i].y2 = 50;
    a[i].v = random(5,10);
  }
}

void draw()
{
  background(0);
  if (screenNumber==0)
  {
    DisPlayScreen0();
  }
  else if (screenNumber==1)
  {
    m = millis();
    timeLimit = startTime+120000;
    timeRemaining = timeLimit - m;
    secondsRemaining = (timeRemaining+2000)/1000;

    text(secondsRemaining, 10,80);
    if (secondsRemaining <= 0) background(255,0,0);

    DisPlayScreen1();
    for(int i=0; i<a.length; i++)
    {
      a[i].move();
      a[i].show();
    }

    if(secondsRemaining<=0)
    {
      secondsRemaining=0;
      screenNumber=2;
    }
  }
  else if(screenNumber==3)
  {
    lose();
  }
  else if(screenNumber==2)
  {
    win();
  }
}

void lose()
{
  fill(255,0,255);
  text("YOU LOSER!",300,300);
  text("Press Enter to restart the game!", 0,350);
}

void win()
{
  if(secondsRemaining<=0)
  {
    fill(255,0,255);
    text("YOU WINNER!",300,300);
    text("Press Enter to restart the game!", 0,350);
  }
}

void DisPlayScreen0()
{
  image(lonely,50,100);

  fill(255);
  textSize(42);
  font = loadFont("BookmanOldStyle-Bold-48.vlw");
  text("Click here to Start the GAME",20,90); 
  if(mousePressed) screenNumber = 1;
}

void DisPlayScreen1()
{
  image (plane,r,t);
  r=mouseX-25;
  t=mouseY-10;
}

class Raindrop
{
  float x1,y1,x2,y2,v;

  void show()
  {
    smooth();
    stroke(255,255);
    line(x1,y1,x2,y2);
  }

  void move()
  {
    x1=x1+20*0.01*v;
    y1=y1+50*0.01*v;
    x2=x2+20*0.01*v;
    y2=y2+50*0.01*v;    

    if(y2>625)
    {
      x1=random(-200,width);
      y1=0;
      x2 = x1+20;
      y2 = 50;
    }

    if(abs(x2 - mouseX) < 25 && abs(y2 - mouseY) < 8)
    {
      screenNumber = 3;
    }
  }
}

void keyPressed()
{
  if(keyCode == ENTER) 
  {
    screenNumber=0;
    startTime = millis();
  }
}


