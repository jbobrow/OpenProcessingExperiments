
// Based on Processing Handbook EX 32-04

import controlP5.*;    // import controlP5 library
ControlP5 controlP5;   // controlP5 object

boolean form = false;

float fillcolour = 0;
float strokecolour = 34;

float angle = 0.0; // Changing angle
float speed = 0.05; // Speed of growth

void setup() {
  size(1280, 700);
  noStroke();
  smooth();
  colorMode(HSB, 360, 100, 100, 255);
  background(0);
  
  // controlP5 Sliders
    controlP5 = new ControlP5(this);
  // parameters  : name, minimum, maximum, default value (float), x, y, width, height
    controlP5.addSlider("strokecolour",0,360,34,20,40, width/5*3,10);
    controlP5.addSlider("fillcolour",0,360,0,20,20,width/5*3,10);
//    controlP5.addSlider("scale",0.5, 2,0,20,20,width/5*3,10);
  // parameters  : name, x, y, width, height
    controlP5.addToggle("form",false,int(width/5*3.35),20,20,20);


}

void draw() {
  
  fill(fillcolour, 80, 40, 180);
  stroke(strokecolour,100,90,180);
    
      if (mousePressed) {
          
          if (mouseY >= 60) {
            pushMatrix();
            translate(mouseX, mouseY);
            circlePhase(0.0);
            circlePhase(QUARTER_PI);
            circlePhase(HALF_PI);
            angle += speed;
            popMatrix();
          }
     }
              
       if (keyPressed) {
         if (key == 's' || key == 'S') {
           saveFrame("motioncircles-#####.tif");
         }
       }
  
  noStroke();
  fill(0,0, 50);
  rect(0, 0, width, 60);
       
}
void circlePhase(float phase) {
  float scalar = sin(angle) + 2;
  scale(scalar);
//  strokeWeight(1.0 * scalar);
  strokeWeight(1.0 / scalar);
  rotate(angle);
  angle += 0.01;
  float diameter = 65 + (sin(angle + phase) * 45);
  if (form == false){
      ellipse(50, 50, diameter, diameter);
      ellipse(-30, -30, diameter/3*2, diameter/3*2);
      ellipse(20, 20, diameter/2, diameter/2);
      ellipse(10, -10, diameter/3, diameter/3);
      }
  if (form == true) {
      rect(50, 50, diameter, diameter);
      rect(-30, -30, diameter/3*2, diameter/3*2);
      rect(20, 20, diameter/2, diameter/2);
      rect(10, -10, diameter/3, diameter/3);
      }
}

