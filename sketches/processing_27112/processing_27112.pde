
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim m;
AudioPlayer mySound; 


float x = 250;
float y = 50;
float directionx = 1;
float directiony = 1;

 void setup (){
  size(500,500);
    background(0);
    m=new Minim(this);
  mySound=m.loadFile("Finger-sna.wav");
    
  }

  


 void draw (){
  smooth();
 float d = dist (x, y, mouseX,mouseY);
 background(0);
 ellipse(x,y,50,50);




 
 
 x=x+directionx;
 

directionx=(mouseX-x)/15.0;

 
  y+=directiony;
 

directiony=(mouseY-y)/15.0;


    if (mousePressed && d <= 30) {
        mySound.rewind();
     mySound.play();
     
      smooth();
      stroke(255);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }else if (mousePressed) {
      smooth();
      stroke(255);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
    
 
   
}

