
import processing.pdf.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

int okay;



void setup(){
  size(500, 500);
  okay = 10;

minim = new Minim(this);
song = minim.loadFile("dog.wav");
song.play();
}



    
void draw(){
  //background(255);
  //line(okay,0,okay,height);
  if(okay<255){
    okay = okay+1;
  }else{okay=0;}
    
    
    
  noStroke();
  fill(okay,0,25,100);
  quad(mouseX, mouseY, 25, 95, 35, 65, 35, 45);
  quad(mouseX, mouseY, 25, 95, 35, 65, 65, 45);

}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

