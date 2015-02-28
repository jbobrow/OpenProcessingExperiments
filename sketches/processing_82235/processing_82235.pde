
PFont font;
PImage paper, skyward, plasma, hammer, meta, mario, link, kirby, red, samus, pong, nlose, nwin, darkrai, dimentio, wii, metroid, nebula;
import ddf.minim.*;
AudioPlayer menu, battle;
Minim minim;
int lives1=5;
int lives2=5;
int h=450;
int i=5;
int j=450;
int k=3;
int l=50;
int m=300;
int n=300;
int t=350;
float u=350;
int x=450;
int y=300;
Ball ace=new Ball();
Paddle hero=new Paddle();
Paddle villain=new Paddle();
boolean nintendo=false;
boolean win3=false;
boolean win4=false;
void setup()
{
  size(900, 600);
  minim = new Minim(this);
  battle=minim.loadFile("Boss Battle Song 1.mp3");
  battle.loop();
  paper=loadImage("Shadow Queen.png");
  skyward=loadImage("Ghirahim.png");
  plasma=loadImage("Ghetsis.png");
  hammer=loadImage("King Dedede.png");
  meta=loadImage("Ridley.png");
  mario=loadImage("Mario.png");
  link=loadImage("Link.png");
  kirby=loadImage("Sword Kirby.png");
  red=loadImage("Red.png");
  samus=loadImage("Samus Aran.png");
  wii=loadImage("Nintendo.png");
  nwin=loadImage("Nintendos.png");
  nlose=loadImage("Nintendo Lose.png");
  darkrai=loadImage("Darkrai.png");
  metroid=loadImage("Metroid.png");
  nebula=loadImage("Dark Nebula.png");
  dimentio=loadImage("Dimentio.png");
  font=loadFont("Flintstone-48.vlw");
  textFont(font);
  textSize(40);
}
void draw()
{
     nintendo();
}
void obstacles()
{
  int t=second();
  if (t>=1 && t<=10)
  {
    image(darkrai, 400, 0, 100, 100);
    strokeWeight(5);
    stroke(100);
    fill(100);
    int f=1;
    while (f<=100)
    {
      ellipse(int(random(399, 501)), int(random(99, 551)), 2, 8);
      ellipse(int(random(549, 601)), int(random(99, 551)), 2, 8);
      ellipse(int(random(299, 351)), int(random(99, 551)), 2, 8);
      f++;
    }
  }
  else if (t>=20 && t<=25)
  {
    fill(0);
    stroke(145, 145, 25);
    strokeWeight(5);
    quad(600, 115, 575, 185, 600, 255, 625, 185);
    quad(600, 255, 575, 325, 600, 395, 625, 325);
    quad(600, 395, 575, 465, 600, 535, 625, 465);
  }
  else if (t>=45 && t<=50)
  {
    fill(0);
    stroke(145, 145, 25);
    strokeWeight(5);
    quad(300, 115, 275, 185, 300, 255, 325, 185);
    quad(300, 255, 275, 325, 300, 395, 325, 325);
    quad(300, 395, 275, 465, 300, 535, 325, 465);
  }
  else if (t>=10 && t<=20)
  {
    image(metroid, 400, h, 50, 50);
    image(metroid, 475, j, 50, 50);
    image(metroid, 325, j-i, 50, 50);
    image(metroid, 550, h+k, 50, 50);
    h=h+i;
    j=j+k;
    if (h>=500)
    {
      i=i-4;
    }
    else if (h<=100)
    {
      i=i+3;
    }
    if (j>=500)
    {
      k=k-5;
    }
    else if (j<=100)
    {
      k=k+2;
    }
  }
  else if ((t>=25 && t<=35)||(t>=50 && t<=60))
  {
    image(nebula, 400, 0, 100, 100);
    strokeWeight(5);
    stroke(20, 185, 210);
    line(450, 50, 450, l);
    l=l+20;
    if (l>=1700)
    {
      l=50;
    }
  }
  else if (t>=35 && t<=45)
  {
    image(dimentio, 400, 0, 100, 100);
    strokeWeight(1);
    fill(100);
    stroke(100);
    int g=1;
    while (g<=50)
    {
      rect(int(random(119, 781)), int(random(99, 551)), 10, 10);
      g++;
    }
  }
}
void icon()
{
  if (lives1==5)
  {
    image(samus, 225, 0, 100, 100);
  }
  else if (lives1==4)
  {
    image(kirby, 200, 0, 100, 100);
  }
  else if (lives1==3)
  {
    image(red, 200, 0, 80, 100);
  }
  else if (lives1==2)
  {
    image(link, 200, 0, 100, 100);
  }
  else 
  {
    image(mario, 200, 0, 100, 100);
  }
  if (lives2==5)
  {
    image(meta, 600, 0, 100, 100);
  }
  else if (lives2==4)
  {
    image(hammer, 570, 0, 100, 100);
  }
  else if (lives2==3)
  {
    image(plasma, 600, 0, 100, 100);
  }
  else if (lives2==2)
  {
    image(skyward, 600, 0, 100, 100);
  }
  else 
  {
    image(paper, 550, 0, 100, 100);
  }
}
void health()
{
  stroke(175);
  strokeWeight(5);
  fill(255, 0, 0);
  rectMode(CORNER);
  rect(100, 560, 300, 25);
  rect(500, 560, 300, 25);
  fill(0, 255, 0);
  rect(100, 560, m, 25);
  rect(500, 560, n, 25);
  if (m<=0 && lives1==5)
  {
    lives1=4;
    m=300;
  }
  else if (m<=0 && lives1==4)
  {
    lives1=3;
    m=300;
  }
  else if (m<=0 && lives1==3)
  {
    lives1=2;
    m=300;
  }
  else if (m<=0 && lives1==2)
  {
    lives1=1;
    m=300;
  }
  else if (m<=0 && lives1==1)
  {
    lives1=0;
    m=0;
  }
  if (n<=0 && lives2==5)
  {
    lives2=4;
    n=300;
  }
  else if (n<=0 && lives2==4)
  {
    lives2=3;
    n=300;
  }
  else if (n<=0 && lives2==3)
  {
    lives2=2;
    n=300;
  }
  else if (n<=0 && lives2==2)
  {
    lives2=1;
    n=300;
  }
  else if (n<=0 && lives2==1)
  {
    lives2=0;
    n=0;
  }
}
void nintendo()
{
  if (lives1==0)
  {
    win3=true;
  }
  else if (lives2==0)
  {
    win4=true;
  }
  if (win3==false || win4==false)
  {
    String boss[]=loadStrings("Boss.txt");
    String player[]=loadStrings("Player.txt");
    image(wii, 0, 0);
    fill(255);
    textAlign(CENTER);
    text("Lives: "+lives2, 750, 50);
    text("Lives: "+lives1, 150, 50);
    textSize(40);
    text(boss[lives2], 750, 90);
    text(player[lives1], 150, 90);
    icon();
    health();
    obstacles();
    hero.heros();
    hero.keyPressed();
    villain.villains();
    villain.evil();
    ace.move();
    ace.bounce();
    ace.show();
  }
  if (win4==true)
  {
    image(nwin, 0, 0);
  }
  else if (win3==true)
  {
    image(nlose, 0, 0);
  }
}
class Ball
{
  boolean up, right;
  void move()
  {
    if (up==true)
    {
      y=y-5;
    }
    if (up==false)
    {
      y=y+5;
    }
    if (right==true)
    {
      x=x+5;
    }
    if (right==false)
    {
      x=x-5;
    }
  }
  void bounce()
  {
    if (100>=y || y>=550)
    {
      up=!up;
    }
    if (get(x, y)!=color(0))
    {
      right=!right;
    }
    if (get(x+10, y) !=color(0))
    {
      right=!right;
    }
    if (x<=100)
    {
      x=450;
      if (win3==false && win4==false)
      {
        m=m-50;
      }
    }
    if (x>=787)
    {
      x=450;
      if (win3==false && win4==false)
      {
        n=n-50;
      }
    }
  }
  void show()
  {
    strokeWeight(1);
    fill(255);
    stroke(255);
    ellipse(x, y, 10, 10);
  }
}
class Paddle
{
  void keyPressed()
  {
    if (keyPressed==true & (key== 's'||key== 'S'))
    {
      t=t+10;
    }
    if (keyPressed==true & (key== 'w'||key== 'W'))
    {
      t=t-10;
    }
    if (t>=510)
    {
      t=510;
    }
    if (t<=140)
    {
      t=140;
    }
  }
  void evil()
  {
    if (u<=y && x>=450)
    {
      u=u+4.75;
    }
    if (u>=y && x>=450)
    {
      u=u-4.25;
    }
    if (u>=510)
    {
      u=510;
    }
    if (u<=140)
    {
      u=140;
    }
  }
  void heros()
  {
    fill(255);
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    rect(110, t, 5, 60);
  }
  void villains()
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(780, u, 5, 60);
  }
}
void keyPressed()
{
  if (((keyPressed==true && key=='r')|| (keyPressed==true && key=='R'))&&(win3==true||win4==true))
  {
    win3=false;
    win4=false;
    lives1=5;
    lives2=5;
    m=300;
    n=300;
    u=350;
    t=350;
    x=450;
    y=300;
  }
}


