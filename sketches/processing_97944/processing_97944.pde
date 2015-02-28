
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/97917*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import codeanticode.glgraphics.*;

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65030*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import codeanticode.glgraphics.*;

//import processing.opengl.*;
//import javax.media.opengl.*;
import saito.objloader.*;
PeasyCam cam;
PeasyDragHandler PanDragHandler;
PeasyWheelHandler ZoomWheelHandler;

// declare that we need a OBJModel and we'll be calling it "model"
OBJModel model;

float rotX;
float rotY;
PImage tex;
// these booleans will be used to turn on and off bits of the OBJModel
boolean bTexture = true;
boolean bStroke = false;
boolean bMaterial = false;

void setup()
{
    size(950, 950, P3D);
  
    // making an object called "model" that is a new instance of OBJModel
    model = new OBJModel(this,"fesh4.obj", "relative", POLYGON);
   
    // turning on the debug output (it's all the stuff that spews out in the black box down the bottom)
    model.enableDebug();
    model.translateToCenter();
    model.scale(3);
    model.printModelInfo();
    noStroke();
 cam = new PeasyCam(this, 100);
 cam.setDistance (900);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(1100);

PanDragHandler = cam.getPanDragHandler();

ZoomWheelHandler = cam.getZoomWheelHandler();

//then you can just map this to the left mouse handler

cam.setLeftDragHandler(PanDragHandler);
cam.setWheelHandler (ZoomWheelHandler);

}

void draw()
{
    background(0);
    lights();

    //this will do nothing until the model material is turned off
  //  fill(255,0,255);

    pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(rotY);
    rotateY(rotX);
    model.draw();
    popMatrix();
    
    //ZoomWheelHandler.handleDrag(10,10);
//cam.SetDistance(19);

}




