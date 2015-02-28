
void setup() {
  size(600, 400, P3D);
  stroke(0);
  rectMode(CENTER);
  fill(200);
  
  // initialise camera variables
  scaleY = PI/height;
  scaleX = 2*PI/width;
  camDir = PI/3;
  camElev = PI/2;
  MouseX = width/2;
  MouseY = height/3;
  turnCamera();
  camF_rel = setVector(camDir, camElev);
}

void draw() {
  background(255);

  // CAMERA & CONTROL OPERATIONS
  MouseX = constrain(mouseX, 0, width);
  MouseY = constrain(mouseY, 0, height);
  setCamera();
  camera(camP.x, camP.y, camP.z, camF_abs.x, camF_abs.y, camF_abs.z, 0, 0, -1);
  
  // DRAW ENVIRONMENT
  // checkered plane
  fill(150,200,255);
  for (int i=-10; i<10; i++) {
    for (int j=-10; j<10; j++) {
      noStroke();
      if ((i+j)%2 == 0) rect(i*50, j*50, 50, 50);
    }
  }
  // vertical line
  noFill();
  stroke(100);
  box(1000);
}


// camera position and focus variables
PVector camP = new PVector(0, 1200, 700); // camera position
PVector camF_abs = new PVector();     // camera focus (absolute position)
PVector camF_rel = new PVector();     // camera focus (relative vector)
float camDir, camElev;                // last camera bearing/elevation angles
float mx, my;                         // last mouse X/Y
float MouseX, MouseY;                 // replicate inbuilt mouse variables
float scaleY;                         // scale mouseY inputs to vertical movement
float scaleX;                         // scale mouseX inputs to horizontal movement
int direction = 0;                    // code for controling movement
float moveSpeed = 10;                 // overall controls responsiveness


// main camera calculation operations
void setCamera() {
  camF_rel = setVector(camDir, camElev);
  if (direction >= 1 & direction <= 4) moveCamera(moveSpeed);
  if (direction >= 5 & direction <= 6) elevCamera(moveSpeed);

  camF_abs = camF_rel.get();
  camF_abs.add(camP);
}


PVector setVector(float dir, float elev){
  //generic function to calculate the PVector based on radial coordinates
  PVector v = new PVector(cos(dir), sin(dir), 0);
  float fz = -sin(elev);
  float fy = sqrt(1-pow(fz, 2));
  v.mult(fy);
  v.z = fz;
  return(v);
}


void moveCamera (float speed) {
  PVector moveto = new PVector();

  // left / right movement
  if (direction%2 == 0) {
    float dir = 0;
    if (direction == 2) dir = camDir + PI/2;  // right
    else                dir = camDir - PI/2;  // left
    PVector v = setVector(dir, 0);
    v.mult(speed);
    camP.add(v);
  }

  // forward / backward movement
  else {
    moveto = camF_rel.get();
    if (direction == 1) moveto.mult(-1); // forward
  }

  moveto.normalize();
  moveto.mult(speed);
  camP.sub(moveto);
}


void turnCamera(){
  float x = MouseX - mx;
  float x_scaled = x * scaleX;
  float y = MouseY - my;
  float y_scaled = y * scaleY;
  camDir += x_scaled;
  camElev += y_scaled;
  mx = MouseX;
  my = MouseY;

}


void elevCamera (float speed) {
  if (direction == 5) {  // lower camera
    camP.z -= speed;                
    camF_abs.z -= speed;
  }
  else {                 // raise camera
    camP.z += speed;                
    camF_abs.z += speed;
  }
}


void keyPressed() {
  if      (keyCode == 38 | key == 'w') direction = 1;  // move forward
  else if (keyCode == 39 | key == 'd') direction = 2;  // move right
  else if (keyCode == 40 | key == 's') direction = 3;  // move backward
  else if (keyCode == 37 | key == 'a') direction = 4;  // move left
  else if (key == 'z')                 direction = 5;  // lower camera
  else if (key == 'x')                 direction = 6;  // raise camera
}


void keyReleased() {
  direction = 0;
}


void mouseMoved() {  // turns the camera
  turnCamera();
}
