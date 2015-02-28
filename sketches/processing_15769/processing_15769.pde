
/* Speedy
 by Wen Zhao, Liang
 Last updated: 11/19/2010
 */

boolean wPressed, iPressed, enterPressed;
int screenNumber;
float r1,r2;
PFont font;
int startTime;
int x,y;
int s;
int m,timeLimit,timeRemaining,secondsRemaining;
int j,o;

void setup()
{
  size(600,400);
  screenNumber = 0;
  font = loadFont("AgencyFB-Reg-32.vlw");
  x=110;
  y=110;
  s=20;
}

void draw()
{
  fill(0,70);
  rect(0,0,width,height);
  if (screenNumber == 0)
  {
    displayInstructions();
  }
  else if(screenNumber == 1)
  {
    background(0);
    Layout();
    Balls();

    m = millis();
    timeLimit = startTime+10000;
    timeRemaining = timeLimit - m;
    secondsRemaining = (timeRemaining+1000)/1000;

    fill(255);
    text(secondsRemaining, 339,80);
    text("Timer 0:0:", 250, 80);

    if(secondsRemaining<=0 && r2>r1)
    {
      secondsRemaining=0;
      screenNumber=2;
      r1=0;
      r2=0;
    }
    if(r2>300)
    {
      screenNumber=2;
      r1=0;
      r2=0;
    }
    if(secondsRemaining<=0 && r1>r2)
    {
      secondsRemaining=0;
      screenNumber=3;
      r1=0;
      r2=0;
    }
    if(secondsRemaining<4)
    {
      fill(255,0,0);
      text(secondsRemaining, 339,80);
    }
    if(r1>300)
    {
      screenNumber=3;
      r1=0;
      r2=0;
    }
  }
  else if(screenNumber == 2)
  {
    displayWinner1();
    if(keyCode == ENTER) screenNumber=0;
  }
  else if(screenNumber ==3)
  {
    displayWinner2();
    if(keyCode == ENTER) screenNumber=0;
  }
}

void displayInstructions()
{
  fill(255,0,0,50);
  textSize(100);
  text("Speedy!", x-10,y);
  fill(255,0,0,40);
  text("Speedy!", x-20,y);
  fill(255,0,0,30);
  text("Speedy!", x-30,y);
  fill(255,0,0,20);
  text("Speedy!", x-40,y);
  fill(255,0,0,10);
  text("Speedy!", x-50,y);

  fill(255,0,0);
  textSize(100);
  text("Speedy!", x,y);

  fill(255);
  textSize(20);
  fill(0,255,0);
  text("1P: Click w as fast as possible!", 300, 215);
  fill(0,0,255);
  text("2P: Click i as fast as possible!", 300, 280);
  textSize(20);
  fill(random(0,255),random(0,255),random(0,255));
  text("Click the mouse to START!", 30,250);
  textSize(12);
  fill(255,255,0);
  text("Little Tips: If you hold the key after the other player does, that player's ball will keep getting larger,",40, 350);
  text("while your ball gets slightly smaller!", 200, 380);
  
  x=x+5;

  if(x<300)
  {
    x=x+s;
  }
  else if(x>300 && x>600)
  {
    x=-600;
  }

  if(mousePressed)
  {
    screenNumber = 1;
    startTime = millis();
  }
}

void Layout()
{
  strokeWeight(2);
  stroke(255);
  line(0,100,width,100);
  line(300,100,300,height);
  textSize(20);
  fill(0,255,0);
  text("1P",15,120);
  fill(0,0,255);  
  text("2P",315,120);
}

void Balls()
{
  noStroke();
  smooth();
  fill(0,r1,0);
  ellipse(150,250,r1,r1);
  fill(0,0,r2);
  ellipse(450,250,r2,r2);
  if(r1>300)
  {
    r1=0;
  }
  if(r2>300)
  {
    r2=0;
  }
  r1++;
  r2++;

  if(wPressed) r1=r1-1.1;
  if(iPressed) r2=r2-1.1;
}

void displayWinner1()
{
  fill(0,255,0);
  text("1P Wins!", 300, 250);
  text("Click Enter to try again!",300,300);
}

void displayWinner2()
{
  fill(0,0,255);
  text("2P Wins!", 300, 250);
  text("Click Enter to try again!",300,300);
}


void keyTyped()
{
  if (key == 'w') wPressed = true;
  if (key == 'i') iPressed = true;
}

void keyPressed()
{
  j++;
  o++;
  if(j>1) wPressed = false;
  if(o>1) iPressed = false;
  if (key == 'w') wPressed = false;
  if (key == 'i') iPressed = false;
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'i') iPressed = false;
}

