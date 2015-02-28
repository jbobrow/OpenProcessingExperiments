
import processing.opengl.*;
import peasy.*;

PeasyCam cam;
PMatrix3D currCameraMatrix;
PGraphics3D g3;
Line linePt = new Line();  

//-----------------
void setup() {
  size(800, 600, P3D);
  g3 = (PGraphics3D)g;
  cam = new PeasyCam(this, 600);
  smooth();  
  strokeWeight(0.5);
  cam.rotateX(-0.6);
}
//-----------------
void draw() {

  background(148, 232, 252);
  interrupt2d3d();

  _3d();
  _2d();
}

void _2d() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  // put your 2D object here 

  linePt.action();
  //------------------------
  g3.camera = currCameraMatrix;
}

void _3d() {
  hint(ENABLE_DEPTH_TEST);
  // put your 3D object here 
  linePt.Line3D();
  rotateCame(0,0.005,-0.005);
  //------------------------
  hint(DISABLE_DEPTH_TEST);
}

void rotateCame(float x, float y, float z){
  
  cam.rotateX(x);
  cam.rotateY(y);
  cam.rotateZ(z); 
}


