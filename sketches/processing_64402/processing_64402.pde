
// This is a test code to map the coordinates of a mouse on a screen to
// a 3d plane that represents the processing PApplet screen
// this is useful for direct manipulations of space while hovering/clicking
// in the typical Processing screen.
// By Petros Koutsolampros


float camFOV = PI/3.0;
PVector camPos = new PVector(200, 200, 200);
PVector camCent = new PVector(100, 0, 0);
int camMode = 1;

void setup() {
  size(400, 300, P3D);
  noFill();
  }
void draw() {
  background(255);
  perspective(camFOV, width*1.0/height, camPos.z/10.0, camPos.z*10.0);
  camera(camPos.x, camPos.y, camPos.z,
   camCent.x, camCent.y, camCent.z,
    0, 0, -1);
  box(100);
  PVector [] screen3D = calcVisiPlane(camPos, camCent, camFOV, 1.0*width/height);
  vLine(camCent, PVector.add(camCent, screen3D[0]));
  vLine(camCent, PVector.add(camCent, screen3D[1]));
  PVector [] mouse3D = mapMouse(new PVector(mouseX, mouseY), new PVector(width, height), screen3D);

  stroke(255, 0, 0);
  vLine(camCent, PVector.add(camCent, mouse3D[0]));
  vLine(camCent, PVector.add(camCent, mouse3D[1]));
  vLine(camCent, PVector.add(camCent, mouse3D[2]));

  PVector v2 = mouse3D[2].get();
  v2.sub(PVector.sub(camPos, camCent));
  v2.mult(2);
  v2.add(PVector.sub(camPos, camCent));
  vLine(camPos, PVector.add(camCent, v2));
  stroke(0, 0, 255);
  pushMatrix();
  translate(v2.x+camCent.x, v2.y+camCent.y, v2.z+camCent.z);
  ellipse(0, 0, 10, 10);
  popMatrix();

  stroke(0);
  vLine(camPos, camCent);
}
void vLine(PVector v1, PVector v2) {
  line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
}
void vVertex(PVector v) {
  vertex(v.x, v.y, v.z);
}
// Will return vectors of the 3D screen representation
// [0] is the positive x axis
// [1] is the positive y axis
// [2] is the z axis moving away from the camera
// Finally Maps previously computed 3D screen normals to true screen size

PVector [] calcVisiPlane(PVector camPos, PVector camCent, float camFov, float aspect) {
  PVector vNormal = new PVector(0, 0, 1);
  PVector camLine = PVector.sub(camPos, camCent);
  PVector xNormal = vNormal.cross(camLine);
  xNormal.normalize();
  xNormal.mult(-tan(camFOV*0.5)*camLine.mag()*aspect);
  PVector yNormal = xNormal.cross(camLine);
  yNormal.normalize();
  yNormal.mult(-tan(camFOV*0.5)*camLine.mag());
  PVector zNormal = xNormal.cross(yNormal);
  zNormal.normalize();
  return new PVector [] {
    xNormal, yNormal, zNormal
  };
}
// Maps mouse coordinates to coordinates on said 3D Plane

PVector [] mapMouse(PVector mousePos, PVector screenSize, PVector [] screen3D) {
  float xFactor = (mousePos.x-screenSize.x*0.5)*2.0/screenSize.x;
  float yFactor = (mousePos.y-screenSize.y*0.5)*2.0/screenSize.y;
  PVector v0 = screen3D[0].get();
  PVector v1 = screen3D[1].get();
  v0.mult(xFactor);
  v1.mult(yFactor);
  return new PVector [] {
    v0, v1, PVector.add(v0, v1)
  };
}
