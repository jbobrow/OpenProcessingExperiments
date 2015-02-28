
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer mySound;

boolean start = false;
color from = color(255,0,0);
color to = color(0);
float lerpChangeA=0;
float rateOfChange=0.01;

color lerpa;
color from2 = color(0);
color to2 = color(255);
float lerpChangeB=0;
color lerpb;
boolean lerpTrue=true;

void setup() {
  minim=new Minim(this);
  mySound=minim.loadFile("mySong.wav");
  
  size(500,500);
  background(150);
  colorMode(RGB);
  lerpa= lerpColor(from, to, lerpChangeA);
  lerpb= lerpColor(from2, to2, lerpChangeB);
}

void draw() {
 
  lerpChangeA= lerpChangeA+rateOfChange;
  lerpa= lerpColor(from, to, lerpChangeA);
  if (lerpChangeA>1){lerpChangeA=0;lerpTrue=false;}
  
  if (mousePressed) {

    //start = true;
    if (start == false) {
      start = true;
      mySound.rewind();
    }
    else if (start == true) {
      start = false;
      mySound.play();
    }
  }
  //if start == true
  if(start) {
    float range=30;
    strokeWeight(2);    
    stroke(lerpa);
    mouseY+= random(-range, range);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }   
}


