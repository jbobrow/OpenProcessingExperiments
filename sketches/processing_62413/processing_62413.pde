
import controlP5.*;
ControlP5 cp5;
import processing.pdf.*;

int sliderValue = 100;
Slider abc;

float angle=0;
int   boxes = 16, SIDE = 200, side;
 
void setup() {
  size(600,600);
  stroke(255);
  fill(0, 0, 50, 10);
  smooth();
  cp5 = new ControlP5(this);
     cp5.addSlider("sliderValue")
     .setPosition(0,0)
     .setRange(0,255)
     ;
}
 
void draw() {
  pushMatrix();
  background(255);
 
  side = SIDE;
  angle = map(sliderValue, 0, width, 0.0f, 0.5 * PI);
   translate(width/2, height/2);


 
  for(int i=0; i<boxes; i++) {
    rotate(angle);
    rect(-side, -side, side*2, side*2);
    side = (int) ( (side * tan(angle))/(sin(angle) * (tan(angle) + 1)) );
  }
 
  popMatrix();
}

public void keyPressed() {
  println ("Recording..." + key);
  if (key == 's') beginRecord(PDF, "circles.pdf");
 
  println ("Sequence stopped." + key);
  if (key == 'e') endRecord();
}


