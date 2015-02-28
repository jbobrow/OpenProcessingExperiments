
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer scratchSound;

void setup(){
  size(500,500);
  smooth();
  background(151,114,242);
  
  minim = new Minim(this);
  scratchSound = minim.loadFile("scratchSound.wav");

}

void draw(){
  
}

void mouseDragged(){
   if  (mouseButton == LEFT)
   { noStroke();
    fill(0,10);
    ellipse(mouseX,mouseY,30,30);
    
   scratchSound.loop(0);
  
} 
if (mouseButton == RIGHT)
 
   {noStroke();
   fill(151,114,242);
   ellipse(mouseX,mouseY,40,40);
   cursor(CROSS);}
 
}



