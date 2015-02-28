
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer chimp;


void setup(){
  size(500,500);
  
  m = new Minim(this);
  chimp = m.loadFile("Chimpanzee.wav");
    
}



void draw(){
  
  ellipse(250,250,100,100);
  
}


void mousePressed(){
  if(dist(250,250,mouseX,mouseY) < 50){
    chimp.play();
  if(chimp.isPlaying()){
    chimp.pause();
    chimp.rewind();    
  }   
  chimp.loop(0);
  }
}  



