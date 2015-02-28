
// John C Campbell
// ISTA 301 Assignment 3
// Create an example of generative art in Processing

//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
// I really tried to add sound but could not get the directory to path to that libraries files.

//Minim m;
//AudioPlayer laser;
//AudioPlayer alarm;


void setup() {
  size(1020, 800);// My display needed to be larger to fit my crazy guy
  background(255,8,128);
  
//  m = new Minim(this);
//  alarm = m.loadFile("alarm.wav");
  
}   

void draw() {
  background (random(255));
  
stroke(255);
line(mouseX,mouseY,10,101);// Just moving around my guy

   fill(random(255));
  ellipse(500,500,400,400);
   
   fill(random(255));
  ellipse(500,300,280,270);
   
     fill(random(255));
     rect(600,400,555,50);
 
fill(random(255));
     rect(-160,400,555,50);
   
  fill(random(255));
  ellipse(400,300,100,100);
   
  fill(random(255));
  ellipse(400,300,50,50);
   
    fill(random(255));
     
 ellipse(600,300,100,100);
   
    fill(random(255));
  ellipse(600,300,50,50);
   
 fill(0);
  ellipse(500,350,25,25);
   
 fill(0);
  ellipse(500,400,50,50);

 
fill(0,0,255);
stroke(0,0,255);
rect(0,0,200,100);

 
fill(0,255,0,200);
ellipse(50,50,30,30);
}
  



