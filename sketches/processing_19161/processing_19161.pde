
// 3D creations
import toxi.processing.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.math.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;

ToxiclibsSupport gfx;

import peasy.*;
PeasyCam cam;
PGraphics3D p3d ;

void setup() {
  size(1024,768,P3D);

  ////////////// Graphics ////////////////////
  gfx = new ToxiclibsSupport(this);
  p3d = (PGraphics3D)g;

  /////////////// Set the Camera /////////////////////
  cam = new PeasyCam(this, 0, 0, 80, 300);
  cam.setMinimumDistance(30);
  cam.setMaximumDistance(500);
}


void draw() {

  background(0);
  fill(255);

  scale(2);
  rotateZ(PI);  
  cam.feed();

 PMatrix3D proj = p3d.projection.get();
 PMatrix3D modvw = p3d.modelview.get();
 float [] cameraPosition = cam.getPosition();

// GluLookAt  ...
  float x = 2* (float)mouseX / (float)width - 1;
  float y = 2* (float)mouseY / (float)height - 1;
  PVector vect = new PVector(x, y, 1);
  PVector transformVect = new PVector();

  proj.apply(modvw);
  proj.invert();
  proj.mult(vect, transformVect);  

  stroke(200);
  
  Ray3D ray = new Ray3D(new Vec3D(cameraPosition[0],
				cameraPosition[1],
				cameraPosition[2]), //new Vec3D(0,0,0),
                        new Vec3D(transformVect.x,
  				  transformVect.y,
  				  transformVect.z));

  Plane plan1 = new Plane(new Vec3D(0,1,0.2), new Vec3D(0, 1, 0));
  

  ReadonlyVec3D res = plan1.getIntersectionWithRay(ray);
 
  gfx.plane(plan1, 50); 

  if(res != null){
    println(res);
    gfx.sphere(new Sphere(res, 8.), 8, true);
  }
}



