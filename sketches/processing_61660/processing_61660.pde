
//PROJECT 1.5, PLAYING/UPGRADING WITH SOUND!
//Kill the Monsters!
//Added a sound track!

//Move the soldier over the monster to kill it.
//Click to slow down time and monsters.
//Press any button to speed up monsters and time.
//Save all the innocents!

//Joshua Chang 
//jmc1 Copyright 2012
//Jim Roberts-"flashing code", "game code(Intro, Game, Phases, etc.)"
//Sprites, artwork and other media © 2008 FEPlanet.
//Fire Emblem™ © 2003-2008 Nintendo/INTELLIGENT SYSTEMS. 
//™, ®, Gameboy Advance, DS, 
//Gamecube and Wii are trademarks of Nintendo. © 2008 Nintendo
//Floor texture, "dungeon_walls_3"-henrys free textures
//"http://www.henrysfps.com/textures/index.album/stone-floor-1?i=17"
//AUDIO from SoundBible.com, http://www.playonloop.com/, http://www.8bitweapon.com/music.htm

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float x,y,xSpeed,ySpeed,Speed,s,x2,y2,x3,y3, time,d1,d2,d3;
PImage a,s3,s1,s2,s1r,s2r,m1,m2,m1r,m2r,b,att,bad, ok, great;
int count,Phase,DefendT,T,killed,respawn1,respawn2,respawn3;

Minim minim = new Minim(this);
AudioSample bounce1;
AudioSample bounce2;
AudioSample bounce3;
AudioSample soldier1;
AudioSample soldier2;
AudioSample soldier3;
AudioSample bugle;
AudioSample sad;
AudioSample monsterroar;
boolean hit = false;

void setup()
{
size (400,400);
smooth();
textAlign(CENTER);
textSize(20);
s=.5;
s3=loadImage("soldierstill.png");
s1=loadImage("soldierstand.png");
s2=loadImage("soldier4.png");
s1r=loadImage("soldierstand2.png");
s2r=loadImage("soldier4-2.png");
m1=loadImage("monster1.png");
m2=loadImage("monster2.png");
m1r=loadImage("monster1reverse.png");
m2r=loadImage("monster2reverse.png");
b=loadImage("wall.jpg");
a=loadImage("floor.jpg");
att=loadImage("soldier4.png");
bad=loadImage("monster2.png");
ok=loadImage("soldierstill.png");
great=loadImage("soldierup.png");
  
y=random(height);
y2=random(20,height);
x2=random(-20,-50);
x3=width;
y3=random(10,height);
xSpeed=s;
ySpeed=s;
background(255);
imageMode(CORNER);
time=-width;
T=0;
DefendT=10000;
count=0;
Phase=0;
respawn1=0;
respawn2=0;
respawn3=0;
bounce1 = minim.loadSample("growl1.mp3");
bounce2 = minim.loadSample("growl2.mp3");
bounce3 = minim.loadSample("growl3.mp3");
soldier1= minim.loadSample("soldier1.wav");
soldier2= minim.loadSample("soldier2.wav");
soldier3= minim.loadSample("soldier3.wav");
bugle = minim.loadSample("bugle.wav");
sad= minim.loadSample("sad.mp3");
monsterroar= minim.loadSample("monsterroar.mp3");
sad.trigger();
}





//---------

void draw()
{

Phases();
//saveFrame("HW#7-Defend the Monsters!.jpg");
}


//------------
void keyPressed()
{
  s=s+.5;
  if(s>=10)
  {
   s=10; 
  }
  if (Phase==0)
  {
    Phase=1;
    T= millis();
  }
}
//--------------
void Phases()
{
if (Phase==0)
{
  Intro();
}
if (Phase==1)
{
 Start(); 
}
if (Phase ==2)
{
  Score();
}
 
}
//++++++++++++++++
void Intro()
{
  image(a,0,0,width,height);
  fill(255);
  text("You are a soldier of Arcadia, (CA.)",width/2,height/4);
  text("You must kill as many monsters",width/2, height/3);
  text("as you can!",width/2,height/3+30);
text(" Good luck soldier!",width/2, height/2);
text("(Press any key to continue...)", width/2, height-20);

}
//+++++++++++++
void Start()
{
  noCursor();
   ImageSetup();
MoveMonster1();
drawMonster1();
MoveMonster2();
drawMonster2();
MoveMonster3();
drawMonster3();

drawSoldier();
TimeBar();
SoldierKill();
monsterskilled();
}

void monsterskilled()
{ text("Monsters killed: "+killed, height-120,height-20);
}
//+++++++++++++++
void scoretext()
{

  imageMode(CORNER);
  time=0;
  fill(0);
  rect(0,0,width,height);
  fill(255);
  text("Time's Up!",width/2,height/4);
  text("You killed "+ killed+" monsters.", width/2, height/3);
   imageMode(CENTER);
}
void   low()
  {background(245,10,9);text("Unfortunately the monsters were",width/2, height/2); 
text("able to kill many innocent lives...", width/2, height/2+30);
image (bad, width/2, height*2/3);

  }
  
  void medium()
  {
  text("Only some innocents were killed.",width/2,height/2); 
text("Not bad...I guess.", width/2, width/2+30);
image (ok, width/2, height*2/3);
  }
  void high()
  {
     text("You defended the innocents safely!",width/2,height/2);
    text("Great job soldier!", width/2, width/2+30);
    image(great, width/2, height*2/3);
  }
