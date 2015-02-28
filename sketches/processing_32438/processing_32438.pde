
int x1=3;
int y1=3;
int x2=4;
int y2=4;
int x3=5;
int y3=5;
int x4=6;
int y4=6;

int x5=0;
int y5=150;
int x6=100;
int y6=300;
int x7=165;
int y7=289;
int x8=128;
int y8=468;



void setup(){
  size(400,550);
  background(0);
  strokeWeight(2);
  stroke(0,255,0,10);
  smooth();
  noLoop();
}

void draw(){
//first line
/*
  noFill();
  while (x1<400){
  rect(x1,y1,x2,y2,x3,y3,x4,y4);
  x1=x1+3;
  x2=x2+4;
  x3=x3+3;
  x4=x4+4;
  y1=y1+104;
  y2=y2+3;
  y3=y3+24;
  y4=y4+3;
  }
  */
//second line
 noFill();
 while (x5<400){
  rect(x5,y5,x6,y6,x7,y7,x8,y8);
  x5=x5+6;
  x6=x6+8;
  x7=x7+17;
  x8=x8+50;
  y5=y5+4;
  y6=y6+5;
  y7=y7+6;
  y8=y8+6;
 }
//second line
x5=13;
y5=32;
x6=4;
y6=16;
x7=10;
y7=10;
x8=18;
y8=20;

 noFill();
 while (x5<400){
  rect(x5,y5,x6,y5,x7,y5,x8,y5);
  x5=x5+6;
  x6=x6+10;
  x7=x7+40;
  x8=x8+8;
  y5=y5+2;
  y6=y6+2;
  y7=y7+2;
  y8=y8+2;
 }
  
  
  //second line
x5=40;
y5=87;
x6=64;
y6=46;
x7=83;
y7=62;
x8=56;
y8=26;

 noFill();
 while (x5<400){
  rect(x5,y5,x6,y5,x7,y5,x8,y5);
  x5=x5+6;
  x6=x6+10;
  x7=x7+40;
  x8=x8+8;
  y5=y5+2;
  y6=y6+2;
  y7=y7+2;
  y8=y8+2;
 }
  
}

