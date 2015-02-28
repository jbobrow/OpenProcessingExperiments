
int T;
int deltaT=1;

void setup(){
  size(500,500);
  background(0);
  frameRate(40);
  smooth();
  for(int i=0;i<width;i++){
    stroke(i/3,255-i/1.5,255,10);
    strokeWeight(2);
    line(i,height,width,height-i);
    line(i,0,0,height-i);
    line(i,0,width,i);
    line(0,i,i,height);
  }
}

void draw(){
  T+=deltaT;
  PImage img = get();
  translate(width/2,height/2);
  scale(sqrt(T)/10,sqrt(T)/10);
  scale(0.57,0.57);
  rotate(PI/4);
  image(img,-width/2,-height/2);
  if(T>350){deltaT=-1;} //350
  if(T%20==0)println(frameRate);
  if(T<-50){deltaT=1;}
  println(T);
}

