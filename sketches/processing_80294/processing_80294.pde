
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import controlP5.*;
PeasyCam cam;
//hemesh
//import processing.opengl.*;
import wblut.processing.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.subdividors.*;
import wblut.hemesh.core.*;
import wblut.hemesh.modifiers.*;
PGraphics pg;

//hemesh
int numP = 10;
int numQ=10;
PMatrix3D currCameraMatrix;

WB_Polygon2D poly;
WB_Polygon2D qoly;
WB_Render render;
WB_XY[] points;
ArrayList<WB_Polygon2D> intersect;
ArrayList<HE_Mesh> meshes;
ControlP5 controlP5;
int lightR;
int lightG;
int lightB;
void setup() {
  size(450, 380, P3D);
    cam = new PeasyCam(this, 1000);
  controlP5 = new ControlP5(this);
 controlP5.addSlider("lightR",50,255,255,20,20,160,20);
 controlP5.addSlider("lightG",50,255,255,20,50,160,20);
 controlP5.addSlider("lightB",50,255,255,20,80,160,20);
 controlP5.addSlider("numP",10,100,10,250,20,160,20);
 controlP5.addSlider("numQ",10,100,10,250,50,160,20);
 controlP5.setAutoDraw(false);
}
  
void draw() {
  background(255);
 
  lights();
 // translate(400, 400);
  rotateX(PI/6);
  float a=(frameCount*TWO_PI/2000);
  points =new WB_XY[numP];
  for (int i=0;i<numP;i++) {
  //  float r=(i%2==0)?1000:100;
  float r=(i%3==0)?1000:100;
    points[i]=new WB_XY(r*cos(i*TWO_PI/numP), r*sin(i*TWO_PI/numP));
  }
  poly=new WB_Polygon2D(points, numP);
  render=new WB_Render(this);

  points =new WB_XY[numQ];
  for (int i=0;i<numQ;i++) {
    float r=(i%3==0)?400:300;
    points[i]=new WB_XY(r*cos(i*TWO_PI/numQ+a), r*sin(i*TWO_PI/numQ+a)); //mouseX,mouseY+r*sin/cos - interactive
       
  }
//    for (int num=10; num<20; num=num+numP)  {
//      numP = num;
//    }

  qoly=new WB_Polygon2D(points, numQ);
intersect=WB_Polygon2D.subtract(qoly, poly);
  meshes=new ArrayList<HE_Mesh>(intersect.size());
  for (int i=0;i<intersect.size();i++) {
    HEC_Polygon pc=new HEC_Polygon(intersect.get(i), 50);
    HE_Mesh m=new HE_Mesh(pc);
    m.modify(new HEM_Extrude().setChamfer(0.2).setDistance(16));
     m.subdivide(new HES_Smooth());
    meshes.add(m);
  }
 
  smooth();
//  strokeWeight(2);
//  stroke(0);
 pushMatrix();
//translate(0, 0, -100);
//  fill(255, 0, 0, 50);
//render.drawPolygon2D(intersect);
 // noSmooth();
translate(0, 0, -200);
  noStroke();
//stroke(230);
fill(200,60);
render.drawPolygon2D(intersect);
translate(0, 0, +200);
directionalLight(lightR, lightG, lightB, 1, 1, -1);
  directionalLight(220, 220, 220, -1, -1, 1);
  fill(190,120);
  render.drawFaces(meshes);
   popMatrix();
   gui();
}

void gui() {
   cam.beginHUD();
   controlP5.draw();
   cam.endHUD();
   updateUI();

 }
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) { 
    
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());

  }
}
void updateUI(){//only for running in the browser...
lightR=(int)controlP5.controller("lightR").value();
lightG=(int)controlP5.controller("lightG").value();
lightB=(int)controlP5.controller("lightB").value();
numP=(int)controlP5.controller("numP").value();
numQ=(int)controlP5.controller("numQ").value();
}


