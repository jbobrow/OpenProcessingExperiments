
// Created by Fatima Zahrah Rashid for Interactivity 1. Theme = Attract/Avoid.
float r = (0);
float l = (400);
float d = (200);
float w = (2);
float h = (2);
void setup(){
  size(400,400);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  frameRate (150);
}
void draw(){
 fill(0, 2);  // background colour, alpha for motion blur
 rect(0,0,width,height); // background shape size of window
 fill(255,0,200);  // circle fill colour shape size of window
 rect(r,d,w,h);
r +=2;
if (r > 400){
  r = 0;
  d = random (0,400) ;
}
h +=1;
if (h > 200){
  h = 0;
}
 fill(0,0,200);  //
 rect(l,d,w,h);
l -=2;
if (l < 0){
  l = 400;
  d = random (0,400) ;
}
h +=1;
if (h > 200){
  h = 0;
}



}


