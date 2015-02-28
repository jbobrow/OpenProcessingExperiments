
/* This sketch is made by tinkering around (modifying) with 
 the pattern example code developed by reas and benfry.
 Modified by sunil vallu, New Media Design, 
 National institute of design, India.*/


import processing.pdf.*;
int counter;

void setup()
{
  size(700, 400);
  background(255);
  smooth();
}


void draw() 
{
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);

}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);

  colorMode(HSB);
  noFill(); 
  stroke(counter,150,255);
  strokeWeight(speed);
  ellipse(x,y,speed,speed);
  if(counter<=255){
    counter++;
  }
  else{
    counter = 0;
  }
}

void keyPressed() {
  if (key == 'S' || key == 's') { // When 'B' or 'b' is pressed,
    background(255); // Set a white background
    beginRecord(PDF, "work1.pdf"); // start recording to the PDF

  } 
  else if (key == 'E' || key == 'e') { // When 'E' or 'e' is pressed,
    endRecord(); // stop recording the PDF and
    exit(); // quit the program
  }
}




