
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer laser;
AudioPlayer alarm;

float x = 250;
float y = 250;

void setup(){
  
  size(500,500);
  smooth();

//case sensitive + add extension  
  m = new Minim(this);
  alarm = m.loadFile("alarm.wav");  
}

void draw(){
  
  background(0);
  
  ellipse(x,y,100,100);
  x=x+2;
  if(x > width)
  {
    x=0;
  } 
}

void mouseClicked(){
  
  if(dist(mouseX,mouseY,x,y)<50)
  {
//tape player = play then rewind with 'loop(0)' 
   alarm.loop(0);
   }
}

