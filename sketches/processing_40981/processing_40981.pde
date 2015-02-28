
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer p;

int x1 = 200;
int y1 = 250;
int y2 = 250;
int x2 = 200;

void setup(){
  size(700,400);
  background(0);
  
  /*m = new Minim(this);
  p = m.loadFile("button-14.wav");
  
  p.play();*/
}

void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
  stroke(255);
  line(x1,y1,200,400);
  y1 = y1 + 5;
  x1 = x1 - 5;
  line(x2,y2,200,400);
  y2 = y2 + 5;
  x2 = x2 + 5;
   { m = new Minim(this);
     p = m.loadFile("button-14.wav");
   p.play();}
  }
  
}

