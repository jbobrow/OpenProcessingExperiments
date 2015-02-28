
/************header notes************/
 /**
 * controlP5numberbox by andreas schlegel 

 * an example to show how to use a numberbox to control 

 * variables and events.
To get controlP5 to run on openprocessing you have to install the library from http://www.sojamo.de/libraries/controlP5/
 */ 


/**********import****************/
import controlP5.*;
/**********variables****************/
ControlP5 controlP5;

int myColorBackground = color(0,0,0);

public float numberboxValue = 100;
/**************initialization***************/
void setup() {
  size(400,400);
  frameRate(25);
  controlP5 = new ControlP5(this);
  // add a numberbox
  controlP5.addNumberbox("numberbox",100,100,160,100,14);//can't be clever with the text in parentheses!
  //this one is controlled up and down
  // add a second numberbox
  Numberbox n = controlP5.addNumberbox("numberboxValue",128,100,200,100,14);// the name is important!
  // set the sensitivity of the numberbox
  n.setMultiplier(0.1);
  // change the control direction to left/right
  n.setDirection(Controller.HORIZONTAL);
}
/****************functions****************/
void draw() {
  background(numberboxValue,numberboxValue,numberboxValue);
  fill(0);//numberboxValue,numberboxValue,numberboxValue);//this didn't change anything apparently
  rect(0,0,width,100);
  ellipse (width*.1,height*.2,numberboxValue,numberboxValue);//half circle
    rect (width*.1,height*.9,numberboxValue/2,numberboxValue*3);//rect
}
/****************functions****************/
void numberbox(int theColor) {
  myColorBackground = color(theColor);
  println("a numberbox event. setting background to "+theColor);
}

