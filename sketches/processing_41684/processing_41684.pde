
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim nobro;
Minim yehbro;
AudioPlayer beep;
AudioPlayer beep2;

PImage b;

int hasmouseP = 0;
int xwidth;
int ywidth;
int xwidth2;
int ywidth2 = 400;
int go = 0;

void setup() {
  size(400,400);
  frameRate(50);

  yehbro = new Minim(this);
  beep = yehbro.loadFile("pitchchangereverse.wav");
  nobro = new Minim(this);
  beep2 = nobro.loadFile("pitchchange.wav");
  smooth();
   
  b = loadImage("data/gradient.jpg");
  
  
}

void draw() {
  //background(255,255,255);

  //GRADIENT
  image(b, 0, 0);  
  
  
  
  //square
  if(hasmouseP == 1){
  rectMode(CENTER);
  strokeWeight(2);
  stroke(255);
  fill(0,0,0,0);
  rect(200,200,xwidth,ywidth);
  }
  
  if(go == 1){
    ywidth2 = ywidth2 - 2;
    xwidth2 = ywidth2;
    beep2.play();
 rect(200,200,xwidth2,ywidth2);
    
  }
  
  if(ywidth2 == 0){
    beep2.pause();
    beep2.rewind();
    ywidth2 = 400;
    go =0;
  }
  
  if(hasmouseP == 0){
   xwidth = 0; 
   ywidth = xwidth; 
   beep.rewind();
   beep.pause();
  
  }
  else{
    xwidth = xwidth + 2;
    ywidth = xwidth;
    beep.play();
    if(xwidth > 400){
   beep.pause();
  beep2.play();
   hasmouseP = 0;
   go = 1;
  }
    
  }
     if(mouseButton == RIGHT){
      hasmouseP = 0; 
     }
}
void mousePressed() {
 hasmouseP = 1; 
 
}

void mouseReleased() {
 // hasmouseP = 0;
}

  
  




