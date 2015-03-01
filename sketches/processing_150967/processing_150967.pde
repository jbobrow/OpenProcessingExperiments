
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

void setup() {
  size(1000, 1000);
  background(0);

  rectMode(CENTER);  // rectangles drawn from the centre

  // initialise angle and inc to 0
  angle = 0;
  inc = 0;
}


void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  // map the mouse x position to the range (0.01, 0.08)
  inc = map(mouseX, 0, width, 0.5, 0.5);

  // incremment the current angle
  angle = angle + inc;

  if (mousePressed) {

    stroke(0); 
   fill(int(random(255)), int(random(255)), int(random(255)));

    ellipse(mouseX, mouseY, 4, 4);

    line(mouseX, mouseY, pmouseX, pmouseY); // pmouse is the mouse position at the previous frame

    // oscillate the radius over time
    float radius = 80 * abs( sin(frameCount) );

    float first_tempX  = mouseX + radius * cos( angle);
    float first_tempY  = mouseY + radius * sin( angle);
    float second_tempX = mouseX + radius * cos(-angle);
    float second_tempY = mouseY + radius * sin(-angle);

    // draw some lines and circles using transparency
    stroke(110, 100);
    line(mouseX, mouseY, first_tempX, first_tempY);
    line(mouseX, mouseY, second_tempX, second_tempY);

    float temp_w = random(3);
    ellipse(first_tempX, first_tempY, temp_w, temp_w);
    ellipse(second_tempX, second_tempY, temp_w, temp_w);
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}



