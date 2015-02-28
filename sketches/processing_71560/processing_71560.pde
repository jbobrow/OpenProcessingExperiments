
//Devon Kelley HW 3
//used http://processing.org/learning/basics/incrementdecrement.html for reference

int fillColor;
int a;
int b;
boolean direction;

void setup(){
  size(600,600);
  background(fillColor,2,32,95);
  a=0;
  b=width;
  direction=true;
  frameRate(80);
}

void draw(){
  if(a>0 && a<100){
  background(105,10,120);
  }else if(a>100 && a<250){
    background(40,100,2);
  } else if(a>250 && a<600){
    background(90,100,242);
  }
  a++;
  if(a>400){
    a=-1;
  }else if(a<0){
   b=1;
  }
  rect(a,300,200,200);
  fill(240,7,7);
}

