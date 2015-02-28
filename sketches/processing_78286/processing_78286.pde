
//press any key quickly to make the doll/baby talk (do not hold key down for more than a split second).
//Clicking causes the doll to change drastically
PImage doll1;
PImage doll2;
PImage fire;
PImage house;
PImage rattle;
PImage bat;

import ddf.minim.*;

Minim minim;
AudioPlayer song;

void setup(){


doll1 = loadImage ("doll1.png");
doll2 = loadImage ("doll2.png");
fire = loadImage ("fire.jpg");
house = loadImage ("house.jpg");
rattle = loadImage ("r.png");
bat = loadImage ("bat.png");
 size(800,640);
 
}

void draw(){
  int sec=second();
  if (keyPressed == true) {
  minim = new Minim(this);
  song = minim.loadFile("Baby.mp3");
  song.play();
  }
  
  
float lx = constrain(mouseX,313,337);
float ly = constrain(mouseY,377,382);
float lpx = constrain(mouseX,300,350);
float lpy = constrain(mouseY,370,390);

float rx = constrain (mouseX,496,522);
float ry = constrain (mouseY,378,383);
float rpx = constrain (mouseX,487,531);
float rpy = constrain (mouseY,370,392);

float dlx = constrain(mouseX,303,369);
float dly = constrain(mouseY,320,378);
float dlpx = constrain(mouseX,287,385);
float dlpy = constrain(mouseY,302,395);
//
float drx = constrain (mouseX,485,535);
float dry = constrain (mouseY,320,378);
float drpx = constrain (mouseX,470,552);
float drpy = constrain (mouseY,304,393);
 
 if (mousePressed == true){
  background(fire);//fire background
 image (doll2, 90, 50);//demon doll
 //left demon eye
 fill(255,0,0);
 ellipse(dlx,dly,60,60);
 fill(0);
 ellipse(dlpx,dlpy,20,20);
 //right demon eye
 fill(255,0,0);
 ellipse(drx,dry,60,60);
 fill(0);
ellipse(drpx,drpy,20,20);
cursor(bat,31,31);
 }
 
 else {
 background(house); // house background
 image (doll1, 90, 50); // normal doll 90,50
 //left eye
 fill(255);
 ellipse(325,380,75,50);//whites
 fill(0,0,255);
 ellipse(lx,ly,40,40);//iris
 fill(0);
 ellipse(lpx,lpy,15,15);//pupil
 
 //right eye
 fill(255);
 ellipse(509,382,75,50);//whites
 fill(0,0,255);
 ellipse(rx,ry,40,40);//iris
 fill(0);
 ellipse(rpx,rpy,15,15);//pupil
 cursor (rattle,31,31);
 }
}

void mousePressed(){
if (mousePressed == true) {
  minim = new Minim(this);
  
  song = minim.loadFile("Demon.mp3");
  song.play();}
}




