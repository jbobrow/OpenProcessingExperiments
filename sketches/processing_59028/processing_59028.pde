


import processing.pdf.*;
PShape s;
int x;
int y;
void setup() {
  size(1000, 600);
  background(256, 256, 256);
  frameRate(40);
  s = loadShape("arrow.svg");
  smooth();
}

void draw() {



  y++;
  x++; 

  scale(0.5);

  if (mousePressed)
  {

      pushMatrix();
    translate(mouseX*2, mouseY*2); 
    rotate(radians(frameCount));



    shape(s, 0, 0);
    stroke(1);
    noFill();
    popMatrix();
  }
}


void keyPressed() {
  println ("Recording " + key);
  if (key == 's') beginRecord(PDF, "Lines.pdf");

  println ("Stop " + key);
  if (key == 'e') endRecord();
}


