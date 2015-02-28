
//data set
//by emily hundley

float X;
float Y;
int dir;
void setup(){
  
  size(600,600);
  colorMode(HSB,360,100,100,100);
  smooth();
  background(278,31,56);
  float X=1;
  float Y=2;
  int dir=1;
  
}
void draw(){
   // backround table
  fill(241,8,93,57);
  stroke(241,0,0,56); 
   ellipse(width/2,height/2,571,571); 
noFill();
  fill(278,31,56);
  stroke(278,31,56);
 rectMode(CENTER);rect(X++,height/2,81,81);
 


noFill();
if(X>=600){
  X=dir;
}


if(Y==100){
  Y=0;
}

}
