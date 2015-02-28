
//-------------------------------- EXTERNAL LIBRARIES
import controlP5.*;

//-------------------------------- LIBRARY INSTANTIATIONS
ControlP5 mySliders;

//-------------------------------- SLIDERS WILL CONTROL THESE ***PUBLIC*** VARIABLES
float myPosX = 100.0;
float myPosY = 300.0;
float knobR, knobG, knobB ;
float col;
float dim = 25;
float bkCol;

//font of text





/*-----------------------------------------------------------------------------
 *** GLOBAL INIT ***
 -----------------------------------------------------------------------------*/
void setup() {

  //-------------------------------- GENERAL
  smooth ();
    size(500, 500);
  background(100);
  
 

  //-------------------------------- CONTROLP5
  mySliders = new ControlP5(this);

  // controlP5.addSlider("strName", valMin, valMax, valDefault, posX, posY, sizeW, sizeY);
  mySliders.addSlider("myPosX", 0, width, myPosX, 50, 50, 200, 10);  
  mySliders.addSlider("myPosY", 0, height, myPosY, 50, 75, 200, 10);  
  mySliders.addSlider("col", 0, height, 50, 50, 100, 200, 10);  
  mySliders.addSlider ("dim", 15, 150, dim, 50, 125, 200, 10);
  

//RGB dials
// parameters  : name, minimum, maximum, default value (float, x, y, diameter
mySliders.addKnob("knobR",0,360,0,50,height-100,50);
mySliders.addKnob("knobG",0,360,0,150,height-100,50);
mySliders.addKnob("knobB",0,360,0,250,height-100,50);

}


/*-----------------------------------------------------------------------------
 *** MAIN PROGRAM LOOP ***
 -----------------------------------------------------------------------------*/
void draw() {

  //-------------------------------- GENERAL
 
 
  background(bkCol);
  
  stroke(col);
  fill(knobR, knobG, knobB);
  ellipse( myPosX, myPosY, dim, dim );
}




