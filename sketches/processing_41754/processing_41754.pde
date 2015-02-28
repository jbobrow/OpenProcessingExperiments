
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int doodX = 250;
int doodY = 250;


Minim m;
AudioPlayer woof;


void setup(){
  size (700,400);
  smooth();
  
  m = new Minim(this);
  woof = m.loadFile("button-1.wav");
  
  woof.play();
  
  
}



void draw(){
  
  
 
  ellipse (doodX,doodY,100,100);
  
  
  
}

void mousePressed (){
    if (dist(doodX,doodY,mouseX,mouseY) < 50){
  woof.loop(0);
    }
}

