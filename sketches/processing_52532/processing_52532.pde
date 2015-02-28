

/*****************************************
 * Assignment # 3
 * Name: Jiayi Wang
 * E-mail:jwang04@brynmawr.edu
 * Course:CS 110 - Section # 2
 * Submitted: 2/14/2012
 *This is a sketch of a magician on the stage. If the mouse
 is pressed, a wheel would come out. It's the illusion
 that the magician creates.
 You can hear him say"look into my eyes".(The way to 
 import music referenced from
 http://www.openprocessing.org/visuals/?visualID=52409)
 Color of the curtain and the hat can be changed.
 The size of the wheel can also be changed.
 ***********************************************/
float a=0;
float inc;

import ddf.minim.*; //importing music files using Minim
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioSample eyes;

void setup() {
  size(800, 800);
  background(0);
  stroke(0);
  smooth();
  
   minim = new Minim(this);
  eyes = minim.loadSample("eyes.wav");
eyes.trigger();
}

void draw() {
 
  stage(255, 0, 0);//control color of the curtain
  face(11,104,244);//change color of the hat
  
  for (int m=0;m*cos(m)<255;m=m+1) {
   inc=m*cos(m)/30;
  }
  if (a> 255 || a < 0)
    inc = inc*-1;
  a=a+inc;
  if(mousePressed==true){
   plate(width/2,height/2,height, 400, a);
   plate(random(width),random(height),int(random(height)),int(random(300)),a);
}//the size of the wheel 
}


void stage(int r, int g, int b) {

  ellipseMode(CENTER);
  noStroke();
  //ground
  fill(180, 95, 18);
  rect(0, height*5/7, width, height*2/7);
  //left side
  fill(r-100, g, b);
  ellipse(0, height/7, width*0.4, height*6/7);
  fill(r-80, g, b);
  ellipse(0, height/7, width*0.3, height*6/7);
  fill(r-60, g, b);
  ellipse(0, height/7, width*0.2, height*6/7);
  fill(r-70, g, b);
  ellipse(0, height/7, width*0.1, height*6/7);
  //right side
  fill(r-100, g, b);
  ellipse(width, height/7, width*0.4, height*6/7);
  fill(r-80, g, b);
  ellipse(width, height/7, width*0.3, height*6/7);
  fill(r-60, g, b);
  ellipse(width, height/7, width*0.2, height*6/7);
  fill(r-70, g, b);
  ellipse(width, height/7, width*0.1, height*6/7);

  //middle curtain
  fill(r-20, g, b);
  ellipse(width/2, 0, width*0.4, height*16/35);
  fill(r-50, g, b);
  ellipse(width/2, 0, width*0.4, height*2/7+height*2/35);
  fill(r, g, b);
  ellipse(width/2, 0, width*0.4, height*2/7);
  //middle left curtain
  fill(r-20, g, b);
  ellipse(width*0.2, 0, width*0.2, height*2/7);
  fill(r-50, g, b);
  ellipse(width*0.2, 0, width*0.2, height*2/7-height/35);
  fill(r, g, b);
  ellipse(width*0.2, 0, width*0.2, height*2/7-height*2/35);
  //middle right 
  fill(r-20, g, b);
  ellipse(width*0.8, 0, width*0.2, height*2/7);
  fill(r-50, g, b);
  ellipse(width*0.8, 0, width*0.2, height*2/7-height/35);
  fill(r, g, b);
  ellipse(width*0.8, 0, width*0.2, height*2/7-height*2/35);
  //left
  fill(r-50, g, b);
  ellipse(0, 0, width/5, height*2/7);
  fill(r, g, b);
  ellipse(0, 0, width/5, height*2/7-height*2/35);
  //right
  fill(r-50, g, b);
  ellipse(width, 0, width/5, height*2/7);
  fill(r, g, b);
  ellipse(width, 0, width/5, height*2/7-height*2/35);
}

void face(int r,int g,int b) {
  //face
  fill(255, 232, 217);
  ellipse(width/2, height/2+height/16, width/3, width/3);
  //ear
  ellipse(width/2-width/6-width/70, height/2+height/16, width/25, height/15);
  ellipse(width/2+width/6+width/70, height/2+height/16, width/25, height/15);
  //hat
  
  fill(r, g, b);
  ellipse(width/2, height/2-height/20, width/2, height/30);
 
  quad(width/2-width/7, height/2-height/20, width/2-width/6.5, height/2-height/3, width/2+width/6.5, height/2-height/3, width/2+width/7, height/2-height/20);
  //hair
  //mustache
  fill(75, 50, 16);
  triangle(width/2-width/40, height/2+height/25+height/16, width/2-width/25, height/2+height/30+height/16, width/2-width/10, height/2+height/10+height/16);
  triangle(width/2+width/40, height/2+height/25+height/16, width/2+width/25, height/2+height/30+height/16, width/2+width/10, height/2+height/10+height/16);
}

void plate(float x,float y,int radius, int r, float a) {

 
  //transparency
  /*  for (int m=0;m*cos(m)<255;m=m+1) {
   fill(random(255), random(255), random(255), a);
   a=m*cos(m);
   }*/
  // ellipse(x,y,radius,radius);
  for (int i=0;i<r;i++) {
    fill(random(255), random(255), random(255), a);
    arc(x, y, radius, radius, i, i+2*PI/r);
  }
}


