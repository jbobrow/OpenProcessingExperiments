
PFont font;
PImage sixth, seventh, eighth, ninth, tenth, eleventh, first, second, third, fourth, fifth, saxon, tardis, dwin, dlose, dalek, dalek2, pond;
import ddf.minim.*;
AudioPlayer who, exterminate, jelly;
Minim minim;
int lives3=6;
int lives4=6;
int b=1400;
int c=857;
int d=-600;
int e=65;
int f=165;
int g=757;
int o=int(random(199, 601));
int p=int(random(150, 351));
int t=350;
float u=350;
int w=350;
int x=450;
int y=300;
Ball ace=new Ball();
Paddle hero=new Paddle();
Paddle villain=new Paddle();
boolean doctor=false;
boolean win1=false;
boolean win2=false;
void setup()
{
  size(900, 600);
  minim = new Minim(this);
  who = minim.loadFile("Doctor Who Theme.mp3");
  who.loop();
  exterminate = minim.loadFile("Dalek Attack Ringtone - YouTube.mp3");
  jelly = minim.loadFile("TARDIS Takeoff.mp3");
  first=loadImage("1st Master.jpeg");
  second=loadImage("2nd Master.jpeg");
  third=loadImage("3rd Master.jpeg");
  fourth=loadImage("4th Master.jpeg");
  fifth=loadImage("5th Master.jpeg");
  saxon=loadImage("6th Master.jpeg");
  sixth=loadImage("6th Doctor.png");
  seventh=loadImage("7th Doctor.jpeg");
  eighth=loadImage("8th Doctor.png");
  ninth=loadImage("9th Doctor.jpeg");
  tenth=loadImage("10th Doctor.png");
  eleventh=loadImage("11th Doctor.png");
  tardis=loadImage("Doctor Who.png");
  dwin=loadImage("Doctor Whos.png");
  dlose=loadImage("The Master.png");
  dalek=loadImage("Dalek.png");
  dalek2=loadImage("Dalek2.png");
  pond=loadImage("TARDIS.png");
  font=loadFont("Flintstone-48.vlw");
  textFont(font);
  textSize(40);
}
void draw()
{ 
  doctor();
}
void doctors()
{
  if (lives4==6)
  {
    image(sixth, 225, 0, 100, 100);
  }
  else if (lives4==5)
  {
    image(seventh, 225, 0, 100, 100);
  }
  else if (lives4==4)
  {
    image(eighth, 225, 0, 100, 100);
  }
  else if (lives4==3)
  {
    image(ninth, 225, 0, 100, 100);
  }
  else if (lives4==2)
  {
    image(tenth, 225, 0, 80, 100);
  }
  else 
  {
    image(eleventh, 225, 0, 100, 100);
  }
  if (lives3==6)
  {
    image(first, 560, 0, 100, 100);
  }
  else if (lives3==5)
  {
    image(second, 560, 0, 100, 100);
  }
  else if (lives3==4)
  {
    image(third, 560, 0, 100, 100);
  }
  else if (lives3==3)
  {
    image(fourth, 560, 0, 100, 100);
  }
  else if (lives3==2)
  {
    image(fifth, 560, 0, 100, 100);
  }
  else 
  {
    image(saxon, 560, 0, 100, 100);
  }
}
void doctor()
{
  if (lives3==0)
  {
    win1=true;
  }
  else if (lives4==0)
  {
    win2=true;
  }
  if (win1==false || win2==false)
  {
    image(tardis, 0, 0);
    fill(255);
    textAlign(CENTER);
    text("Lives: "+lives3, 750, 50);
    text("Lives: "+lives4, 150, 50);
    textSize(40);
    text("The Master", 740, 90);
    text("The Doctor", 160, 90);
    tint(255);
    doctors();
    allonsy();
    tint(255);
    dalek();
    hero.heros();
    hero.keyPressed();
    villain.villains();
    villain.evil();
    ace.move();
    ace.bounce();
    ace.show();
  }
  if (win1==true)
  {
    image(dwin, 0, 0, width, height);
    exterminate.pause();
    jelly.pause();
  }
  else if (win2==true)
  {
    image(dlose, 0, 0, width, height);
    exterminate.pause();
    jelly.pause();
  }
}
void allonsy()
{
  int t=second();
  if ((t>=20 && t<=26)||(t>=36 && t<=40))
  {
    tint(int(random(255)));
    jelly.play();
    image(pond, o, p, 125, 200);
  }
  else if (t>=26 && t<=36) 
  {
    tint(255);
    image(pond, o, p, 125, 200);
    jelly.rewind();
  }
  else
  {
    jelly.rewind();
    o=int(random(199, 601));
    p=int(random(150, 351));
  }
}
void dalek()
{
  int t=second();
  if (((t>=20 && t<=30)||(t>=45 && t<=55))&& (lives3 != 0 && lives4 != 0))
  {
    image(dalek, d, 100, 150, 150);
    image(dalek2, b, 400, 150, 150);
    exterminate.play();
    b=b-2;
    d=d+2;
    if (d>=-30)
    {
      d=-30;
      strokeWeight(3);
      stroke(120, 215, 240);
      line(f, 166, e, 166);
      e=e+15;
      f=f+15;
    }
    if (b<=800)
    {
      b=800;
      strokeWeight(3);
      stroke(120, 215, 240);
      line(g, 466, c, 466);
      c=c-15;
      g=g-15;
    }
  }
  else
  {
    b=1400;
    c=857;
    d=-600;
    e=65;
    f=165;
    g=757;
    exterminate.rewind();
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
      if (win1==false && win2==false)
      {
        lives4=lives4-1;
      }
    }
    if (x>=787)
    {
      x=450;
      if (win1==false && win2==false)
      {
        lives3=lives3-1;
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
  if (((keyPressed==true && key=='r')|| (keyPressed==true && key=='R'))&&(win1==true||win2==true))
  {
    win1=false;
    win2=false;
    lives3=6;
    lives4=6;
    u=350;
    t=350;
    x=450;
    y=300;
  }
}


