
/*
 * statishn - Waves tweak of:-
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
  size(500, 500);
  colorMode(HSB, 100);
  frame_rate_value = 9;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  colorMode(HSB,100);
}


void draw() {
 background(60 ,10, 20);


  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int k = 0; k < 40; k += 2){
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx+k, ty+k, cellsize, circleNumber);
    }
  }
}
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {
  float alpha = 20;
  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(100-millis()%100 ,100,100, alpha);
  ellipse(tempX, tempY, millis()%15, millis()%15);
  stroke(millis()%100 ,100,100,alpha);
  rect(tempX, tempY, 1, size*5);
  noFill();
  stroke(100-millis()%100 ,100,100, alpha);
  line(x, y, tempX, tempY);
 
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

void keyPressed() {
  if (key == 's'){
    saveFrame("waves.png");
  }
}
