
import processing.pdf.*;
PShape import_form;
public void setup() {
  smooth();
  size(600, 600);
  frameRate(25);
  background(255);
  import_form = loadShape("form.svg");

}
 
public void draw() {
  
 
  if (mousePressed)
  {
    translate(mouseX, mouseY);
 
 
 
    shape(import_form, -100, -100);
    stroke(1);
    noFill();
  }
}
 
public void keyPressed() {
  println ("Recording..." + key);
  if (key == 's') beginRecord(PDF, "circles.pdf");
 
  println ("Sequence stopped." + key);
  if (key == 'e') endRecord();
}


