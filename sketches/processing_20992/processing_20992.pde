
/*
Rug2
feb 15, 2011
Ana C. Villa-Zamora
*/

import processing.pdf.*;
boolean record;

void setup (){
  size (480,720);
  background(251,176,64);
}

void draw (){
  if(record){
    beginRecord(PDF,"frame-####.pdf");
}

  rectMode(CENTER);
  noStroke();
  
  //whiterect
  noStroke();
  fill(255,255,255,73);
  rect(width/2, height/2-300, 400,7);
  rect(width/2, height/2-265, 400,50);
  rect(width/2, height/2-230, 400,7);
  
  rect(width/2, height/2-35, 400,7);
  rect(width/2, height/2, 400,50);
  rect(width/2, height/2+35, 400,7);
  
  rect(width/2, height/2+300, 400,7);
  rect(width/2, height/2+265, 400,50);
  rect(width/2, height/2+230, 400,7);
  
  //yellowsquares
  noStroke();
  fill(241,90,41);
  rect (width/2,height/2-75,60,60);
  rect (width/2,height/2+75,60,60);
  noFill();
  strokeWeight(3);
  stroke(251,176,64);
  rect (width/2, height/2-76, 38,38);
  rect (width/2, height/2-76, 15,15);
  
  rect (width/2, height/2+76, 38,38);
  rect (width/2, height/2+76, 15,15);
  
  //redsquares
  noStroke();
  fill(190,30,45);
  rect(width/2-63,height/2-60,30,30);
  rect(width/2+63,height/2-60,30,30);
  rect(width/2-63,height/2+60,30,30);
  rect(width/2+63,height/2+60,30,30);
  
  rect(width/2,height/2-140,45,45);
  rect(width/2,height/2+140,45,45);
  
  //orange squares
  noStroke();
  fill(241,90,41);
  rect(width/2-120, height/2-70,50,50);
  rect(width/2+120, height/2-70,50,50);
  rect(width/2-120, height/2+70,50,50);
  rect(width/2+120, height/2+70,50,50);
  
  rect(width/2-185,height/2-60,30,30);
  rect(width/2+185,height/2-60,30,30);
  rect(width/2-185,height/2+60,30,30);
  rect(width/2+185,height/2+60,30,30);
  
}

