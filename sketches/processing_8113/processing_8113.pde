
/**
 * ControlP5 Example 2 : Style UI elements and setValue
 * 
 * This example shows how to change the font and color of the controlP5 UI elements.
 * Besides that is shows you how to change the values of the user interface elements.  
 *
 * example by Kasper Kamperman (kasperkamperman.com), 2010
 * tested with library version 0.4.6
 * ControlP5 by Andreas Schlegel 
 * http://www.sojamo.de/libraries/controlP5/
 *
 */

import controlP5.*;
ControlP5 controlP5;

void setup() {
  size(300,260);
  smooth();
  
  controlP5 = new ControlP5(this);
  
  // change the default font to Verdana
  PFont p = createFont("Verdana",9); 
  controlP5.setControlFont(p);
  
  // change the original colors
  controlP5.setColorForeground(0xffaa0000);
  controlP5.setColorBackground(0xff660000);
  controlP5.setColorLabel(0xffdddddd);
  controlP5.setColorValue(0xffff88ff);
  controlP5.setColorActive(0xffff0000);
  
  // add the elments ( see example 1 for the parameters )
  controlP5.addBang("bang1",10,10,20,20);    
  controlP5.addButton("button1",1,70,10,60,20);  
  controlP5.addToggle("toggle1",false,170,10,20,20);    
  controlP5.addSlider("slider1",0,255,128,10,80,10,100);
  
  Slider s = controlP5.addSlider("slider2",0,255,128,70,80,100,10);
  // change sliderMode of the Slider object. The default is Slider.FIX
  s.setSliderMode(Slider.FLEXIBLE); 
    
  controlP5.addKnob("knob1",0,360,0,70,120,50);
  
  Numberbox n = controlP5.addNumberbox("numberbox1",50,170,120,60,14);
  // change Multiplier of the Numberbox ( default is 1 )
  n.setMultiplier(30);
}
  
void draw() { 
  background(0);  // background black
}

void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController()) { 
    
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());
    
    // clicking on bang1 sets toggle1 value to 1 (true)      
    if(theEvent.controller().name()=="bang1") {
     controlP5.controller("toggle1").setValue(1);     
    }
    
    // clicking on button1 sets toggle1 value to 0 (false)
    if(theEvent.controller().name()=="button1") {
     controlP5.controller("toggle1").setValue(0);     
    }
    
    // dragging slider1 changes the value of slider2
    if(theEvent.controller().name()=="slider1") {
     controlP5.controller("slider2").setValue(theEvent.controller().value());
    }
    
    // changing the value of numberbox1 turns knob1
    if(theEvent.controller().name()=="numberbox1") {
     controlP5.controller("knob1").setValue(theEvent.controller().value());
    }
    
  }  
}

