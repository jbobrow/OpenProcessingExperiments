
int y=0;
int h=200;
int i=225;
int j=250;
int k=275;
int speed=3;
int speedier=4;
int speediest=5;
int speediester=6;
int fast=7;
void setup(){
  size(400,400);
  smooth();
}
void draw(){
  background(255);
  frameRate(30);
  float r=random(255);
  float g=random(255);
  float b=random(255);
  fill(r,g,b,75);
  strokeWeight(2);
  if(y>200){
    rect(0,200,400,200);
  }
  
  if(y<200){
    fill(r,g,b);
  }
  else{
    fill(255);
    ellipse(25,h,10,10);
    ellipse(50,i,10,10);
    ellipse(75,j,10,10);
    ellipse(100,k,10,10);
    ellipse(125,h,10,10);
    ellipse(150,i,10,10);
    ellipse(175,j,10,10);
    ellipse(225,j,10,10);
    ellipse(250,i,10,10);
    ellipse(275,h,10,10);
    ellipse(300,k,10,10);
    ellipse(325,j,10,10);
    ellipse(350,i,10,10);
    ellipse(375,h,10,10);
    h=h+speedier;
    if((h<200)||(h>=400)){
      speedier=speedier*-1;
    }
    i=i+speediest;
    if((i<200)||(i>=400)){
      speediest=speediest*-1;
    }
    j=j+speed*4;
    if((j<200)||(j>=400)){
      speediester=speediester*-1;
    }
    k=k+speed*5;
    if((k<200)||(k>=400)){
      fast=fast*-1;
    }
  }
  
  ellipse(200,y,40,40);
  y=y+speed;
  if((y<0)||(y>=400)){
    speed=speed*-1;
  }
  strokeWeight(10);
  line(0,200,400,200);
}
