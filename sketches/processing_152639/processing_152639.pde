
/*
 * Creative Coding
 * Week 1, 03 - Draw your name! (part 3)
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase all your drawing and start with a blank screen
 * 
 */

// variables to store the delay and target counts
int delayCount;
int targetCount;

float angle;
float inc;

PFont f;

// setup function
void setup() {
  size(800, 600);
  background(#070c12);
  
  f = createFont("Courier",16,true); // Courier, 16 point, anti-aliasing on
  textFont(f,14);
  fill(255);
  text("Click and drag the mouse to draw", 10, 580);
 
   rectMode(CENTER);  // rectangles drawn from the centre

  // initialise angle and inc to 0
  angle = 0;
  inc = 0;

  delayCount = 0;
  targetCount = (int) random(5, 50); // set target count to a random integer between 5 and 50
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/
   
    inc = map(mouseX, 0, width, 0.01, 0.08);

  // incremment the current angle
  angle = angle + inc;

  int style; 

  delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = (int) random(4);
    targetCount = (int) random(5, 20) ;
    delayCount = 0;
  }
  else {
    style = 0;
  }

// #070c12  #3e7a96 #1c384e #aabbcd #375684         gold #f0e7a6

       // oscillate the radius over time
    float radius = 80 * abs( sin(frameCount) );

    float first_tempX  = mouseX + radius * cos( angle);
    float first_tempY  = mouseY + radius * sin( angle);
    float second_tempX = mouseX + radius * cos(-angle);
    float second_tempY = mouseY + radius * sin(-angle);

  if (mousePressed) {

    stroke(#f0e7a6); 
   // strokeWeight(2);
    fill(150,200);

    // switch statement
    switch(style) {
    case 0:
      // draw a point
      stroke(#1c384e,180);
      point(mouseX, mouseY);
      
          // draw some lines and circles using transparency
    line(mouseX, mouseY, first_tempX, first_tempY);
    line(mouseX, mouseY, second_tempX, second_tempY);
    
     float tsize2 = random(2, 3);
      fill(#f0e7a6, 200);
      noStroke();
      triangle(first_tempX-tsize2, first_tempY+tsize2, first_tempX, first_tempY-tsize2, first_tempX+tsize2, first_tempY+tsize2);       
      triangle(second_tempX-tsize2, second_tempY+tsize2, second_tempX, second_tempY-tsize2, second_tempX+tsize2, second_tempY+tsize2);       

    
      break;

    case 1:
      // draw a circle with random radius
      float esize = random(5, 10);
      fill(#3e7a96,150);
      noStroke();
      ellipse(mouseX, mouseY, esize, esize);
      ellipse(mouseX, mouseY, esize+10, esize+10);
      
    

      break;

    case 2:
      // draw a random sized rectangle
      
      float qsize = random(5, 15);
      fill(#1c384e, 100);
      noStroke();
      quad(mouseX-qsize, mouseY, mouseX, mouseY-qsize, mouseX+qsize, mouseY, mouseX, mouseY+qsize   );
      quad(mouseX-qsize-10, mouseY, mouseX, mouseY-qsize-10, mouseX+qsize+10, mouseY, mouseX, mouseY+qsize+10   );

      break;

    case 3:
      // draw a triangle with random size
      float tsize = random(5, 10);
      fill(#375684, 200);
      noStroke();
      triangle(mouseX-tsize, mouseY+tsize, mouseX, mouseY-tsize, mouseX+tsize, mouseY+tsize); 
      triangle(mouseX-tsize+10, mouseY+tsize+10, mouseX, mouseY-tsize+10, mouseX+tsize+10, mouseY+tsize+10); 
      break;
    } // end of switch statement
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(#070c12);
    
      f = createFont("Courier",16,true); // Courier, 16 point, anti-aliasing on
  textFont(f,14);
  fill(255);
  text("Click and drag the mouse to draw", 10, 580);


  }
}
