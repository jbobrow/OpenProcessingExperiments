

import wblut.processing.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.subdividors.*;
import wblut.hemesh.core.*;
import wblut.hemesh.modifiers.*;

HE_Mesh mesh;
WB_Render render;

void setup() {
  size(800, 800, P3D);
  createMesh();

  HEM_SphereInversion modifier=new HEM_SphereInversion();
  modifier.setRadius(200);
  modifier.setCenter(50, 0, 0);
  modifier.setCutoff(1000);
  modifier.setLinear(false);
  mesh.modify(modifier);

  render=new WB_Render(this);
}

void draw() {
  background(120);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(400, 400, 0);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  fill(255);
  noStroke();
  render.drawFaces(mesh);
  stroke(150);
  render.drawEdges(mesh);
}

void createMesh() {
  HEC_Cube creator=new HEC_Cube(30, 1,1,1);
  mesh=new HE_Mesh(creator);
  mesh.modify(new HEM_Extrude().setDistance(300));
  mesh=new HE_Mesh(new HEC_FromFrame().setFrame(mesh).setMaximumStrutLength(20));
}



