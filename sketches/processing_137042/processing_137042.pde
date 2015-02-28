

PGraphicsOpenGL gl;
PMatrix3D S = new PMatrix3D(); //camera space to screen space matrix
PMatrix3D P = new PMatrix3D(); //projection of model to camera
PMatrix3D M = new PMatrix3D(); //projection of world to model
PMatrix3D Si = new PMatrix3D(); //screen to camera
PMatrix3D Pi = new PMatrix3D(); //camera to model
PMatrix3D Mi = new PMatrix3D(); //model to world

//vectors of mouse location and last 30 locations
float[] click = new float[4];
float[][] last = new float[30][4];

//height in z direction of constraint plane
float h = 0;

void setup(){
  size(800, 600, P3D);
  rectMode(CENTER);
  
  //set the fixed camera to screen matrix
  S.set(width/2, 0, 0, width/2,
        0, -height/2, 0, height/2,
        0, 0, 0.5, 0.5,
        0, 0, 0, 1);
        
  //get inverse matrix
  Si.set(S);
  Si.invert();
  
  //get the graphics object which contains camera projection/model view
  gl = (PGraphicsOpenGL) this.g;
  
  //set camera position
  camera(0, 0, 800, 0, 0, 0, 0, 1, 0);
  
  //get current camera projection and inverse
  P.set(gl.projection);
  Pi.set(P);
  Pi.invert();
}

void draw(){
  background(0);
  
  //perform time-varying rotations
  rotateX(sin(0.0133*frameCount + 1));
  rotateY(sin(0.01*frameCount));
  
  //get the current model view matrix and inverse
  M.set(gl.modelview);
  Mi.set(M);
  Mi.invert();
  
  //draw a rectangle
  noFill();
  stroke(255);
  rect(0, 0, width, height);
  
  //get 3D coordinates which correspond to the 2D position of the mouse on the screen
  //constrained such that the 3D point has z-value of h
  click = worldCoords(mouseX, mouseY, h);
  last[frameCount/10 % last.length] = click;
  
  //draw the last 30 locations
  for(int i = 0; i < last.length; i++){
    pushMatrix();
    translate(0, 0, last[i][2]);
    ellipse(last[i][0], last[i][1], 10, 10);
    popMatrix();
  }
  
  //draw current location with larger circle
  translate(0, 0, click[2]);
  ellipse(click[0], click[1], 20, 20);
}


float[] worldCoords(float x, float y, float h){
  //inversion of 2D screen coordinates to 3D world coordinates with z-plane constraint
  PMatrix3D SPMi = new PMatrix3D();
  SPMi.set(Si);
  SPMi.preApply(Pi);
  SPMi.preApply(Mi);
  
  //solve for z needed to end up with world-z = h
  float z = ((SPMi.m20 - h*SPMi.m30)*x + (SPMi.m21 - h*SPMi.m31)*y + (SPMi.m23 - h*SPMi.m33)) / (h*SPMi.m32 - SPMi.m22);
  
  float[] mouse = {x, y, z, 1};
  float[] orig = new float[4];
  
  SPMi.mult(mouse, orig);
  
  for(int i = 0; i < 4; i++){
    orig[i] /= orig[3];
  }
  
  return orig;
}

void keyPressed(){
  if(keyCode == UP){
    h+=10;
  }
  if(keyCode == DOWN){
    h-=10;
  }
}


