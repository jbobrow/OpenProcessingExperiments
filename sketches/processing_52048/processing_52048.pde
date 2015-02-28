
//Press any button to speed the monsters up
//Click the mouse to slow them down

//HW#6-Wrapping, horizontal and vertical
//BOUNCING MONSTA's
//Joshua Chang 
//jmc1 Copyright 2012
//Jim Roberts-"flashing code"
//Sprites, artwork and other media © 2008 FEPlanet.
//Fire Emblem™ © 2003-2008 Nintendo/INTELLIGENT SYSTEMS. 
//™, ®, Gameboy Advance, DS, 
//Gamecube and Wii are trademarks of Nintendo. © 2008 Nintendo
//Floor texture, "dungeon_walls_3"-henrys free textures
//"http://www.henrysfps.com/textures/index.album/stone-floor-1?i=17"
float x,y,xSpeed,ySpeed,Speed,s,x2,y2,x3,y3;
PImage s1,s2,s1r,s2r,m1,m2,m1r,m2r,b,att;

void setup()
{
size (400,400);
smooth();
s=.5;
s1=loadImage("soldierstand.png");
s2=loadImage("soldier4.png");
s1r=loadImage("soldierstand2.png");
s2r=loadImage("soldier4-2.png");
m1=loadImage("monster1.png");
m2=loadImage("monster2.png");
m1r=loadImage("monster1reverse.png");
m2r=loadImage("monster2reverse.png");
b=loadImage("wall.jpg");
att=loadImage("soldier4.png");
  
y=random(height);
y2=random(20,height);
x2=random(-20,-50);
x3=width;
y3=random(10,height);
xSpeed=s;
ySpeed=s;
background(255);
imageMode(CORNER);




}
//---------
void draw()
{

ImageSetup();
MoveMonster1();
drawMonster1();
MoveMonster2();
drawMonster2();
MoveMonster3();
drawMonster3();
//saveFrame ("hw6-Bouncings Monstas.jpg");
//drawSoldier();
}
//------------
void keyPressed()
{
  s=s+.5;
}
void mousePressed()
{
 s=s-.5 ;
 if (s<=0)
 {
  s=0; 
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

int a = frameCount/20;  // gives the quotient which should change
                         // about once a second
if (mouseX>width/2){

 if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (s1,mouseX,mouseY);
 }
 else
 {
   image (s2,mouseX,mouseY);
 }
}
else
{
  if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (s1r,mouseX,mouseY);
 }
 else
 {
   image (s2r,mouseX,mouseY);
 }
}}
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


 if ( a%2 == 0)  // see if a is odd or even - the % operator returns
 {                 // the remainder which, for division by 2 is 0 or 1
    image (m1r,x3,y3);
 }
 else
 {
   image (m2r,x3,y3);
 }
 
if (x3+68<=0)
{x3=width+30;y3=random(height);}


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
y2=random(height);
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
//void mousePressed()
{
 //image( att,mouseX,mouseY);
}

void drawMonster1()
{

  imageMode(CENTER);
  


int a = frameCount/20;  // gives the quotient which should change
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
(x<=0){
  xSpeed= -xSpeed;}
if (y>=height){
  ySpeed=-random(.01,1);
}
else if(y<0){
  ySpeed=-ySpeed;}
}
//-------------------------

 
//NEED MONSTER BOUNCING
//Use the keys for Soldier?