void Score()
{
  scoretext();

  medium();
  high();
  if (killed<10){
 low();
}

  else if(killed<15)
  {
medium();
}
  else
  {
   high();   
  }
// text("Click to restart.",width/2,height-30);
// if (keyPressed){Intro();}
// 
}
//--------------
void TimeBar()
{
  fill(0);
time=time+s;
//noStroke();
rectMode(CORNER);
rect(0,0,width,14);
fill(255);
rect(width,0,time,14);  

if(time>=0)
{
  //time=0
  Phase=2;
}
}

//----------------
void ImageSetup()
{
image(b,0,0,width,height);
}
//----------
void drawSoldier()
{
imageMode(CENTER);
int a = frameCount/20;  // gives the quotient which should change
                         // about once a second
if (mouseX>pmouseX){

 if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (s1,mouseX,mouseY-10);
 }
 else
 {
   image (s2,mouseX,mouseY-10);
 }
}
else //if(mouseX-pmouseX<=0)
{
  if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (s1r,mouseX, mouseY-10);
 }
 else
 {
   image (s2r,mouseX,mouseY-10);
 }
}
if (mouseY<=10)
{mouseY=10;}
imageMode(CORNER);
}

void SoldierKill()
{
  
 println(d3=dist(mouseX,mouseY-10,x3,y3));
d3=dist(mouseX,mouseY,x3,y3);
d2=dist(mouseX,mouseY,x2,y2);
d1=dist(mouseX,mouseY,x,y);
println(killed);
if (d1<20)
{
  killed=killed+1;
  fill(225,0,0,90);
  rect(0,0,width,height);
  y = random(20, height);
  x=-10;
   bounce2.trigger();
   soldier1.trigger();
}
else if (d2<20)
{
   killed=killed+1;
  fill(225,0,0,90);
  rect(0,0,width,height);
  y2 = random(15,height);
  x2=0-random(60);
   bounce1.trigger();
   soldier2.trigger();
}
if (d3<20)
{
  killed=killed+1;
  fill(225,0,0,90);
  rect(0,0,width,height);
  y3 = random(30,height); 
  x3=width+random(20,60);
   bounce3.trigger();
   soldier3.trigger();
}
}
//Try variable os the direction//
//----------------------
void MoveMonster3()
{
  Speed=s;
  
x3=x3-Speed*.6;  

}

//----------
void drawMonster3()
{

  imageMode(CENTER);
  


int a = frameCount/25;  // gives the quotient which should change
                         // about once a second

if (respawn3 ==0){
 if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (m1r,x3,y3);
 }
 else
 {
   image (m2r,x3,y3);
 }
 
if (x3+68<=0)
{x3=width+30;y3=random(10,height);}
}


imageMode(CORNER);
}




//---------
void MoveMonster2()
{
  Speed=s;
  
x2=x2+Speed*.8;  
}

//----------
void drawMonster2()
{

  imageMode(CENTER);
  


int a = frameCount/20;  // gives the quotient which should change
                         // about once a second


 if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (m1,x2,y2);
 }
 else
 {
   image (m2,x2,y2);
 }
 
 if (x2-100>=width)
{x2=0;
y2=random(20,height);
   if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (m1,x2,y2);
 }
 else
 {
   image (m2,x2,y2);
 }
}

 
//else
//{
//  if ( a%2 == 0)  // see if a is odd or even - the % operator returns
// {                 // the remainder which, for division by 2 is 0 or 1
//    image (m1r,x++,y);
// }
// else
// {
//   image (m2r,x++,y);
// }
//}
imageMode(CORNER);
}
//---------
void mousePressed()
{
 s=s-.5;
 
 if(s<=0)
 {s=0;}
}

void drawMonster1()
{

  imageMode(CENTER);
  


int a = frameCount/19;  // gives the quotient which should change
                         // about once a second

if(xSpeed>=-xSpeed){
  
 if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (m1,x,y);
 }
 else
 {
   image (m2,x,y);
 }
}
else 
{
  if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (m1r,x,y);
 }
 else
 {
   image (m2r,x,y);
 }
}
// if (x>=width)
//{s=-s;
//y=random(height);
//   if ( a%2 == 0)  // see if a is odd or even - the % operator returns
// {                 // the remainder which, for division by 2 is 0 or 1
//    image (m1,x,y);
// }
// else
// {
//   image (m2,x,y);
// }
//}



 
//else
//{
//  if ( a%2 == 0)  // see if a is odd or even - the % operator returns
// {                 // the remainder which, for division by 2 is 0 or 1
//    image (m1r,x++,y);
// }
// else
// {
//   image (m2r,x++,y);
// }
//}
imageMode(CORNER);
}

//--------------------------
void MoveMonster1()
{
 x=x+xSpeed*s;
 y=y+ySpeed*s;
if (x>=width){
  xSpeed=-random(.01,1);
}
else if
(x<-10){
  xSpeed= -xSpeed;}
if (y>=height){
  ySpeed=-random(.01,1);
}
else if(y<5){
  ySpeed=-ySpeed;}
}
//-------------------------
void levelModes()
{
 
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  bounce1.close();
   bounce2.close();
    bounce3.close();
  minim.stop();
  super.stop();
}

