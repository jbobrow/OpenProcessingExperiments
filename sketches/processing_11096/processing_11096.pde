
import peasy.*;

import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

import guicomponents.*;

private PeasyCam pcam;

private BezTube btube;
private Toroid toroid1;
private Rot rot1;
private float[] ang1;

// ###################################################
// BOX SPEED CONTROL VARIABLES
private float speed = 0.001f;
private float t = 0, dt = speed;

// The greater segs the smoother the curve
// slices must be >= 3 
int segs = 100, slices = 8;

void setup(){
  size(400,400,P3D);
  btube = makeBezTube();
  PVector toroidStart = btube.getPoint(t);

  // ################################################
  // MAKE TOROID CODE
  toroid1 = new Toroid(this, 6, 20);
  toroid1.moveTo(toroidStart);
  toroid1.fill(color(255,64,64));
  toroid1.stroke(color(255,255,0));
  toroid1.strokeWeight(1.5f);
  toroid1.setRadius(5,3,11.0f);
  toroid1.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  // ################################################

  pcam = new PeasyCam(this, 200);
  pcam.setMinimumDistance(60);
  pcam.setMaximumDistance(600);

}

void mouseClicked(){
  println("------------------------------------------------------------------------");
}

void draw(){
 // background(255,215,175);
  background(215,255,175);
  lights();
  // ################################################
  // CODE TO MOVE BOX ALONG TUBE

  // Calculate parametric position along tube
  t += dt;
  if(t >= 1.0f){
    t = 0.99999f;
    dt = -speed;
  }
  else if( t<0.0f){
    t = 0.0f;
    dt = speed;
  }
  // Get BezPoint and get angle for tangent to tube
  PVector position = btube.getPoint(t);
  PVector tangent = btube.getTangent(t);
  rot1 = new Rot(new PVector(0,1,0), tangent);
  ang1 = rot1.getAngles(RotOrder.XYZ);
//  println("[ " + degrees(ang1[0]) + " "+ degrees(ang1[1]) + " "+ degrees(ang1[2]) + " ]   " + bp1.tangent);

  // Move box and orient to tube tangent 
  toroid1.moveTo(position);
  toroid1.rotateTo(ang1);
  toroid1.draw();

  // END OF TOROID MOVE CODE
  // ################################################

  btube.draw();
}

public BezTube makeBezTube(){
  PVector[] p = new PVector[] {
    new PVector(-141.34f, 35.87f, -52.9f) , 
    new PVector(-72.69f, 5.26f, -28.34f) , 
    new PVector(5.66f, -17.46f, 15.1f) , 
    new PVector(23.81f, -76.26f, 8.41f) , 
    new PVector(67.81f, -110.51f, 52.91f) , 
    new PVector(104.81f, -97.01f, 51.91f) , 
    new PVector(113.06f, -72.01f, 39.91f) , 
    new PVector(121.81f, -53.46f, 18.91f) , 
    new PVector(98.66f, 40.54f, -47.9f) , 
    new PVector(67.66f, 78.49f, -60.9f) , 
    new PVector(38.06f, 120.49f, -55.59f) , 
    new PVector(15.81f, 126.39f, -17.59f) , 
    new PVector(-6.34f, 109.57f, 40.1f) , 
    new PVector(-25.94f, 84.57f, 66.1f) , 
    new PVector(-60.34f, 63.12f, 53.1f) , 
    new PVector(-133.82f, -24.96f, 0.81f) , 
    new PVector(-136.03f, -66.74f, 28.91f) , 
    new PVector(-120.03f, -107.74f, 54.91f) , 
    new PVector(-88.03f, -124.74f, -11.71f) , 
    new PVector(-39.03f, -118.74f, -59.09f) , 
    new PVector(-6.34f, -54.13f, -61.9f) , 
    new PVector(14.66f, -9.27f, -47.9f) , 
    new PVector(23.81f, -20.01f, 8.41f) , 
    new PVector(35.31f, -2.46f, 23.41f) , 
    new PVector(93.81f, 16.74f, 28.41f) , 
    new PVector(141.35f, 36.26f, 52.91f)  
     };

  BezTube bt = new BezTube(this, new Bezier3D(p, p.length), 5.0f, segs, slices);

  bt.fill(color(32,32,200));
  bt.stroke(color(64,200,200));
  bt.strokeWeight(2.0f);
  bt.drawMode(Shape3D.SOLID | Shape3D.WIRE);

  bt.fill(color(150,255,255), BezTube.BOTH_CAP);
  bt.drawMode(Shape3D.SOLID, BezTube.BOTH_CAP);

  return bt;
}




