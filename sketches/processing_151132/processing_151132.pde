
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * 
 * Modified by Jason Prine June 10, 2014 to include:
 **** keyboard colour mixer; q/w for R, a/s for G, z/x for B
 **** mouse scroll wheel simulates a zoom in and out effect
 *
 *
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

// variables for colour mixer
  float strokeValueR = 255;
  float strokeValueG = 0;
  float strokeValueB = 0;

// variable to track mouse scroll value
  float mouseFactor = 1;  

void setup() {
  

  size(500, 500);

  frame_rate_value = 60;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);

  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx*mouseFactor, ty*mouseFactor, cellsize*mouseFactor,circleNumber);
      println("R:",strokeValueR,"G:",strokeValueG,"B:", strokeValueB,"Scroll:",mouseFactor); //debugging
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  stroke(strokeValueR-50,strokeValueG-50,strokeValueB-50);
  fill(strokeValueR-180,strokeValueG-180,strokeValueB-180);
  rect(tempX, tempY, size/5, size/5);
  rect(tempX, tempY, 1, size*5);
  //stroke(strokeValueR,strokeValueG,strokeValueB);
  noFill();
  stroke(strokeValueR,strokeValueG,strokeValueB);
  line(x, y, tempX, tempY);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {
  
  int increment = 20;

  ///colour mixer added by JP
  if (key  == 'q') {
      strokeValueR = strokeValueR + increment;
    } 
    
  if (key == 'w') {
      strokeValueR = strokeValueR - increment;
    } 
    
  if (key == 'a') {
      strokeValueG = strokeValueG + increment;
    } 
    
  if (key == 's') {
      strokeValueG = strokeValueG - increment;
    } 
    
  if (key == 'z') {
      strokeValueB = strokeValueB + increment;
    } 
    
  if (key == 'x') {
      strokeValueB = strokeValueB - increment;
    }

 // ensure backgroundValue is constrianed between 0 and 255
  strokeValueR = constrain(strokeValueR,0,255);
  strokeValueG = constrain(strokeValueG,0,255);
  strokeValueB = constrain(strokeValueB,0,255);
}

void mouseWheel(MouseEvent event) {
  mouseFactor = constrain(mouseFactor + event.getCount(),1,4);
  println(mouseFactor);
}
