
PFont myFont;
int h;
int m;
int s;
int posXh;
int posYh;
int sizeh = 4;
int posXm;
int posYm;
int sizem = 4;
int posXs;
int posYs;
int sizes = 4;

import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup(){
  size(320,500);

}

void draw(){
  background(23,152,255);
  
  h = hour();
  m = minute();
  s = second();
  
  for(int i=0; i<s; i++){
   posXh = 180;
   posYh = height-60 - i*sizeh;
   
   strokeWeight(1);
   stroke(23,152,255);
   fill(174,240,10);
   rect(posXh,posYh,sizeh*10,sizeh); 
   
  }
  for(int i=0; i<m; i++){
   posXm = 140;
   posYm = height-60 - i*sizem;
   
   strokeWeight(1);
   stroke(23,152,255);
   fill(174,240,10);
   rect(posXm,posYm,sizem*10,sizem); 
   
  }
  
  for(int i=0; i<h; i++){
   posXh = 100;
   posYh = height-60 - i*sizeh;
   
   strokeWeight(1);
   stroke(23,152,255);
   fill(174,240,10);
   rect(posXh,posYh,sizeh*10,sizeh); 
   
  }
  

  
  translate (width/2,height/5);
  noFill();
  strokeWeight(3);
  stroke(174,240,10);
  ellipse(0,0,160,160);
  strokeCap(SQUARE);
 

// h
  strokeWeight(4);
  stroke(174,240,10);
  fill(0);
  rotate(radians (30*h));
  line(0,0,0,-40);
  
// m
  strokeWeight(4);
  stroke(174,240,10);
  fill(0);
  rotate(radians (6*m));
  line(0,0,0,-70);
  
// s
  strokeWeight(4);
  stroke(174,240,10);
  fill(0);
  rotate(radians (6*s));
  line(0,0,0,-80);
  
 
  
}
