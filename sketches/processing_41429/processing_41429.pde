
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer pop;

void setup(){
  
  size(700,400);
  background(255);
  
  m = new Minim(this);
  pop = m.loadFile("bottlepop.wav");
      
}

float x = 0;
float y = 200;
float z = 0;
float fl = 255;

void draw(){
  noStroke();
  fill(255,20);
  rect(0,0,width,height);
  x = width/2;
  if (x > width){x = 0;}
  fill(fl,fl/2,0);
  ellipse(x,y,80,80);
  strokeWeight(2);
  stroke(fl,fl/2,0,z-5);
  noFill();
  ellipse(x,y,100+(3*(100-z)),100+(3*(100-z)));
  


  if (dist(mouseX,mouseY,x,y)<40){
    if (z <= 5){
    pop.loop(0);
    
    fl = 55;
    z = z + 100;}}
    
  if (z > 5){z = z * 0.9;}
  if (fl < 255){fl = fl + 5;}
    
}

