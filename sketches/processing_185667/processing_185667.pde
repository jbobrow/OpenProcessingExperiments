
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh, oldmesh;
WB_Render3D render;

void setup() {
  size(900, 900, P3D);
  smooth(6);
  HEC_Dodecahedron creator=new HEC_Dodecahedron();
  creator.setEdge(100); 
  mesh=new HE_Mesh(creator); 
  
  mesh.splitFacesCenter();
  mesh.splitFacesTri(20);
  mesh.smooth();
   createMesh();

  render=new WB_Render3D(this);
}

void draw() {
  background(255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(200, 200, 0);
  
  // first time
  rotateY(frameCount*0.00005);
  // either make it move or just keep it static
  
  render.drawEdges(oldmesh);

  stroke(0);
  render.drawEdges(mesh);
  fill(106);
  noStroke();
  render.drawFaces(mesh);
  fill(106, 0, 0);
  HE_Face f=render.pickClosestFace(mesh,mouseX,mouseY);
  if(f!=null) render.drawFace(f);

  
  
    rotateY(frameCount*0.0005);

  //BALL 2
  translate(250, 250, 0);
  stroke(0);
  render.drawEdges(mesh);
  fill(119);
  noStroke();
  render.drawFaces(mesh);
  fill(110, 110, 0);
  HE_Face f2=render.pickClosestFace(mesh,mouseX,mouseY);
  if(f2!=null) render.drawFace(f2);
  
  
      rotateY(frameCount*0.005);

  //BALL 3
  translate(250, 250, 0);
  stroke(255);
  render.drawEdges(mesh);
  fill(110);
  noStroke();
  render.drawFaces(mesh);
  fill(190, 190, 0);
  HE_Face f3=render.pickClosestFace(mesh,mouseX,mouseY);
  if(f3!=null) render.drawFace(f3);
}

void createMesh() {
   HEC_Torus creator=new HEC_Torus(60,240,40,60);
  mesh=new HE_Mesh(creator);

  oldmesh=mesh.get();
   mesh.simplify(new HES_TriDec().setGoal(60)); 
   // 160 OR 60 MEANS NUM OF FACES ON THE RINGS
}
