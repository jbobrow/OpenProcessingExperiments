
//import processing.opengl.*;

import toxi.geom.*;
import toxi.volume.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
import toxi.physics.*;

import peasy.*;
import controlP5.*;

isoSurface srf;

ToxiclibsSupport toxiSup;
PeasyCam cam;
PMatrix3D currCameraMatrix;
PGraphics3D g3;
ControlP5 controlP5;

public float thres = 0.002;
float thres0;
boolean refresh = true;
float worldSize = 200;
public int resolution = 30;
int resolution0;
int nMeta = 100;

void setup(){
  size(600, 600, P3D);
  //smooth();
  
  hint(ENABLE_NATIVE_FONTS); 
  thres = 0.000075*nMeta;
  
  //--------------------------------------- CONTROLP5
  controlP5 = new ControlP5(this);
  controlP5.addSlider("thres", 0.00001*nMeta, 0.0002*nMeta, thres, 10 ,10, 150, 10);
  controlP5.addSlider("resolution", 10, 60, resolution, 300 ,10, 150, 10);
  controlP5.setAutoDraw(false);

  cam = new PeasyCam(this,200);
  g3 = (PGraphics3D)g;
  toxiSup = new ToxiclibsSupport(this);  
  
  //--------------------------------------- SURFACE
  srf = new isoSurface(worldSize);
  srf.evaluateVolume();  
}

void draw(){ 
  background(255);
  lights();
  srf.update();
  gui();
  refresh = (thres0 != thres || resolution0 != resolution);
  thres0 = thres;
  resolution0 = resolution;
}

//--------------------------------------- CONTROLP5 DISPLAY
void gui() {      //displays sliders 2d while having 3d camera view
  cam.beginHUD();
    currCameraMatrix = new PMatrix3D(g3.camera);
    camera();
    pushStyle();
      noLights();
      noStroke();
      fill(0,150);
      rect(0, 0, width, 25);
      
      controlP5.controller("thres").setColorActive(#FF00FF);
      controlP5.controller("resolution").setColorActive(#FF00FF);
      controlP5.setColorForeground(#AF00AF);
      controlP5.setColorBackground(#320032);
      controlP5.draw();
    popStyle();
    g3.camera = currCameraMatrix;
  cam.endHUD();
  updateUI();
}

void updateUI(){
  thres = controlP5.controller("thres").value();
}

