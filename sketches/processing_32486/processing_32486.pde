
int x1=12;
int y1=1;
int h =5;
int w=50;
int x2=3;
int y2=25;
int a=10;

void setup(){
  size(400,550);
  background(0);
  noFill();
  stroke(0,255,0,20);
  smooth();
  
}

void draw(){
//first line of code
  if(y1<650){
  while (x1<350){
    strokeWeight(2);
   bezier(x1, y1, 10, x1, a, 90, a, 80);
  x1=x1+5;
  a=a+2;
  }
  x1=0;
  y1=y1*2;
 }
// second line of code  
/* if(y2<550){
  while (x2<500){
    strokeWeight(20);
  rect(x2, y2, h, w);  
  x2=x2+58;
  }
  x2=25;
  y2=y2+58;
 }  
  
    if(y1<650){
  while (x1<350){
    strokeWeight(2);
   bezier(x1, y1, x1, x1, a, y1, a, x2);
  x1=x1+7;
  a=a+5;
  }
  x1=0;
  y1=y1+30;
 }
  */
}

