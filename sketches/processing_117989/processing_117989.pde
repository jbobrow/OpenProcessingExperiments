

import peasy.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.math.*;
import toxi.volume.*;
import toxi.processing.*;
import controlP5.*;

ToxiclibsSupport gfx;

PeasyCam cam;

VolumetricSpaceArray volume;
IsoSurface surface;
VolumetricBrush brush;

ControlP5 ui;

TriangleMesh mesh = new TriangleMesh("mesh");

float ISO = 0.3;
int GRID = 40;
int DIM = 600;

Vec3D SCALE = new Vec3D(DIM,DIM,DIM);

ArrayList <Point> pointCloud;

void setup(){
  
  size(1280,720, OPENGL);
  
  cam = new PeasyCam(this,100);
  
  gfx=new ToxiclibsSupport(this);
  
  ui = new ControlP5(this);
  ui.setAutoDraw(false);
  
  pointCloud = new ArrayList <Point> ();
  
  volume=new VolumetricSpaceArray(SCALE,GRID,GRID,GRID);
  surface=new ArrayIsoSurface(volume);
  brush=new RoundBrush(volume,SCALE.x/2);
  
  for(int i = 0; i < 100; i++){
   
    Vec3D v = new Vec3D(random(-300,300), random(-300,300), random(-300,300));
    Point p = new Point( v);
    pointCloud.add(p);
  }
  
  
  ui.addSlider("ISO",0,1,ISO,20,20,300,14).setLabel("iso threshold");
}

void draw(){
  
  background (0);
  lights();
  
  stroke(255);
  strokeWeight(1);
  noFill();
  box(600);
  
  volume.clear();
  
  for(Point p : pointCloud){
   p.display(); 
  }
  volume.closeSides();
  
  surface.reset();
  surface.computeSurfaceMesh(mesh,ISO);
  mesh.computeVertexNormals();
  stroke(255);
  strokeWeight(0.1);
  noStroke();
  fill(255);
  gfx.mesh(mesh, true);
  
   if (ui.window(this).isMouseOver()) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
  
  gui();
}

void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  ui.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void keyPressed() {
  
   if (key=='s') {
    mesh.saveAsSTL(sketchPath(mesh.name+".stl"));
   }
   
}










class Point{
 
 Vec3D loc;
  
 Point(Vec3D _loc){
  loc = _loc;
 } 
 
 void run(){
   
   display();
   
 }
 
 void display(){
   strokeWeight(5);
   stroke(255,0,0);
   point(loc.x,loc.y,loc.z);
   
   brush.setSize(80);
   brush.drawAtAbsolutePos(loc,1);
 }
 
 
}


