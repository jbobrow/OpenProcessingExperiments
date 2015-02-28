
//set window, bg &anti;-alias
void setup(){
size(400,400);
background(255);
smooth();
}
 
//set drawing
void draw(){
background(255);
//color mode & text load and set
 colorMode(RGB,255,255,255);
 
//limit
int w=width/2;
int a=height/2;
int m2;
//clock & position & size variables
int s = second();  // Values from 0 - 59
int m = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23
 
//clock variables map
  s=(int) map (s, 0,60, 0, height/2);
  m=(int) map (m, 0,60, 0, 360);
  h=(int) map (h, 0,24, 0, 360);
  
  
  noStroke();
   
  //seconds
  fill(255,134,80,90);
  ellipse(w,a, s, s);
  
  //minute
  fill(80,255,230,90);
  ellipse(w,a, m, m);
  
  //hour
  fill(255,255,80,90);
  ellipse(w,a, h, h);
}

