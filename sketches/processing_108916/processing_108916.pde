
void setup(){
size(400,400);
smooth();
background(23,52,3);
rectMode(CORNERS);
frameRate(10);
}
void draw(){
  gradientBox();
  name();
}
//randomize colors
color randomColors(){
float R= random(1,250);
float G =random(1,250);
float B =random(1,250);
return color(R,G,B);
}
//randomize location
float randomPlace(){
  float Rand =  random(10,270);
  return Rand;
}
//randomize size
float randomSize(){
  float Rand =  random(1,5);
  return Rand;
}
//makes the boxes
void gradientBox(){
fill(randomColors());
int w=0, x=0, y=400,z=400,a=0,b= 215,c= 255;
rect(w,x,y,z);
while(y>0){
  a+=3;
  b-=3;
  c-=3;
  float rand = randomSize();
  w+=rand;
  y-=rand;
  x+=rand;
  z-=rand;
  stroke(randomColors());
  if (x>300){
    exit();
  }
  else{
  rect(w,x,y,z);
  } 
}
}
//creates letters
void name(){
//m
stroke(randomColors());
strokeWeight(10);
float M= randomPlace();
line(M, M+50,M, M+130);
line(M,M+50,M+30,M+130);
line(M+60,M+50,M+30,M+130);
line(M+60, M+50, M+60,M+130);
//A
stroke(randomColors());
float A= randomPlace();
line(A+20, A+80, A+50, A);
line(A+80, A+80,A+50, A);
line(A+35, A+55, A+70, A+55);
//X
stroke(randomColors());
float X= randomPlace();
line(X+90, X, X+130, X+80);
line(X+90, X+80, X+130, X); 
}
