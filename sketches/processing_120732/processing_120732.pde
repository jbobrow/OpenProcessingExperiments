
import quickhull3d.*;
import ComputationalGeometry.*;

IsoSurface iso ;
PVector[] pts;

void setup(){
  
  size(800,800, P3D);
  PVector start = new PVector(-100,-100,-100);
  PVector end = new PVector(100,100,100);
  iso = new IsoSurface(this, start, end, 16);

  pts = new PVector[20];
  for(int i=0; i<pts.length; i++){
     pts[i] = new PVector( random(-100,100), random(-100,100), random(-100,100)); 
  }
}


void draw(){
 
  // clear out old data
  iso.clear();
  
  // jitter points and add back to IsoSurface
  float j = 8;
  for(int i=0; i<pts.length; i++){
     pts[i].add( random(-j,j), random(-j,j), random(-j,j)); // jitter
     iso.addPoint( pts[i], 2 ); // add a point to the isosurface with a weight
  }
  
  lights();
  background(200);
  noStroke();
  camera(200,200,200,0,0,0,0,0,-1);
 
  fill(255,0,0);
  iso.plot(.01);
  
  fill(255,255,0);
  iso.plot(.005);
  
  fill(0,255,255);
  iso.plot(.0025);
  
    
}


