

//Use the L 6 V 1 J 9 keys to fill in the postal code.
//The postal code belongs in the rectangular area



import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
AudioPlayer player;
Minim minim;





PFont dan;
PImage kong;

void setup (){
  size(250,250);
  minim= new Minim(this);
  player= minim.loadFile("song.mp3",2000);
  player.play();
  dan=loadFont("Leelawadee-Bold-20.vlw");
   kong=loadImage("kong.png");

  background(kong);
  
}

 void draw(){
 }

  void keyPressed (){
 if(keyPressed && key=='l'){
   
   fill(240,253,0);
   textSize(20);
   text("L", pmouseX,pmouseY);
 }
  

 if(keyPressed && key=='6'){
    fill(240,253,0);
 textSize(20);
 text("6", pmouseX,pmouseY);
  }
  
 if(keyPressed && key=='v'){
    fill(240,253,0);
 textSize(20);
 text("V", pmouseX,pmouseY);
 }
 if(keyPressed && key=='1'){
    fill(240,253,0);
 textSize(20);
 text("1", pmouseX,pmouseY);
 }
 if(keyPressed && key=='j'){
    fill(240,253,0);
 textSize(20);
 text("J", pmouseX,pmouseY);
 }
 if(keyPressed && key=='9'){
    fill(240,253,0);
 textSize(20);
 text("9", pmouseX,pmouseY);
 }
 if(keyPressed && key=='r'){
 image(kong,0,0);
 }
 
  }
  

