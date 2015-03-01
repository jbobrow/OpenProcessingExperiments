
/*
Exercise II: Repetition and Variation
A small program recurvisely dividing the canvas area and color each sub area. 
Inspired by Mondrian
By Irene Ye Yuan 1/12/2015
*/

// Set up the canvas area
void setup(){
  // set the canvas size to 400x400
  size(400,400);
  // set the background color to white
  background(255,255,255);
  // stop the program from continuously excuting the method draw()
  noLoop();
}

// Draw something on Canvas
void draw(){
  // calls the method divArea() with 3 iterations
  divArea(0,0,400,400,3);
}

// Method for mouse event
void mousePressed() {
  // redraw the canvas
  redraw();
}

// Method for dividing a rectangular area 
// (originX, originY) is the position of the top left corner of the recatangle
// (areaWidth, areaHeight) is the dimension of the rectangle
// counter is an integer used to control the total number of iterations
void divArea(float originX, float originY, float areaWidth, float areaHeight, int counter){
  // divide the area randomly into 4 sub areas, using random method
  float dx = random(originX+5,originX+areaWidth-5);
  float dy = random(originY+5,originY+areaHeight-5);
  println(random(0,4));
  // draw the lines to show each part after dividing
  line(dx,originY,dx,originY+areaHeight);
  line(originX,dy,originX+areaWidth,dy);
  // color each sub area with method colorArea
  colorArea(originX, originY, dx-originX, dy-originY);
  colorArea(dx, dy, originX+areaWidth-dx, originY+areaHeight-dy);
  colorArea(dx, originY, originX+areaWidth-dx, dy-originY);
  colorArea(originX, dy, dx-originX, originY+areaHeight-dy);
  // check total number of iterations excuted
  if(counter > 1){
    // count one iteration has been excuted
    counter = counter - 1;
    // divde each sub area recursively if the total number of iterations is smaller than the set number
    divArea(originX, originY, dx-originX, dy-originY, counter);
    divArea(dx, dy, originX+areaWidth-dx, originY+areaHeight-dy, counter);
    divArea(dx, originY, originX+areaWidth-dx, dy-originY, counter);
    divArea(originX, dy, dx-originX, originY+areaHeight-dy, counter);
  }
  // if the set number of iterations has been reach, doing nothing 
  else{return;}
}

// Method for coloring a rectangular area 
// (originX, originY) is the position of the top left corner of the recatangle area
// (areaWidth, areaHeight) is the dimension of the rectangle area
void colorArea(float originX, float originY, float areaWidth, float areaHeight){
  // set the stroke color to black
  stroke(0,0,0);
  // set the stoke weight to 2px
  strokeWeight(2);
  // if the rectangle is relatively long-shaped then color it to yellow
  if (areaWidth > 5*areaHeight || areaHeight > 5*areaWidth){
    // set the fill color to yellow
    fill(255,255,0);
    // color the area with yellow
    rect(originX,originY,areaWidth,areaHeight);
    // else if the area is relatively big then color it to white
  }else if (areaWidth > 50 || areaHeight > 50){
    // set the fill color to white
    fill(255,255,255);
    // color the area with white
    rect(originX,originY,areaWidth,areaHeight);
    // else set 50% area to red and 50% to blue
  }else{
    // test the probability with random number generator
    float test = random(2);
    // if it's smaller or equal to one, color the area with red
    if (test <= 1){
      // set the fill color to red
      fill(255,0,0);
      // color the area with red
      rect(originX,originY,areaWidth,areaHeight);
      // else color the area with blue
    }else{
      // set the fill color to blue
      fill(0,0,255);
      // color the area with blue
      rect(originX,originY,areaWidth,areaHeight);
     }
  }
  // set the stroke to white
  stroke(255,255,255);
  // set to no fill 
  noFill();
  // change the canvas border color to white
  rect(0,0,400,400);  
}

