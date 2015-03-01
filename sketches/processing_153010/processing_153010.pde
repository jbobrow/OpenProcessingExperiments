
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
color[] colors = new color[5];//define an array of 3 colors
int colorCount= int(random(5));// generate a random integer 0,1,2


void setup() {
  size(1000, 1000);

  frame_rate_value =3;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
  colors[0]= color(0,67,88);// set the first color( at array position 0)
  colors[1] = color(31,138,112);// set the secon color(at array position 1)
  colors[2] = color(190,219,57);// set the third color(at array postion2)
  colors[3] = color(255,225,26);// set the fourth color(at array postion3)
  colors[4] = color(253,116,0);// set the fifth color(at array postion4)
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

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(253,0,2,200);
  rect(tempX, tempY, size/3, size/5);
  fill(colors[colorCount]);// fill with a color from array => 0,1,or 2
  rect(tempX, tempY, 10, size*10);
  stroke(0);

  stroke(colors[colorCount]);
  line(x,y, tempX, tempY);
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

void mousePressed(){
    colorCount++;// if mousepressed ad 1 to color count
    if(colorCount>4) colorCount=0;// if color Count is higher than 2, set color count to 0
}



