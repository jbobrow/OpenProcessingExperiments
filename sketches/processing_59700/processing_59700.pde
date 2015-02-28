
import wblut.hemesh.modifiers.*;
import wblut.geom.frame.*;
import wblut.hemesh.composite.*;
import wblut.core.processing.*;
import wblut.hemesh.tools.*;
import wblut.hemesh.simplifiers.*;
import wblut.hemesh.subdividors.*;
import wblut.geom.nurbs.*;
import wblut.core.random.*;
import wblut.geom.triangulate.*;
import wblut.hemesh.creators.*;
import wblut.geom.tree.*;
import wblut.hemesh.core.*;
import wblut.geom.grid.*;
import wblut.core.structures.*;
import wblut.core.math.*;
import wblut.geom.core.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
HE_Mesh mesh;
WB_Render render;


int vals = 31;
int res = vals-1;

void setup() {
  size(600, 400, P3D);
  cam = new PeasyCam(this, 1200);

  PVector pos = new PVector();
  float[][][] values=new float[vals][vals][vals];
  for (int z = 0; z < vals; z++) {
    pos.z = (z-vals/2);
    for (int y = 0; y < vals; y++) {
      pos.y = (y-vals/2);
      for (int x = 0; x < vals; x++) {
        pos.x = (x-vals/2);
        values[z][y][x]=drawSurface(pos);
      }
    }
  }
  
  HEC_IsoSurface creator=new HEC_IsoSurface();
  creator.setResolution(res,res,res);// number of cells in x,y,z direction
  creator.setSize(25,25,25);// cell size
  creator.setValues(values);// values corresponding to the grid points
  creator.setIsolevel(0.01);// isolevel to mesh
  creator.setInvert(true);// invert mesh
  creator.setBoundary(100);// value of isoFunction outside grid
  mesh=new HE_Mesh(creator);
  render=new WB_Render(this);
}

void draw() {
  background(220);
  lights();
  directionalLight(127, 127, 127, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  noStroke();
  fill(225);
  rotateY(radians(-25));
  render.drawFaces(mesh);
}



float drawSurface(PVector pos)
{ 
    PVector v1 = PVector.mult(pos, 0.29);
    float x = v1.x;
    float y = v1.y;
    float z = v1.z;
    
    return abs (cos(v1.x)*sin(v1.z)
              + cos(v1.y)*sin(v1.x)
              + cos(v1.z)*sin(v1.y)) - 0.9;
}


