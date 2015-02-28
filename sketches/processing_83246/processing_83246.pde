
PImage abs;
float r=0;
float b=0;
float g=0;
int y=int(random(0,40));
int x=int(random(15,30));
void setup(){
  size(640,640);
  abs=loadImage("507_3828578[1].jpg");
}
void draw(){
  frameRate(1);
  int count=0; 
  int counts=0;
  background(abs);
  while(count<x){
    if(x%3==0){
      ellipse(int(random(600)),int(random(600)),100,100);
    }
    if(x%5==0){
      rect(int(random(600)),int(random(600)),int(random(300)),100,100);
    }
    if(x%2==0){
      rect(int(random(600)),int(random(600)),int(random(300)),int(random(300)));
    }
    if(x%3==0 && x%5==0 || x%5==0 && x%2==0 || x%2==0 && x%3==0){
      ellipse(int(random(600)),int(random(600)),int(random(300)),int(random(300)));
    }
    if(x%6==0){
     fill(255,0,0);
    }
    if(x%4==0){
      fill(0,0,255);
    }
    if(x%4==0 && x%6==0){
      fill(153,2,255);
    }
    count=count+1;
  }
  println(x);
  x=x*2;
  if(x>150){
    x=int(random(15,30));
  }
  textSize(40);
  text(x,20,40);
  fill(0,0,0);
}


