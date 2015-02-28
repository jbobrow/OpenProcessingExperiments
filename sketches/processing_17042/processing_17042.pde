
/**
 * ControlP5 Slider. Horizontal and vertical sliders, 
 * with and without tick marks and snap-to-tick.
 * by andreas schlegel, 2010
 */

// 1st degree polynomial
// y = 3x

import controlP5.*;

ControlP5 controlP5;


public int Handle_AX = 88;
public int Handle_AY = 288;
public int Handle_BX = 280;
public int Handle_BY = 100;
public int Detail = 40;

void setup() {
  smooth();
  size(400,400);
  controlP5 = new ControlP5(this);
  // add horizontal sliders
  controlP5.addSlider("Handle_AX",0,width,88,70,330,100,20);
  controlP5.addSlider("Handle_AY",0,height,288,70,360,100,20);
  controlP5.addSlider("Handle_BX",0,width,280,240,330,100,20);
  controlP5.addSlider("Handle_BY",0,height,100,240,360,100,20);
  controlP5.addSlider("Detail"   ,0,200,40,20,280,20,100);
}

public void draw() {
  background(128);
  fill(0);
  strokeWeight(2);
  stroke(255);
  ellipseMode(CENTER);
  ellipse(Handle_AX,Handle_AY,10,10);
  ellipse(Handle_BX,Handle_BY,10,10);
  bezierCurves(20,200,Handle_AX,Handle_AY,Handle_BX,Handle_BY,380,200,Detail);
}

public void bezierCurves(int x0,int y0,int x1,int y1,int x2,int y2,int x3,int y3,int numPoints){
  for (int i=0; i<numPoints; i++){
    // Normalizes numPoint between 0.0 an 1.0
    float t = i/float(numPoints);

    int  cx = 3*(x1 - x0);
    int  bx = 3*(x2 - x1) - cx;
    int  ax = x3 - x0 - cx - bx;

    int  cy = 3*(y1 - y0);
    int  by = 3*(y2 - y1) - cy;
    int  ay = y3 - y0 - cy - by;

    float x = ax*pow(t, 3) + bx*pow(t,2) + cx*t + x0;
    float y = ay*pow(t, 3) + by*pow(t,2) + cy*t + y0;
    point(x,y);
  }
}












