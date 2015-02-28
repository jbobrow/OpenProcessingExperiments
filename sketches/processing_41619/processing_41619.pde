
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
Minim minim;


float x = 25;
float y = 25;
float x2 = 20;
float y2 = 20;
float x3 = 15;
float y3 = 15;
float sw = 0.5;
 
void setup(){
  size(700,400);
  noStroke();
  smooth();
  
  minim = new Minim(this);
 player = minim.loadFile("mysound.aiff");
 player1 = minim.loadFile("kick.wav");
 player2 = minim.loadFile("spooky.wav");
 
}
 
void draw(){
  background(25);
  frameRate(30);
   
  noFill();
  ellipse(mouseX, mouseY, 100, 100); // center circle
   
  //
  noFill();
  strokeWeight(sw);
   
  // increasing variables
  x += 15;
  y += 15;
  x2 += 10;
  y2 += 10;
  x3 += 5;
  y3 += 5;
 
   
  //
  stroke(255, random(200,255));
  ellipse(mouseX, mouseY, x, y);
   
  stroke(255, random(200,255));
  ellipse(mouseX, mouseY, x2, y2);
   
  stroke(255, random(200,255));
  ellipse(mouseX, mouseY, x3, y3);
  

    
  
}
 
void mouseMoved(){
 
  
  x = 0;
  y = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
   
  sw += 1;
  
  if(sw > 100){
    sw = 0;}
    
    if (sw > 99){
      player1.loop(0);
      
      
    }else{
        player2.loop(0);
        
    }
    
    

    
     
}


  void stop(){
  player.close();
  player1.close();
  minim.stop();
  super.stop();
}


