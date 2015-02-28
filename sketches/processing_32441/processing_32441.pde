




int a=0;
int b=10;
int c=20;
int y=0;


void setup(){
  size(500,500);
 noFill();
  background(255);
 
 fill(255,0,0,10);
 noStroke();
  
}

void draw(){
 
 while(b<250){
 
 ellipse(a,y,c,c);  
 ellipse(a,y,b,b);
  
  b=b+50;
  
}

a=a+100;
b=0;


if (a >500) {
  y=y+60;
  a=0;}





}

