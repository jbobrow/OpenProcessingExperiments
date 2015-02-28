
import processing.pdf.*;
//beginrecord();
float x = 0;
float y = 0;
float shapeSize = random(1,20);
int hello = 20;
int goodbye = 20;
int timer = 0;
int h = 50;

void setup(){
  size(500, 250);
  background(0);
  stroke(255,255,0,15);
  smooth();
  rectMode(CENTER);
  frameRate(10);
  noLoop();
  strokeWeight(10);
}

void draw(){

  
rotate(200);
rotate(100);
  
  
  while(timer<200){
  
 
  
  while (shapeSize<90){
    
    
    fill(0,random(50));
    line (x,y,shapeSize,shapeSize);
    line (x+10,y,shapeSize,shapeSize);
    line (x+30,y,shapeSize,shapeSize);
    fill(255,random(50));
    line (x+40,y,shapeSize,shapeSize);
    
    
    rotate(180);
       fill(255,0,0,50);
    line (x,y,shapeSize,shapeSize);
    line (x+10,y,shapeSize,shapeSize);
    line (x+30,y,shapeSize,shapeSize);
    fill(255,random(50));
    line (x+40,y,shapeSize,shapeSize);
    translate(250,-50);
    rotate(360);
    stroke(255,10);
    rotate(180);
     fill(0,random(50));
    line (x,y,shapeSize,shapeSize);
    line (x+10,y,shapeSize,shapeSize);
    line (x+30,y,shapeSize,shapeSize);
    fill(255,random(50));
    line (x+40,y,shapeSize,shapeSize);
    
    
  
       fill(255,0,0,50);
    line (x,y,shapeSize,shapeSize);
    line (x+10,y,shapeSize,shapeSize);
    line (x+30,y,shapeSize,shapeSize);
    fill(255,random(50));
    line (x+40,y,shapeSize,shapeSize);

 
    shapeSize = shapeSize+random(20,40);
    x = x+random(30,50);
    y = y+random(40,60);
    fill(255,2); 
  }
  stroke(255,255,0,10);
  ellipse(20,20,h,h);
  h = h +2;
  x = x + 100;
  shapeSize = 10;
  
 
  //endrecord
  timer = timer + 1;
  }
      
}

