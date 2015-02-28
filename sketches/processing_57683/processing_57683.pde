
import processing.opengl.*;

void setup() {
  size(450, 450);
  rectMode(CENTER);
  noStroke();
  smooth();
  fill(#1A3E94,180);
}

int circ_size=15;
boolean keep_drawing=false;


void keyPressed() {
  if (key == '+')
    circ_size++;
  
  if (key == '-')
    circ_size--;  
}

void mousePressed() {
  if (mouseButton == RIGHT)
    keep_drawing=!keep_drawing;
    
}

void draw() {
  
  if (!mousePressed && !keep_drawing)
    background(255);
    
  ellipse(width-mouseX, mouseY, circ_size, circ_size);
  ellipse(mouseX, height-mouseY, circ_size, circ_size);
  
  ellipse(width-mouseX, height-mouseY, circ_size, circ_size);
  ellipse(mouseX, mouseY, circ_size, circ_size);
}
