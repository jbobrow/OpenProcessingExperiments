
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PImage cnc;
PImage cnc2;
PImage dance;
PImage dance2;
PImage bg;
float xpos = 300;
float ypos = 300;
float xspeed = 2; 
float yspeed = 2.5;
float xdir = 1;
float ydir = 1;
float xpos2 = 100;
float ypos2 = 300;
float xspeed2 = 2.5; 
float yspeed2 = 2.5;
float xdir2 = 1;
float ydir2 = 1;
//
//Minim minim;
//AudioPlayer player;
//AudioInput input;

void setup(){
  background(255);
  smooth();
  frameRate(50);
  size(500,500);
  cnc = loadImage("cnc.png");
  cnc2 = loadImage("cnc2.png");
  dance = loadImage("dancingguy.png");
  dance2= loadImage("dancingguy2.png");
  bg = loadImage("bg.png");
//  minim = new Minim(this);
//  player = minim.loadFile("EverybodyDanceNow.mp3");
//  input = minim.getLineIn();
//  player.play();
}

void draw(){
 image(bg,0,0);
 disco();
 
  if (keyPressed == true) {
  image(cnc,xpos,ypos);
  } else {
  image(cnc2,xpos,ypos);
  }
  
  if (keyPressed == true) {
  image(dance,xpos2,ypos2);
  } else {
   image(dance2,xpos2,ypos2);
  }
  //cnc guy motion
  xpos = xpos + ( xspeed * xdir);
  ypos = ypos + ( yspeed * ydir);
  if (xpos + 50 < 0 || xpos + 170 > width) {
    xdir *= -1;
  }
  if (ypos < 280 || ypos + 200 > height) {
    ydir *= -1;
  }
  
  //dance guy motion
  xpos2 = xpos2 + ( xspeed2 * xdir2);
  ypos2 = ypos2 + ( yspeed2 * ydir2);
  
  if (xpos2 + 50 < 0 || xpos2 + 170 > width) {
    xdir2 *= -1;
  }
  if (ypos2 <280 || ypos2 + 200 > height) {
    ydir2 *= -1;
  }

}

void disco(){
  fill(0);
 ellipse(250,150,100,100); 
 
 //center coloumn
  fill(random(0,255));
 ellipse(250,150,10,10);
  fill(random(0,255));
 ellipse(250,160,9,9);
  fill(random(0,255));
 ellipse(250,140,9,9);
  fill(random(0,255));
 ellipse(250,131,8,8);
  fill(random(0,255));
 ellipse(250,169,8,8);
  fill(random(0,255));
 ellipse(250,177,7,7);
  fill(random(0,255));
 ellipse(250,123,7,7);
  fill(random(0,255));
 ellipse(250,116,6,6);
  fill(random(0,255));
 ellipse(250,184,6,6);
  fill(random(0,255));
 ellipse(250,190,5,5);
  fill(random(0,255));
 ellipse(250,110,5,5);
  fill(random(0,255));
 ellipse(250,105,4,4);
  fill(random(0,255));
 ellipse(250,195,4,4);
  fill(random(0,255));
 ellipse(250,199,3,3);
  fill(random(0,255));
 ellipse(250,101,3,3);
  fill(random(0,255));
  
//center row
  fill(random(0,255));
 ellipse(260,150,9,9);
  fill(random(0,255));
 ellipse(269,150,8,8);
  fill(random(0,255));
 ellipse(277,150,7,7);
  fill(random(0,255));
 ellipse(284,150,6,6);
  fill(random(0,255));
 ellipse(290,150,5,5);
  fill(random(0,255));
 ellipse(295,150,4,4);
  fill(random(0,255));
 ellipse(299,150,3,3);
  fill(random(0,255));
 ellipse(240,150,9,9);
  fill(random(0,255));
 ellipse(231,150,8,8);
  fill(random(0,255));
 ellipse(223,150,7,7);
  fill(random(0,255));
 ellipse(216,150,6,6);
  fill(random(0,255));
 ellipse(210,150,5,5);
  fill(random(0,255));
 ellipse(205,150,4,4);
  fill(random(0,255));
 ellipse(201,150,3,3);

//dunno what part yet, doin math
  fill(random(0,255));
 ellipse(260,160,9,9);
  fill(random(0,255));
 ellipse(260,140,9,9);
  fill(random(0,255));
 ellipse(240,160,9,9);
  fill(random(0,255));
 ellipse(240,140,9,9);
  fill(random(0,255));
 ellipse(269,141,8,8);
  fill(random(0,255));
 ellipse(277,142,7,7);
  fill(random(0,255));
 ellipse(284,143,6,6);
  fill(random(0,255));
 ellipse(259,131,8,8);
  fill(random(0,255));
 ellipse(268,132,8,8);
  fill(random(0,255));
 ellipse(276,134,7,7);
  fill(random(0,255));
 ellipse(283,136,6,6);
  fill(random(0,255));
 ellipse(289,138,5,5);
  fill(random(0,255));
 ellipse(291,144,5,5);
  fill(random(0,255));
 ellipse(294,139,4,4);
  fill(random(0,255));
 ellipse(294,139,4,4);
  fill(random(0,255));
 ellipse(296,145,4,4);

 
 //regrid attempt
  fill(random(0,255));
 ellipse(201,154,3,3);
  fill(random(0,255));
 ellipse(201.5,158,3,3);
 
 //something
   fill(random(0,255));
 ellipse(260,150,9,9);
  fill(random(0,255));
 ellipse(269,150,8,8);
  fill(random(0,255));
 ellipse(277,150,7,7);
  fill(random(0,255));
 ellipse(284,150,6,6);
  fill(random(0,255));
 ellipse(290,150,5,5);
  fill(random(0,255));
 ellipse(295,150,4,4);
  fill(random(0,255));
 ellipse(299,150,3,3);
  fill(random(0,255));
 ellipse(240,150,9,9);
  fill(random(0,255));
 ellipse(231,150,8,8);
  fill(random(0,255));
 ellipse(223,150,7,7);
  fill(random(0,255));
 ellipse(216,150,6,6);
  fill(random(0,255));
 ellipse(210,150,5,5);
  fill(random(0,255));
 ellipse(205,150,4,4);
  fill(random(0,255));
 ellipse(201,150,3,3);
noStroke();
}
//
//void stop(){
//  player.close();
//  input.close();
//  minim.stop();
//  super.stop();
//}


