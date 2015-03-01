
/*
 * Creative Coding
 * Week 1, 02 - Draw your name! (part 2)
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */

// variables for the angle (in radians) and increment 
float angle;
float inc;
float cursorX;
float cursorY;
float originX = 250.0;
float originY = 250.0;
float pcursorX = originX;
float pcursorY = originY;
float r = 0;
float theta = 0;
float dr = 0.25;
float thetaScale = 20;

void setup() {
  size(500, 500);
  background(0);

  rectMode(CENTER);  // rectangles drawn from the centre

  // initialise angle and inc to 0
  angle = 0;
  inc = 0;
}


void draw() {
  dr = (originX - mouseX) / 40;
  thetaScale = (thetaScale + 0.1 * abs(originY - mouseY)) / 2;
  cursorX = originX + r * sin(float(frameCount)/thetaScale);
  cursorY = originY + r * cos(float(frameCount)/thetaScale);
  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  // map the mouse x position to the range (0.01, 0.08)
  inc = map(cursorX, 0, width, 0.01, 0.08);

  // incremment the current angle
  angle = angle + inc;

  if (true) { //mousePressed) {

    stroke(255, 30); 
    fill(255, 30);

    rect(cursorX, cursorY, 2, 2);

    line(cursorX, cursorY, pcursorX, pcursorY); // pmouse is the mouse position at the previous frame

    // oscillate the radius over time
    float radius = 30 * abs( sin(frameCount) );

    float first_tempX  = cursorX + radius * cos( angle);
    float first_tempY  = cursorY + radius * sin( angle);
    float second_tempX = cursorX + radius * cos(-angle);
    float second_tempY = cursorY + radius * sin(-angle);

    // draw some lines and circles using transparency
    stroke(110, 100);
    line(cursorX, cursorY, first_tempX, first_tempY);
    line(cursorX, cursorY, second_tempX, second_tempY);

    float temp_w = random(3);
    ellipse(first_tempX, first_tempY, temp_w, temp_w);
    ellipse(second_tempX, second_tempY, temp_w, temp_w);
  }

  pcursorX = cursorX;
  pcursorY = cursorY;
  r = r + dr;


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}

