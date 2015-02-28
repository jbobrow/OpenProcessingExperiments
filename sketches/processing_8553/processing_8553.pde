

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;

int deg=20;


void setup() {
     minim= new Minim(this);
  player = minim.loadFile("allcoins .mp3");
  
  
  
  size(650,600);
  smooth();
  background(200,150,0); // orangey backround
  
 
}

void draw(){

    player.play();
  
  deg++;
  
frameRate(150); // Animation is weird - song will fall out of sync after a full minute or so of playing

 fill(225,244,96); // fills all - yellow gold coin colour
  translate(320,240); // position on stage
  rotate(radians(deg));
  rectMode(CENTER);
  rect(0,0,120,120); // lol, non N64-like logo
  

  //fill(255,244,96); Only necissary for Colour Change
  //frameRate(x); Does not seperate the frame rate
   translate(100,100); //Position on circle on stage
  rotate(radians(deg));
  rectMode(CENTER);
  ellipse(0,0,12,12); // coin 1
  
    translate(50,70); //Position on circle on stage
  rotate(radians(deg));
  rectMode(CENTER);
  ellipse(-20,-10,20,15); // coin 2
  
  translate(100,30); //Position on circle on stage
  rotate(radians(deg));
  rectMode(CENTER);
  ellipse(0,0,25,15); // coin 3
  
  
  //translate(100,30); //Position on circle on stage
  //rotate(radians(deg));
  //rectMode(CENTER);
  //ellipse(0,0,15,10); // coin 4?
  
  
 
  
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}




