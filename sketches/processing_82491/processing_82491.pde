
import javax.media.opengl.GL;
import processing.opengl.*;
import codeanticode.glgraphics.*;

// Model loading 1
import saito.objloader.*;

// Model loading 2
import toxi.processing.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh.*;

GL gl = null;

void setup() {
  updateDirection();
  updateSide();
  size(700, 394, GLConstants.GLGRAPHICS);
  _model = loadModel("placevict.obj");
  frameRate(80);
}

void draw() {

  background(255);
  PGraphicsOpenGL graphics = (PGraphicsOpenGL) this.g;
  
  //set the camera
  setCamera(graphics, camPos, camTarget, camUp);
  gl = graphics.beginGL();

  //draw the scene
  drawScene(graphics);

  // Clear the depth buffer
  gl.glClear( GL.GL_DEPTH_BUFFER_BIT); 

  graphics.endGL();
  
  
  
  //update controls
  if (_up) {
    walk(userSpeed, _fixed);
  }
  if (_down) {
    walk(-userSpeed, _fixed);
  }
  if (_left) {
    strafe(-userSpeed, _fixed);
  }
  if (_right) {
    strafe(userSpeed, _fixed);
  }}

void keyPressed() {
  if (keyCode == UP) {
    _up = true;
  }
  if (keyCode == DOWN) {
    _down = true;
  }
  if (keyCode == LEFT) {
    _left = true;
  }
  if (keyCode == RIGHT) {
    _right = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    _up = false;
  }
  if (keyCode == DOWN) {
    _down = false;
  }
  if (keyCode == LEFT) {
    _left = false;
  }
  if (keyCode == RIGHT) {
    _right = false;
  }
}

void walk(float speed, boolean fixed){
  updateDirection();
  camPos.add(PVector.mult(camDirection, speed));
  if(!fixed)
    camTarget.add(PVector.mult(camDirection, speed));
}

void strafe(float speed, boolean fixed){
  updateSide();
  camPos.add(PVector.mult(camSide, speed));
  if(!fixed)
    camTarget.add(PVector.mult(camSide, speed));
}

float getDist() {
  return dist(camPos.x, camPos.y, camPos.z, 
  camTarget.x, camTarget.y, camTarget.z);
}


