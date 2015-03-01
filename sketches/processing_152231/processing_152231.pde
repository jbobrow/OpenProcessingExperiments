
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
 * Adapted by Cliffface as part of Creative Coding by FutureLearn
 */

// variable used to store the current frame rate value
int frame_rate_value;
 float grasssize=3;//Starting point for grass like image CC

void setup() {
  size(500, 500);

  frame_rate_value = 11;
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
  fill(0);

  stroke(50,0,200);
  fill(200,0,200);
  curvedrect(tempX,tempY,size/3,size/7,2);

   stroke(0,100,0);
   fill(175,200,175);
  curvedgrass(tempX,tempY,size/10,size*grasssize,1);
 
//  curvedrect(x,y,size/5,size/5,2);
  
  stroke(1);
  noFill();
  stroke(175,175,0);
//  line(x, y, tempX, tempY);
}

 void curvedgrass(float x, float y, float xsize, float ysize, float curve){ //creates rectangle with curves like grass
    beginShape();
    vertex(x,y);
    bezierVertex(x-(xsize/(curve/2)),y-(ysize/(curve/2)),(x+xsize)-(xsize/(curve/2.5)),y-(ysize/(curve/2)),x+xsize,y);
    bezierVertex((x+xsize)+(xsize/curve),y+(ysize/curve),(x+xsize)+(xsize/curve),(y+ysize)-(ysize/curve),x+xsize,y+ysize);
    bezierVertex((x+xsize)-(xsize/(curve*4)),(y+ysize)+(ysize/(curve*4)),x+(xsize/(curve*4)),(y+ysize)+(ysize/(curve*4)),x,y+ysize);
    bezierVertex(x+(xsize/curve),(y+ysize)-(ysize/curve),x+(xsize/curve),y+(ysize/curve),x,y);
    
    endShape();
  }

void curvedrect(float x, float y, float xsize, float ysize, float curve){ //creates rectange with sides that curve out then in
    beginShape();
    vertex(x,y);
    bezierVertex(x+(xsize/curve),y-(ysize/curve),(x+xsize)-(xsize/curve),y-(ysize/curve),x+xsize,y);
    bezierVertex((x+xsize)-(xsize/curve),y+(ysize/curve),(x+xsize)-(xsize/curve),(y+ysize)-(ysize/curve),x+xsize,y+ysize);
    bezierVertex((x+xsize)-(xsize/curve),(y+ysize)+(ysize/curve),x+(xsize/curve),(y+ysize)+(ysize/curve),x,y+ysize);
    bezierVertex(x+(xsize/curve),(y+ysize)-(ysize/curve),x+(xsize/curve),y+(ysize/curve),x,y);
    
    endShape();
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
  //down arrow key decreases hight of grass
  if (keyCode ==DOWN && grasssize>.2){
  grasssize=grasssize-0.1;

  }
  //up arrow key increases hight of grass
  if (keyCode ==UP && grasssize<4){
    grasssize=grasssize+0.1;
    
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
  println("Grass size is "+grasssize);



}



