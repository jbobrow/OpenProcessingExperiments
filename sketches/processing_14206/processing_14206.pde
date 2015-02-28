
/* By Dharman Gersch
 Draw continuously with line by holding the mouse button on.
 release the button to erase by drawing with the background colour
 
 * s         : save png
 * p         : save pdf (only works once -creates corrupt pdf if not pressed)
 * 1-4       : mirror modes
 */

import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(800, 600);
  smooth();
  background(200);
}

void draw() 
{

  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);  
  strokeWeight(weight);
  //draw normal  drawing 
  if (key == '1' || key == '1') {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  //draw mirrored drawing 

  if (key == '2' || key == '2') {
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(width-mouseX, mouseY, width-pmouseX, pmouseY);
  }
  //draw mirrored drawing in 3 quadrants
  if (key == '3' || key == '3') {
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(width-mouseX, mouseY, width-pmouseX, pmouseY);
    line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
  }
  //draw mirrored drawing in 4 quadrants
  if (key == '4' || key == '4') {
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseX, height-mouseY, pmouseX, height-pmouseY);
    line(width-mouseX, mouseY, width-pmouseX, pmouseY);
    line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
  }

  if (mousePressed == true)
  {
    stroke(0);
    cursor(CROSS);
  }
  else
    stroke(200, 100);
  if (mousePressed == false)
  {
    cursor(ARROW);
  }

  }

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+".png");
  if (key == 'p' || key == 'P') savePDF = true;
}
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


