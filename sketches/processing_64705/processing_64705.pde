
/**
 * USphHarmonics01 .pde - Marius Watz, 2012
 * http://workshop.evolutionzone.com
 * 
 * Simple implementation of a well-known series of wave functions 
 * known as spherical harmonics, which are defined in spherical coordinates. 
 *
 * This sketch also demonstrates a possible way to morph between
 * two UGeometry geometries, provided that the two objects
 * have the same number of faces.
 *
 * Written using Paul Bourke's code as a reference:
 * http://paulbourke.net/geometry/sphericalh/
 */
 
//import processing.opengl.*;

import controlP5.*;

import unlekker.util.*;
import unlekker.modelbuilder.*;
import unlekker.modelbuilder.filter.*;
import ec.util.*;

int coeff[];
UNav3D nav;
UGeometry geo,geo2;

PGraphics cp5;
boolean isP3D;

public int meshRes=60,oldMeshRes;
public int meshRes2,meshRes4,maxRib;

public boolean doMorph=true,monochrome;

float accel,accelCnt,accelTime=10000,fract;
long accelStart;

void setup() {
//  if(!online) size(800,800,OPENGL);
  size(800,800,P3D);
  
  if(g.getClass().getName().equals(P3D)) isP3D=true;
//  println(isP3D+" "+P3D+" "+g.getClass().getName());
  
  initGUI();
  initColors();
  initCoeff();
  initMorph();
  
  nav=new UNav3D(this);
  nav.setTranslation(width/2,height/2,-height/2);
  nav.setGUI(gui);
}

void draw() {
  if(isP3D) preDrawGUI();
  
  background(0);
  lights();

  pushMatrix();
  nav.doTransforms();
  rotateX(-radians(45+30*sin(radians(frameCount)*0.25)));
  rotateY(radians(frameCount)*0.1);
  noStroke();
  
  morphMesh();
  drawMesh();  
  
  popMatrix();
  
  drawGUI();
}

void preDrawGUI() {
  fill(0);
  // attempt at hacking P3D blurry fonts
  // http://forum.processing.org/topic/awful-looking-text-when-using-controlp5-in-p3d-mode
  if(cp5==null) 
    cp5 = createGraphics(width,height,JAVA2D);

  
  beginRecord(cp5);
  fill(0,60,100);
  noStroke();
  rect(0,0,gui.cpw,gui.cph);
  gui.draw();
  endRecord();
}

void drawGUI() {
  // draw GUI
  if(!isP3D) gui.draw(); 
  else {
    hint(DISABLE_DEPTH_TEST);
    image(cp5,0,0);
  }
}

void keyPressed() {
  if(key==' ') initCoeff();
  if(key=='s' && !online) saveFrame(
    UIO.getIncrementalFilename(
      this.getClass().getSimpleName()+" ###.png",
      sketchPath)
    );
}

