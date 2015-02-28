
stuff[] a;
boolean reset, start;
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;
int x, y;
int u, v;
int s,d, speed,p;
int Playerspeed;
int screenNumber;
int score;
int Timer;
int j;

PFont font;


void setup()
{
  size(600, 600);
  smooth();
  fill(255);
  rectMode(CENTER);
  font = loadFont("BradleyHandITC-32.vlw");
  textFont(font, 50);
  a = new stuff [200];
  for(int i=0; i<a.length; i++)
  {
    a[i] = new stuff();
    a[i].u = (i*20)-50; 
    a[i].v = (int)random(-width,0);
    a[i].d = 15;  
    a[i].s = (int)random(75,100);
    a[i].c = color(0,random(0,100),random(150,255));
  }
  p = 10;
  x = width/4;
  y = height/2;
  speed = 2;
  screenNumber = 0;
}

void draw()
{ 

  background(0);
  if (screenNumber == 0)
  {
    startmenu();
    for(int i=0; i<a.length; i++)
  {
    a[i] = new stuff();
    a[i].u = (i*20)-50; 
    a[i].v = (int)random(-width,0);
    a[i].d = 15;  
    a[i].s = (int)random(75,100);
    a[i].c = color(0,random(0,100),random(150,255));
  }
  }
  else if (screenNumber == 1)
  {
    for(int i=0; i<a.length; i++)
    {
      a[i].move();
      a[i].show();
    }
    fill(255);
    showScores();
    drawPlayer();
    movePlayer();
    lose();
  }
  else if (screenNumber == 2)
  {
    endscore();
  }
  speed = (int)random(0,25);
}


