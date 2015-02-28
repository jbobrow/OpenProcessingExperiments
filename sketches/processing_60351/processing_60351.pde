
/**
 * Remake of 
 * http://blog.wolfram.com/2009/02/26/exploring-logo-designs-with-mathematica/
 * mathematical analysis of logos
 * by Rob Antonishen
 * http://ffaat.pointclark.net
 */

import controlP5.*;

public ControlP5 controlP5;
public float Diameter;
public int Points = 3;
public float Orientation = 0;
public float Ratio = 0.14;
public float Twist = 0.0;

void setup() {
  size(400,580);
  smooth();
  Diameter = 0.94;
 
  controlP5 = new ControlP5(this);

  controlP5.setColorBackground(0xffc93f03); 
  controlP5.setColorForeground(0xfffc5107);
  controlP5.setColorActive(0xffff6600);
  controlP5.setColorLabel(0xffefefef);
  controlP5.setColorValue(0xffefefef);
  
  // add horizontal sliders
  controlP5.addSlider("Diameter",0,1,Diameter,20,width+20,width-80,10);
  controlP5.addSlider("Points",2,30,Points,20,width+20+20,width-80,10);
  controlP5.addSlider("Orientation",0,TWO_PI,0,20,width+20+40,width-80,10);
  controlP5.addSlider("Ratio",-1,1,Ratio,20,width+20+60,width-80,10);
  controlP5.addSlider("Twist",-PI,PI,Twist,20,width+20+80,width-80,10);
  controlP5.addButton("Randomize",0,20,width+20+100,width-40,20);
  controlP5.addButton("Reset",0,20,width+20+130,width-40,20);
}

void draw() {
  background(#ffffff);

  //The input panel
  fill(#666666);
  rect(0,width+10,width,height-width-10);

  // large black circle
  fill(#000000);
  ellipse(width/2,width/2,width*0.95,width*0.95);

  // white circle
  fill(#ffffff);
  ellipse(width/2,width/2,width*0.95*Diameter,width*0.95*Diameter);
  
  //ngon
  fill(#000000);
  float f = 0.0;
  beginShape();
  while (f < TWO_PI) {
    vertex(width/2 + cos(f-HALF_PI+Orientation/Points)*Diameter*width*0.95/2, 
           width/2 + sin(f-HALF_PI+Orientation/Points)*Diameter*width*0.95/2);
    vertex(width/2 + cos(Twist+f+TWO_PI/Points/2-HALF_PI+Orientation/Points)*Diameter*width*0.95/2*Ratio, 
           width/2 + sin(Twist+f+TWO_PI/Points/2-HALF_PI+Orientation/Points)*Diameter*width*0.95/2*Ratio);
    f += TWO_PI/Points;
  }
  endShape();
}

// function Reset will receive changes from controller with name Reset
public void Reset(int theValue) {
  Diameter = 0.94;
  Points = 3;
  Orientation = 0;
  Ratio = 0.14;
  Twist = 0.0;
  controlP5.controller("Diameter").setValue(Diameter);
  controlP5.controller("Points").setValue(Points);
  controlP5.controller("Orientation").setValue(Orientation);
  controlP5.controller("Ratio").setValue(Ratio);
  controlP5.controller("Twist").setValue(Twist);
}

// function Reset will receive changes from controller with name Reset
public void Randomize(int theValue) {
  Diameter = random(1);
  Points = (int)random(2,20);
  Orientation = random(0,TWO_PI);
  Ratio = random(-1,1);
  Twist = random(-PI,PI);
  controlP5.controller("Diameter").setValue(Diameter);
  controlP5.controller("Points").setValue(Points);
  controlP5.controller("Orientation").setValue(Orientation);
  controlP5.controller("Ratio").setValue(Ratio);
  controlP5.controller("Twist").setValue(Twist);
}

