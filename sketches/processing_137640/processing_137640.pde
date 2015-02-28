
// I got this code and found it is suitable to form my art work.
//Below is the reference where I referred to finish my source code
// P_2_3_1_01.pde
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni

/**
 * draw tool. draw with a rotating line. 
 * MOUSE drag    : draw
 * del, backspace      : clear screen
 * d                   : reverse direction and mirrow angle 
 * s                   : save png
 */

import processing.pdf.*;
import java.util.Calendar;
color[] palette = {#E097FF, #CC7EED, #E2A0FF, #FF92EA, #ED7AD7, #FF9CEC, #D3ED7A, #E7FF92};
boolean recordPDF = false;

color col = color(181,157,0,100);
float lineLength = 0;
float angle = 0;
float angleSpeed = 5;

void setup() {
  // use full screen size 
  size(800, 600);
  background(255);
  smooth();
  cursor(CROSS);
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    strokeWeight(0.5); 
    noFill();
    float r= random(0,7);
    stroke(palette[int (r)]);
    translate(mouseX,mouseY);
    rotate(radians(angle));
    line(0, 0, lineLength, 0);
    popMatrix();
    
    angle += angleSpeed;
  }
}

void mousePressed() {
  lineLength = 100;
}
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(255);
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");

  if (key=='d' || key=='D') {
    angle = angle + 180;
    angleSpeed = angleSpeed * -1;
  }

}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
























