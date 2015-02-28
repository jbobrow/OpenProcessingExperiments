
import processing.pdf.*;
PShape s;
int x;
int y;
public void setup() {
  size(1000, 600);
  background(41,54,59);
  frameRate(40);
  s = loadShape("circle.svg");
  smooth();
}
 
public void draw() {
  
 
  if (mousePressed)
  {
    translate(mouseX, mouseY);
 
 
 
    shape(s, -30, -30);
    stroke(1);
    noFill();
  }
}
 
public void keyPressed() {
  println ("Recording " + key);
  if (key == 's') beginRecord(PDF, "circles.pdf");
 
  println ("Stop " + key);
  if (key == 'e') endRecord();
}

public void keyReleased(){
 if (key == '1') s = loadShape("circle.svg");
 if (key == '2') s = loadShape("circle2.svg");
 if (key == '3') s = loadShape("circle3.svg");
}



