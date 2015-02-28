
PFont font;
float x=0;


void setup(){
  size(500,500);
  background(0);
  noStroke();
  smooth();
  frameRate(10);
  textSize(15);
}


void draw(){
  fill(0,0,0,25);
  rect(0,0,width,height);
  
  
  translate(455,200);
  fill(#F1F1F3);
  rotate(x);
  text("Generosity",width/5,height/5);
  resetMatrix();
  
  translate(250,250);
  fill(#DCAEEE);
  rotate(x);
  text("Magic",width/10,height/10);
  resetMatrix();
  
  
  translate(250,100);
  fill(250,179,209);
  rotate(x);
  text("Laughter", width/10,height/10);
  resetMatrix();
  
  
  translate(300,50);
  fill(255,195,107);
  rotate(x);
  text("Honesty", width/10,height/10);
  resetMatrix();
  
  
  translate(200,250);
  fill(159,231,255);
  rotate(x);
  text("Loyalty", width/10,height/10);
  resetMatrix();
  
  
  translate(355,450);
  fill(252,244,164);
  rotate(x);
  text("Kindness", width/10,height/10);
  resetMatrix();
  
  x=x-15;
  }
