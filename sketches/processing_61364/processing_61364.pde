
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer audio; 

PImage img;
String[] greeting;
String[] nerve;
float x;
int idx;
PFont font1;


void setup(){
  
  size(1000,500);
  background(255);
  frameRate (200);
  img = loadImage ("fullbody2.jpg");
  font1 = loadFont ("BigCaslon-Medium-48.vlw");
  imageMode(CENTER);
  image(img, width/2, height/2);
   textFont (font1,40);
   textAlign(CENTER);
   x=0;
  
  
minim= new Minim(this);
audio= minim.loadFile("TheNightKnowsNothingAtAll.wav");
audio.loop(); 

 }


void draw(){

if (mouseX>0 && mouseX<137 && mouseY>110 && mouseY<380){
  image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);
     //fill(0);
     //rect (width/2,250,450,205);
     fill(x);
     textFont (font1, 20);
     text ("heart", mouseX, mouseY);
     
 }
x++;

 
if (mouseX>137 && mouseX<284 && mouseY>110 && mouseY<380){
     image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);
     //fill(0);
     //rect (width/2,250,450,205);
     fill(x);
     textFont (font1, 20);
     text ( "nerve", mouseX, mouseY);
 }
 x++;

if (mouseX>284 && mouseX<443 && mouseY>110 && mouseY<380){
     image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);
     //fill(0);
     //rect (width/2,250,450,205);
     fill(x);
     textFont (font1, 20);
     text ( "optic", mouseX, mouseY);
 }
 x++;

if (mouseX>443 && mouseX<578 && mouseY>110 && mouseY<380){
     image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);
     //fill(0);
     //rect (width/2,250,450,205);
     fill(x);
     textFont (font1, 20);
     text ( "muscle", mouseX, mouseY);
 }
 x++;
 
 if (mouseX>578 && mouseX<720 && mouseY>110 && mouseY<380){
     image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);
     //fill(0);
     //rect (width/2,250,450,205);
     fill(x);
     textFont (font1, 20);
     text ( "throat", mouseX, mouseY);
 }
 x++;
 
  if (mouseX>720 && mouseX<848 && mouseY>110 && mouseY<380){
     image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);
     //fill(0);
     //rect (width/2,250,450,205);
     fill(x);
     textFont (font1, 20);
     text ( "brain", mouseX, mouseY);
 }
 x++;
  
  if (mouseX>848  && mouseX<1000 && mouseY>110 && mouseY<380){
     image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);
     //fill(0);
     //rect (width/2,250,450,205);
     fill(x);
     textFont (font1, 20);
     text ( "skin", mouseX, mouseY);
 }
 x++;
 
  if (mouseY<110 || mouseY>380){
     image(img, width/2, height/2);
     rectMode (CENTER);
     fill(0);
     smooth();
     rect (width/2,450,width,110);     
 }

 }



   void home(){
     image(img, width/2, height/2);
   }
     
   void stop (){
   audio.close();
   minim.stop();
   super.stop();
   }

  




