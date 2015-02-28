
import processing.pdf.*;

float hi;
void setup() {
  size(700, 700);
  fill(0, 255, 255);
  hi= 1;
  beginRecord(PDF, "everything.pdf");
}

void draw() {
  // Be sure not to call background, otherwise your file
  // will just accumulate lots of mess, only to become invisible

  // Draw something good here
  line(mouseX, mouseY, width/2, height/2); 
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(pmouseX, pmouseY, 10, 10);
  translate(width/2, height/2);
  rotate(radians(frameCount%360));
  scale(hi);
  hi = hi *0.95;
  if (hi<.01) hi=2;
  fill(0, frameCount%255, frameCount%150);

}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}


