
/*
 * Creative Coding
 * Week 1, 01 - Draw your name!
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image to the file "yourName.jpg"
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */
//variable that define the definition of the radiuses
int mode=0;
//wether you can change the mode (this is used when you hit "m")
boolean modeChangeable;
//width and height of the drawn rectangle
float radius1, radius2;

// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(255);

  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(RADIUS);

}


// draw function -- called continuously while the program is running
void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  if (mousePressed) {
    
    stroke(170); // set the stroke colour to a light grey
    fill(0, 150); // set the fill colour to black with transparency
    //different formulas are used, depending on mode value
    switch (mode) {
    case 0:
      radius1=random(2, 10);
      radius2=random(2, 10);
      break;
    case 1:
      radius1=10*sin((float)frameCount/10);
      radius2=10*cos((float)frameCount/10);
      break;
    case 2:
      radius1=int((float)30/(1+dist(mouseX, mouseY, pmouseX, pmouseY)));
      radius2=1+int(dist(mouseX, mouseY, pmouseX, pmouseY));
      break;
    case 3:
      radius1=10*sin((float)frameCount/10);
      radius2=10*cos((float)frameCount/10);
      break;
    case 4:
      radius1=int(1+abs(mouseY-pmouseY));
      radius2=int(1+abs(mouseX-pmouseX));
      break;
    }
    //finally  we draw our rectangle
    rect(mouseX, mouseY, radius1, radius2);
    //when we draw, mode is made changeable
    modeChangeable=true;
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    setup();
  }

  // cycles through values from 0 to 4 when you press keyboard 'm'
  if (keyPressed == true && key == 'm'&& modeChangeable) {
    mode=++mode%5;//values of mode will be 0 then 1, then 2, 3, 4 then the 5%5 which is 0, then 1 ....
    println(mode);
    modeChangeable=false;// we have to do that: if not, mode value will change many times while we ress 'm'
  }
}
void mouseClicked() { println("mouse clicked"); }
