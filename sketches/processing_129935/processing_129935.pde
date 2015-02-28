
//Rosado HW 3
//Graphics cobbled together from textures availible at http://www.mayang.com/textures/ and http://www.cgtextures.com/ and my tears
//Music is the track "Candyman" from artist Tizmax on Jamendo.com 
//Special thanks to the many people online who help with Processing questions.
/* @pjs preload="mouth.png","shredded_paper_bg.jpg","purpleLace.png"; */

import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage a;
PImage bg;
PImage orange;
PImage lace;
PImage kiwi;
PImage skull;
float timer = 0.0;
float myscale = 0 ;
float myscaleSpeed = 0.09 ;
float angle;
float jitter;
int xPos=-10;

void setup()
{
a = loadImage("mouth.png");
bg = loadImage("shredded_paper_bg.jpg");
orange = loadImage("Fruit0034_S.png");
kiwi = loadImage("Fruit2.png");
skull = loadImage("Bones.png");
lace = loadImage("purpleLace.png");
lace.filter(THRESHOLD);


size(800,600); 
frameRate(40); 
rectMode(CENTER); 
colorMode(HSB, 360, 100, 100);
background(0,0,0);

//sound
minim = new Minim(this);
player = minim.loadFile("Tizmax_-_Candyman.mp3");
player.play();


}

void draw()
{
  
  //BG and lower lace overlay
  background(302,86,99);
  image(bg,400,300);
  
  pushMatrix();
  lace.filter(INVERT);
  translate(500,0);
  image(lace,100,100);
  popMatrix();



  
  timer = timer+ (1.0 / 30.0);
  myscale= myscale +myscaleSpeed;
 
 if (myscale > 6)
 {
   myscale = 0;
 }



 pushMatrix();
if (second() % 2 == 0)
{ 

 

jitter = random(-0.1, 0.1);
angle = angle + 4;
float c = cos(angle);
translate(700,500);
rotate (c);
image(orange,0,0);}

else 
 {
jitter = random(-0.1, 0.1);
angle = angle + 4;
float c = cos(angle);
translate(100,100);
rotate (c);
image(orange,0,0);}
popMatrix(); 

 //zooming mouth 
  
  pushMatrix(); 
  imageMode(CENTER);
  translate(400,300);
  scale(myscale); 
  image(a,0,0);
    popMatrix(); 

pushMatrix(); 

tint(255,110);
image(lace,100,100);
translate(500,490);
rotate(degrees(215));
image(lace,100,100);
noTint();

popMatrix();


pushMatrix();
 jitter = random(-0.1, 0.1);
 angle = angle + 4;
 float c = cos(angle);
 rotate(c);
 translate(300, 90);
 image(kiwi,0,0);
 
 float d = cos(angle) - 5;
 rotate(d);
 translate(450,105);
 image(kiwi,0,0);

popMatrix(); 
 //flying skull
  pushMatrix();
  imageMode(CENTER);
  angle = angle + 3;
  float e = cos(angle);
  rotate (e);
  translate(0,300);
  skull.filter(INVERT);
  image(skull,xPos,0);
  xPos=xPos+55;
  if (xPos>width+20)
  {
    xPos=-20;
  }
  popMatrix();


//lays down and dies
}




