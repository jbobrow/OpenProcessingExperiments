
/*Coded by Davide Riboli in aug 2012*/
/*to learn the ControlP5 lib use*/

/*Import the control lib*/
/*http://www.sojamo.de/libraries/controlP5/*/

import controlP5.*;
ControlP5 controlP5;

/*Right Rect Starting Dimensions*/
public int MyrectWidth = 20;
public int MyrectHeight = 20;

/*Right Rect Starting Color*/
public int MyrectR = 20;
public int MyrectG = 20;
public int MyrectB = 20;

void setup() {
  size(500,200);
  
  /* new instance of ControlP5 */
  controlP5 = new ControlP5(this);
  
  /* add 5 controllers and give each of them a unique id. */
  controlP5.addSlider("Rect Width [10/220]",10,220,MyrectWidth,10,10,100,10).setId(1);
  controlP5.addSlider("Rect Height [10/180]",10,180,MyrectHeight,10,30,100,10).setId(2);
  controlP5.addSlider("Rect R [0/255]",0,255,MyrectR,10,50,100,10).setId(3);
  controlP5.addSlider("Rect G [0/255]",0,255,MyrectG,10,70,100,10).setId(4);
  controlP5.addSlider("Rect B [0/255]",0,255,MyrectB,10,90,100,10).setId(5);
}

void draw() {
  background(100);
  fill(MyrectR,MyrectG,MyrectB);
  rect(260,10,MyrectWidth,MyrectHeight);
}

void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to 
     the controlEvent method; by checking the id of a controller one can distinguish
     which of the controllers has been changed.*/
     
  switch(theEvent.controller().id()) {
    case(1):
    /* controller numberbox1 with id 1 */
    MyrectWidth = (int)(theEvent.controller().value());
    break;
    case(2):
    /* controller slider1 with id 2 */
    MyrectHeight = (int)(theEvent.controller().value());
    break; 
   case(3):
    /* controller slider1 with id 3 */
    MyrectR = (int)(theEvent.controller().value());
    break;  
   case(4):
    /* controller slider1 with id 4 */
    MyrectG = (int)(theEvent.controller().value());
    break;  
   case(5):
    /* controller slider1 with id 5 */
    MyrectB = (int)(theEvent.controller().value());
    break;   
  }
}

