
/*
We talked briefly on Sunday about for loops. This week will be incorporating for loops
 more into our tools set when programming. Basically, for loops are a way of repeating commands
 a finite amount of times. Here is the link to for loop in the reference:
 http://processing.org/reference/for.html
 
 This sketch includes a few examples of how to use for loops to create patterns.
 Each example is encapsulated in a function.
 To view the different patterns, just comment/uncomment the function call in the draw() function.
 
 How to use this sketch: Change the values. Start by changing one at a time and then re-run the sketch.
 Make a note of how the drawing changes. Repeat :)
 
 */

void setup() {
  size(400, 400);
  smooth();
  frameRate(10);
}

// uncomment the lines one at a time to view the effect of the for loop
void draw() {
  verticalLines_equalLength();
  //verticalLines_varyingLength();
  //rowRectangles_equalSize();
  //rowRectangles_randomHeight();
}

void verticalLines_equalLength() {
  background(0); // draw a white background
  stroke(255);
  // draw a series of vertical lines in the center of the display window
  for (int i = 0; i < 10; i++) {
    int x = 20 + ( i * 40 );
    line(x, 20, x, height - 20);
  }
}

void verticalLines_varyingLength() {
  background(0); // draw a white background
  stroke(255);
  // draw a series of vertical lines in the center of the display window
  for (int i = 0; i < 10; i++) {
    int x = 20 + ( i * 40 );
    int y = 20 + ( i * 40 );
    line(x, 20, x, y);
  }
}

void rowRectangles_equalSize() {
  background(0); // draw a white background
  stroke(255);
  
  rectMode(CENTER);
  for (int i = 0; i < 10; i++) {
    int x = 20 + ( i * 40 );
    int y = height / 2;
    rect(x, y, 30, 30);
  }
}

void rowRectangles_randomHeight() {
  background(0); // draw a white background
  stroke(255);
  
  rectMode(CENTER);
  for (int i = 0; i < 10; i++) {
    int x = 20 + ( i * 40 );
    int y = height / 2;
    rect(x, y, 30, random(30, 300));
  }
}

