
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

void setup() {
  size(800, 600);
  background(255);
  frame_rate_value = 8
  ;
  frameRate(frame_rate_value);
  rectMode(CORNER
  );
  background(255);
  float angle;
  
}


void draw() { 

  background(#FF00FF);          //  dark blue bg 
  stroke(0);
  fill(#6E6E6E,100);
 
  int num = 30; 
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 3) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 3) * cos(PI / frame_rate_value * finalAngle);
  
   //rect(tempX, tempY, size/5, size/5);
   rect(tempX, tempY, size, 15);
   
      

 
   fill (#F24A20,190);  //Red
   ellipse(x, y, 10, 10 );
  
  //gray-blue grid background, segments that vary in size
  fill(#1c384e,180);
    rect(x, y, 10*sin(PI / frame_rate_value * finalAngle), 100 );
    rect(x, y, 100, 8*sin(PI / frame_rate_value * finalAngle));

  
  stroke(#b8cde0); 
  line(x,y, tempX, tempY);

   noStroke();
    fill (#F24A20,100);
    ellipse(tempX, tempY, 15, 15);
   
 float tsize = 5;
// fill (#FF8000,100);
// triangle(tempX-tsize, tempY+tsize, tempX, tempY-tsize, tempX+tsize, tempY+tsize);    
 
 
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}





