
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim m;
AudioPlayer thunder;

int colour = 237;

void setup(){
  size(700,400);
  background(255);
  
  m = new Minim(this);
  thunder = m.loadFile("thunder.wav");
 
}


void draw(){
 
  
//PShape s;
//s = loadShape("cloud.svg");
//smooth();
//fill(0);
//shape(s, 5, 5, 700, 350);
}

void mouseClicked(){
  
  if(mouseY < 75){
    noStroke();
  fill(colour,colour,colour);
  ellipse(mouseX - 25, mouseY - 25,75,75);
  ellipse(mouseX + 25, mouseY + 25,75,75);
  ellipse(mouseX - 25, mouseY + 25,75,75);
  ellipse(mouseX + 25, mouseY - 25,75,75);
  colour = colour - 10;
}

if(colour < 60){
  
  if(mouseY < 75){
  thunder.loop(0);
}
  else{
 strokeWeight(2);
 fill(0);
 line(0, 40, mouseX, mouseY);
 }}

}

