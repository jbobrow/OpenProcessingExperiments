
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. 
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

/// colores
color fond=#ebe7e8;
color ros1=#ebc9e2;
color ros2= #e47cd1;
color vio1=#b57ccd;
color vio2=#8249d4;

void setup() {
  size(800, 600);

  frame_rate_value = 6;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(fond);
}


void draw() {
  smooth();

  background(fond);

  int num = 20;
  int margin = 0;
  float gutter = 5; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);



  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;// = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
    
         
    
      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
  
  
   float scal=map(mouseX,0,width,1,60);
   
   frame_rate_value = int(scal);
  
  
  
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {


  
  
  
  float finalAngle;
  finalAngle =radians( frameCount + circleNum)*100;



  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size /2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size/2) * cos(PI / frame_rate_value * finalAngle);

  float d=sin(radians(finalAngle*8))*size*2;
  fill(ros1,100);
  noStroke();
  rect(x+tempX,y,d,d);
  
    fill(vio1,100);
  
    ellipse(tempX,tempY,d/2,d/2);  
    
    fill(vio2,100);
    ellipse(tempY-x,tempY+y,5,5);
    
    rect(tempX,tempY,1,d);


}

