
/*
Rug Pattern
Ana C. Villa
Feb 10, 2011
*/

import processing.pdf.*;
boolean record;

void setup() {
  size(480, 720);
  background (44,157,164);
}

void draw (){
  if(record){
    beginRecord(PDF,"frame-####.pdf");
  }
  
  rectMode(CENTER);
  noStroke();
  //white rectangle center
  fill(28,116,121);
  rect(width/2, height/2, width-width/5, height-height/8);
  
  //corner squares
  fill(219,180,0);
  rect(width-width/6, height-height/10, 80,80);
  rect(width/6, height/10 ,80,80);
  rect(width-width/6, height/10, 80, 80);
  rect(width/6, height-height/10, 80, 80);
  
  //squares
  fill(219,180,0);
  rect(width-width/12, height-height/10, 40,40);
  rect(width/12, height/10 ,40,40);
  rect(width-width/12, height/10, 40,40);
  rect(width/12, height-height/10, 40,40);
  //
  rect(width-width/6, height-height/6.5, 40,40);
  rect(width/6, height/6.5 ,40,40);
  rect(width-width/6, height/6.5, 40,40);
  rect(width/6, height-height/6.5, 40,40);
  //
  rect(width-width/4, height-height/10, 40,40);
  rect(width/4, height/10 ,40,40);
  rect(width-width/4, height/10, 40,40);
  rect(width/4, height-height/10, 40,40);
  //
  noStroke();
  fill(44,157,164);
  rect(width/2, height-height/4, 240,40);
  rect(width/2, height-height/3.3, 240,10);
  
  rect(width/2, height/4, 240,40);
  rect(width/2, height/3.3, 240,10);
  
  rect(width/2, height-height/3, 240,5);
  rect(width/2, height/3, 240,5);
 
  //yellow rect, stroke
  noFill();
  strokeWeight(20);
  stroke(219,180,0);
  rect(width/2, height/2, 260,443);
  
  //center
  noStroke();
  fill(219,180,0);
  rect(width/2-30,height/2-30, 40,40);
  rect(width/2+30,height/2+30, 40,40);
  rect(width/2+30,height/2-30, 40,40);
  rect(width/2-30,height/2+30, 40,40);

  //center2
  noStroke();
  fill(28,116,121);
  rect(width/2,height/2,60,60);
  fill(44,157,164);
  rect(width/2, height/2,40,40);
  stroke(219,180,0);
  noFill();
  rect(width/2, height/2,20,20);
}

                
                
