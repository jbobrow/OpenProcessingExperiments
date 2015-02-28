
/* Dodge Da Bullet  
by Wen Zhao,Liang
   Jeffrey Xu
   Lao Delozada
   */


PFont font;

PImage smoke;
PImage guy;
PImage title; 
PImage win;
PImage lose;
int screenNumber;
Bullet1[]b1;
Bullet2[]b2;
float o,p;
float h;
boolean wPressed, aPressed, sPressed, dPressed, enterPressed;
int i;
int m,timeLimit,timeRemaining,secondsRemaining,startTime;

void setup()
{
  screenNumber=0;
  o=500;
  p=500;
  h=400;
  size(950,950);
  font = loadFont("AgencyFB-Reg-48.vlw");
  smoke = loadImage("smoke.gif");
  guy = loadImage("guy.gif");
  title = loadImage("Title.gif");
  win = loadImage("Winner.gif");
  lose = loadImage("loser.gif");


  b1=new Bullet1[600];
  for(i=0; i<600; i++)
  {
    b1[i]=new Bullet1();
    b1[i].x=random(-1.5*width,1.5*width); 
    b1[i].y=random(-3*height,0);
    b1[i].s=random(-10,10);
    b1[i].t=random(-10,10);
    b1[i].v=1.5;
  }



  b2=new Bullet2[600];
  for(i=0; i<600;i++)
  {
    b2[i]=new Bullet2();
    b2[i].j=random(-1.5*width,1.5*width); 
    b2[i].k=random(2*height,0);
    b2[i].s=random(-10,10);
    b2[i].t=random(-10,10);
    b2[i].v=1;
  }
}

void draw()
{
  if(screenNumber == 0)
  {
    h=400;
    Title();
    if(enterPressed) screenNumber=1; 
    startTime = millis();
  }
  else if(screenNumber == 1)
  {
    image(smoke,0,0);
    for(int i=0; i<b1.length; i++)
    {
      b1[i].show();
      b1[i].move();
    }

    for(int i=0; i<b2.length; i++)
    {
      b2[i].show();
      b2[i].move();
    }
    HP();
    Player();
    movePlayer();
    Timer();
  }
  else if(screenNumber == 2)
  {
    Win();
  }
  else if(screenNumber == 3)
  {
    Lose();
  }
}

void HP()
{                                  
  fill(255,0,0);   
  rect(width/2, 25, h, 25);
  stroke(255);
  noFill();
  rect(width/2, 25, 400, 25);
  if(h<0)
  {
    secondsRemaining=0;
    screenNumber=3;
  }
  fill(255);
  text("HP :",395,50);
}

class Bullet1
{
  float x,y,s,t,v;
  void show()
  {
    smooth();
    noStroke();
    fill(255,255,0);
    ellipse(x,y,5,5);
  }

  void move()
  {
    x=x+s*v;
    y=y+t*v;
    if(y>1.5*height) 
    {
      x=random(-1.5*width,1.5*width);  
      y=random(-1.5*height,0);
    }
    if(abs(x-o)<=40 && abs(y-p)<=30) 
    {
      h=h-10;
      fill(255,0,0);
      ellipse(x,y,10,10);
      ellipse(x-5,y+5,10,10);
      ellipse(x+5,y+5,20,20);
    }
  }
}

class Bullet2
{
  float j,k,s,t,v;
  void show()
  {
    smooth();
    noStroke();
    fill(255,255,0);
    ellipse(j,k,5,5);
  }
  void move()
  {
    j=j-s*v;
    k=k-t*v;
    if(k<-1.5*height)
    {
      j=random(-1.5*width,1.5*width);
      k=random(1.5*height,1.5*height);
    }
    if(abs(j-o)<=40 && abs(k-p)<=30)
    { 
      h=h-10;      
      fill(255,0,0);
      ellipse(o,p,10,10);
      ellipse(o-5,p+10,10,10);
      ellipse(o+5,p+10,20,20);
    }
  }
}

void Win()
{
  image(win,0,0);
  if(mousePressed) screenNumber = 0;
}

void Lose()
{
  if(h<1)
  {
    image(lose,0,0);
    if(mousePressed) screenNumber = 0;
  }
}

void Title()
{
  image(title, -25, 0);
  textSize(20);
  fill(255,0,0);
  text("The Three Pro Production", 703,926);
  fill(255);
  text("The Three Pro Production", 700,925);
}

void Timer()
{
  m = millis();
  timeLimit = startTime+30000;
  timeRemaining = timeLimit - m;
  secondsRemaining = (timeRemaining+1000)/1000;

  fill(255);
  textSize(40);
  text(secondsRemaining, 550,100);
  text("Timer 0:", 400, 100);
  if (secondsRemaining == 0) {
    screenNumber = 2;
  }
}

void Player()
{
  image(guy,o,p);
}

void movePlayer()
{
  if(wPressed) p=p-5;
  if(aPressed) o=o-5;
  if(sPressed) p=p+5;
  if(dPressed) o=o+5;
  if(o>width) 
  {
    o=0;
  }
  if(o<0)
  {
    o=width;
  }
  if(p>height)
  {
    p=0;
  }
  if(p<0)
  {
    p=height;
  }
}


void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
  if (keyCode == ENTER) enterPressed = true;
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
  if (keyCode == ENTER) enterPressed = false;
}


