
/**
 * drawing with a changing shape by draging the mouse.
 *   
 * MOUSE
 * position x          : length
 * position y          : thickness and number of lines
 * drag                : draw
 * 
 * KEYS
 * del, backspace      : erase
 
 */

import processing.pdf.*;
boolean recordPDF = false;

void setup(){
  size(720, 720);
  smooth();
  noFill();
  background(255);
}

void draw(){
  if(mousePressed){
    pushMatrix();
    translate(width/2,height/2);

    int circleResolution = (int)map(mouseY+100,0,height,2, 10);
    float radius = mouseX-width/2 + 0.5;
    float angle = TWO_PI/circleResolution;

    strokeWeight(2);
    stroke(0, 25);

    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    
    popMatrix();
  }
}
