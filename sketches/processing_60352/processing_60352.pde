
/**
 * Remake of 
 * http://demonstrations.wolfram.com/ExploringALogoByGrignani/
 * mathematical analysis of logos
 * by Rob Antonishen
 * http://ffaat.pointclark.net
 */

import controlP5.*;

public ControlP5 controlP5;
public float IR = 0;
public int Rings = 30;
public float Offset = 0.2;
public float Ratio = 0.4;
public float Twists = -3;
public float SA = HALF_PI;


int cx,cy;
float a,h;

void setup() {
  size(400,620);
  smooth();
 
  cx = width/2;
  cy = width/2;
  
  controlP5 = new ControlP5(this);
  
  controlP5.setColorBackground(0xffc93f03); 
  controlP5.setColorForeground(0xfffc5107);
  controlP5.setColorActive(0xffff6600);
  controlP5.setColorLabel(0xffefefef);
  controlP5.setColorValue(0xffefefef);

  // add horizontal sliders
  controlP5.addSlider("IR",0,1,IR,20,width+20,width-90,10).setLabel("Inner Radius");
  controlP5.addSlider("Rings",1,60,Rings,20,width+20+20,width-90,10);
  controlP5.addSlider("Offset",0,2,Offset,20,width+20+40,width-90,10);
  controlP5.addSlider("Ratio",-2,2,Ratio,20,width+20+60,width-90,10).setLabel("B/W Ratio");
  controlP5.addSlider("Twists",-10,10,Twists,20,width+20+80,width-90,10);
  controlP5.addSlider("SA",-PI,PI,SA,20,width+20+100,width-90,10).setLabel("Start Angle");
  controlP5.addTextfield("Center_X",20,width+20+120,width/2-30,20).setLabel("Center X");
  controlP5.addTextfield("Center_Y",width/2,width+20+120,width/2-20,20).setLabel("Center X");  
  controlP5.addButton("Randomize",0,20,width+20+160,width/2-30,20);
  controlP5.addButton("Reset",0,width/2,width+20+160,width/2-20,20);
}

void draw() {
  background(#FFFFFF);
  
  if(mousePressed && mouseY<width) {
    cx = mouseX;
    cy = mouseY;
  }
   
  // clamp the result
  h = min(sqrt(sq(cx-width/2)+sq(cy-width/2)), width*0.95*(1-IR)/2);
  a = atan2(cy-width/2, cx-width/2);
  cx = width/2 + int(cos(a)*h);
  cy = width/2 + int(sin(a)*h);
  
  ((Textfield)controlP5.controller("Center_X")).setText(""+cx+" ");
  ((Textfield)controlP5.controller("Center_Y")).setText(""+cy+" ");
  
  for (int i=Rings; i>0; i=i-1) {
    // large circle
    fill(#000000);
    ellipse(width/2+(cx-width/2)*(Rings-i)/Rings,
            width/2+(cy-width/2)*(Rings-i)/Rings,
            (1-IR)*width*0.95*i/Rings+IR*width*0.95,
            (1-IR)*width*0.95*i/Rings+IR*width*0.95);
    
    fill(#ffffff);
    ellipse(width/2+(cx-width/2)*(Rings-i)/Rings + Offset*cos(SA-Twists*PI*i/Rings)*width*0.95/Rings,
            width/2+(cy-width/2)*(Rings-i)/Rings + Offset*sin(SA-Twists*PI*i/Rings)*width*0.95/Rings,
            (1-IR)*width*0.95*i/Rings+IR*width*0.95-width*0.95*Ratio/Rings,
            (1-IR)*width*0.95*i/Rings+IR*width*0.95-width*0.95*Ratio/Rings);
  }
  
  //The input panel
  fill(#666666);
  rect(0,width+10,width,height-width-10);
}

// function Reset will receive changes from controller with name Reset
public void Reset(int theValue) {
  IR = 0;
  Rings = 30;
  Offset = 0.2;
  Ratio = 0.4;
  Twists = -3;
  SA = HALF_PI;
  controlP5.controller("IR").setValue(IR);
  controlP5.controller("Rings").setValue(Rings);
  controlP5.controller("Offset").setValue(Offset);
  controlP5.controller("Ratio").setValue(Ratio);
  controlP5.controller("Twists").setValue(Twists);
  controlP5.controller("SA").setValue(SA);
  cx = width/2;
  cy = width/2;
}

// function Reset will receive changes from controller with name Reset
public void Randomize(int theValue) {
  IR = random(1);
  Rings = (int)random(1,60);
  Offset = random(2);
  Ratio = random(-2,2);
  Twists = random(-10,10);
  SA = random(-PI, PI);
  controlP5.controller("IR").setValue(IR);
  controlP5.controller("Rings").setValue(Rings);
  controlP5.controller("Offset").setValue(Offset);
  controlP5.controller("Ratio").setValue(Ratio);
  controlP5.controller("Twists").setValue(Twists);
  controlP5.controller("SA").setValue(SA);
  h = random(width*0.95*(1-IR)/2);
  a = random(TWO_PI);
  cx = width/2 + int(cos(a)*h);
  cy = width/2 + int(sin(a)*h);
}

