
int x1=10;
int y1=10;
int x2=20;
int y2=20;
int x3=30;
int y3=30;
int x4=40;
int y4=40;

void setup(){
  smooth();
  size(400,550);
  background(0);
  stroke(0,255,0,30);
  strokeWeight(2);
noLoop();
}

void draw(){
 
//rectangle
  noFill();
  while (x1<400){
  rect(x1,y1,x2,y2,x3,y3,x4,y4);
  x1=x1+3;
  x2=x2+16;
  x3=x3+3;
  x4=x4+2;
  y1=y1+4;
  y2=y2+5;
  y3=y3+6;
  y4=y4+18;
}
  
//rectangle
  x1=500;
  x2=400;
  x3=300;
  x4=300;
  y1=150;
  y2=150;
  y3=269;
  y4=189;
  noFill();
  while (x1<400){
  rect(x1,y1,y2,y2,y3,y3,x3,y4);
  x1=x1+3;
  x2=x2+16;
  x3=x3+3;
  x4=x4+2;
  y1=y1+4;
  y2=y2+5;
  y3=y3+6;
  y4=y4+18;
}  
  
  //rectangle
  strokeWeight(1);
  x1=2;
  x2=2;
  x3=3;
  x4=2;
  y1=2;
  y2=2;
  y3=2;
  y4=1;
  noFill();
  while (x1<5000){
  rect(x1,y1,y2,y2,y3,y3,x3,y4);
  x1=x1*2;
  x2=x2*2;
  x3=x3+3;
  x4=x4+2;
  y1=y1*2;
  y2=y2+5;
  y3=y3*2;
  y4=y4+18;
}  
  
}



