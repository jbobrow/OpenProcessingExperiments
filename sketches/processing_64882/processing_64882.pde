
import mshape.*;
import wblut.hemesh.core.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.modifiers.*;

PShape retainedMesh;
PShape retainedInverse;
ArcBall arcball;   
HE_Mesh mesh;
HE_Mesh invMesh;
int RES = 32;  // original was 20
MeshToVBO mshape;

void setup() {
  size(800, 800, P3D);
  arcball = new ArcBall(this);
  mshape = new MeshToVBO(this);  
  smooth(16);  
  float[][][] values = new float[RES + 1][RES + 1][RES + 1];
  for (int i = 0; i < RES + 1; i++) {
    for (int j = 0; j < RES + 1; j++) {
      for (int k = 0; k < RES + 1; k++) {
        values[i][j][k] = 2.1 * noise(0.35 * i, 0.35 * j, 0.35 * k);
      }
    }
  }

  HEC_IsoSurface creator = new HEC_IsoSurface();
  creator.setResolution(RES, RES, RES);// number of cells in x,y,z direction
  creator.setSize(400.0f / RES, 400.0 / RES, 400.0 / RES);// cell size
  creator.setValues(values);// values corresponding to the grid points
  // values can also be double[][][]
  creator.setIsolevel(1);// isolevel to mesh
  creator.setInvert(false);// invert mesh
  creator.setBoundary(100);// value of isoFunction outside grid
  // use creator.clearBoundary() to rest boundary values to "no value".
  // A boundary value of "no value" results in an open mesh

  mesh = new HE_Mesh(creator);
  mesh.modify(new HEM_Smooth().setIterations(10).setAutoRescale(true));
  creator.setInvert(true);
  invMesh = new HE_Mesh(creator);
  invMesh.modify(new HEM_Smooth().setIterations(10).setAutoRescale(true));
  noStroke();
  // silver
  retainedMesh = mshape.meshToRetained(mesh, 192, 192, 192);
  //white marble
  retainedInverse = mshape.meshToRetained(invMesh, 249, 246, 224);
}


void draw() {
  background(0);
  lights();
  lightSpecular(80, 80, 80);
  directionalLight(80, 80, 80, 0, 0, -1);
  ambientLight(50, 50, 50);
  translate(400, 400, 0);
  arcball.update();
  shape(retainedMesh);
  shape(retainedInverse);
}

