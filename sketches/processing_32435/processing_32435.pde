
int x1=10;
int y1=10;
int x2=20;
int y2=20;
int x3=30;
int y3=30;
int x4=40;
int y4=40;

int x5=0;
int y5=275;
int x6=100;
int y6=375;
int x7=200;
int y7=475;
int x8=300;
int y8=575;



void setup(){
  size(400,550);
  background(0);
  strokeWeight(2);
  stroke(0,255,0,20);
  smooth();
}

void draw(){
//first line
  noFill();
  while (x1<400){
  rect(x1,y1,x2,y2,x3,y3,x4,y4);
  x1=x1+10;
  x2=x2+10;
  x3=x3+10;
  x4=x4+10;
  y1=y1+4;
  y2=y2+5;
  y3=y3+6;
  y4=y4+6;
  }
  
//second line

 while (x5<400){
  rect(x5,y5,x6,y6,x7,y7,x8,y8);
  x5=x5+25;
  x6=x6+50;
  x7=x7+75;
  x8=x8+80;
  y5=y5+4;
  y6=y6+5;
  y7=y7+6;
  y8=y8+6;
 }
  
  
  
  
  
}

