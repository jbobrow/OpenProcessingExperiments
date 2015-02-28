
/*
Program Title: A2-2
 Program Description: Write a procedure for drawing a simple character with at least two parameters,
 and use your procedure at least three times with different values of its parameters
 By Amber Choo, September 27th, 2012
 */

void setup() {
  size(701, 500); //change canvas size to 701x500 pix
}

void variableRectangle(int x, int y, int px, int py, int r, int g, int b) { //create new procedure. parameters: x=x position. y=y position. px=width. py=height. ints r,g,b = RGB color values.
  rect(x, y, px, py); //rectangles will be drawn with these variables as its values
  rect(x+5, y+5, px-10, py-10); 
  fill(r, g, b); //fill colour will be determined by variables r,g,b
}

void variableTriangle(int x, int y, int x2, int y2, int x3, int y3, int r, int g, int b) { //create new procedure. The first 6 intergers set the positions of the three points of the triangle. ints r,g,b = RGB color values.
  triangle(x, y, x2, y2, x3, y3); //triangles will be drawn with these variables as its values
  triangle(x+10, y-5, x2, y2+5, x3-10, y3-5); 
  fill(r, g, b); //fill colour will be determined by variables r,g,b
}

void robot(int x, int y, float s, int r, int g, int b) { //x and y are for location. s is for scale. The rest are for RGB color. 
  scale(s); //we will use this to make a family of robots of different sizes
  fill(r, g, b); //changes color of body, below. 
  variableRectangle(200+x, 200+y, 200, 200, r, g, b); //body
  variableRectangle(250+x, 150+y, 100, 100, 255, 255, 255); //head
  variableRectangle(310+x, 170+y, 20, 30, 255, 255, 255); //right eye 
  variableRectangle(270+x, 170+y, 20, 30, r, g, b); //left eye
  variableRectangle(225+x, 400+y, 50, 150, r-30, g-30, b-30); //left leg
  variableRectangle(210+x, 500+y, 80, 50, r, g, b); //left shoe
  variableRectangle(325+x, 400+y, 50, 150, r-30, g-30, b-30); //right leg
  variableRectangle(310+x, 500+y, 80, 50, r, g, b); //right shoe
  variableRectangle(160+x, 210+y, 50, 150, r, g, b); //left arm
  variableRectangle(390+x, 210+y, 50, 150, 255, 255, 255); //right arm
  variableRectangle(270+x, 220+y, 60, 20, r-30, g-30, b-30); //mouth
  variableTriangle(250+x, 150+y, 300+x, 100+y, 350+x, 150+y, r, g, b); //hat
}

void draw() { 
  //tiles in the background:
  int i = 0; //declare variable i and j for use in while loop
  int j = 0; 
  while (i <= width && j <= height) { //while variable i and j are within the parameters of the screen
    rect(i, j, 30, 30); //draw a rectangle at i, j, 30x30pixels
    i = i + 25; //and add a value of 25 to i to keep drawing on x axis
    fill(random(150, 255), random(150, 255), random(150, 255));  //IT'S PARTY TIME
    while (i > width) { //when variable i becomes greater than the width of the screen
      i = 0; //reset i's value to 0 (so we can (start drawing a new line from the left side of the screen...)
      j = j+25; //and add 25 to j (new line of rectangles will be below the last drawn line.)
    }
  }
  //parameters for robots below: x location, y location, scale, R color value, G color value, B color value (RGB)
  robot(-100, -50, 1, 100, 100, 200); //man robot
  robot(100, 7, 0.9, 255, 160, 160); //lady robot
  robot(450, 245, 0.7, 140, 190, 230); //boy robot
  robot(1000, 585, 0.7, 255, 180, 180); //girl robot
}



