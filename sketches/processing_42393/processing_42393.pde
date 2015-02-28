
/*  
Author: mohan  
Purpose:a window with a view  
Concept:when you click mouse your step may be record. 
*/ 

void setup() {
  size(500, 500);
  smooth();
  background(241,231,196);
}

float sp = second();
float centerX=250;
float centerY=250;
float dir = 0.09;

void mousePressed() {  
  centerX = mouseX;
  centerY = mouseY;  
} 

void moveH() {
  centerX = centerX+sp*dir;
}

void draw() {
  noStroke();
  fill(255);
  ellipse(centerX, centerY-5, 3, 3);
  fill(160); 
  ellipse(centerX-30, centerY-5, 6, 6);
  fill(141,51,36); 
  ellipse(centerX+30, centerY-20, 8, 8);
  fill(159,133,87); 
  ellipse(centerX+50, centerY-30, 2, 2);
  fill(0); 
  ellipse(centerX-10, centerY-40, 4, 15);
  fill(124, 148, 111); 
  ellipse(centerX-10, centerY-80, 4, 15);
  fill(255); 
  ellipse(centerX-10, centerY-80, 4, 10);
  fill(231,222,152); 
  ellipse(centerX-10, centerY-40, 4, 15);
  fill(241,231,196); 
  ellipse(centerX-20, centerY-35, 6, 6);
  fill(231,222,152); 
  ellipse(centerX+20, centerY-20, 8, 8);  
  moveH();

  if (centerX>500 || centerX<0 ) {
    dir=-dir;
  }
}



