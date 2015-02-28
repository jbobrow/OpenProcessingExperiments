
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim m;
SoundCircle circ;
 
void setup(){
  size(500,500);
  smooth();
  frameRate(1000);
  m = new Minim(this);
  AudioPlayer player = m.loadFile("ee.wav");
  circ = new SoundCircle(250,250,100,player);
}
 
void draw(){
  if(circ.isOver(mouseX, mouseY)){
     circ.play(dist(mouseX,mouseY,pmouseX,pmouseY));
  }
  background(255);
 circ.draw();
}
 
//void mousePressed(){
// if(circ.isOver(mouseX, mouseY))
//    circ.play();
//}

