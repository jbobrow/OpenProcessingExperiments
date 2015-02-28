
/*
Homework2: Loops and Functions SK
April 22, 2012 */

void setup() {
  size(400, 400);
  smooth();
  frameRate(10); 
}

void draw() {
  //verticalLines_equalLength();
   //verticalLines_varyingLength();
  //rowRectangles_equalSize();
  rowRectangles_randomHeight();
}

void verticalLines_equalLength() {
  background(0); // draw a white background
  stroke(255);
  // draw a series of vertical lines in the center of the display window
  for (int i = 0; i < 60; i++) {
    int x = 10 + ( i * 20 );
    line(x, 1, x, height - 1);
  }
}

void verticalLines_varyingLength() {
  background(0); // draw a white background
  stroke(255);
   fill(0, 0, 255);
  // draw a series of vertical lines in the center of the display window
  for (int i = 0; i < 60; i++) {
    int x = 10 + ( i * 20 );
    int y = 20 + ( i * 40 );
    line(x, 40, x, y);
  }
}

void rowRectangles_equalSize() {
  background(0); // draw a white background
  stroke(255);
   fill(0, 255, 0);
  
  rectMode(CENTER);
  for (int i = 0; i < 20; i++) {
    int x = 20 + ( i * 40 );
    int y = height / 6;
    rect(x, y, 30, 15);
  }
}


void rowRectangles_randomHeight() {
  background(255); // draw a white background
  noStroke();
  fill(255, 0, 0, 90);
  
  rectMode(CENTER);
  for (int i = 0; i < 60; i++) {
    int x = 0 + ( i * 20 );
    int y = height / 2;
    rect(x, y, 5, random(200, 400));
  } 
     rectMode(CENTER);
  for (int i = 0; i < 60; i++) {
    int x = 5 + ( i * 20 );
    int y = height / 2;
    rect(x, y, 30, random(150, 200));
  }
}

