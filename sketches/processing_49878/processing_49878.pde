
// ================
// 定数
// ================
final int     PLANE_SIZE = 400;
final PVector vLight = new PVector(0, 0, -1);  // 並行光源

PMatrix3D     iViewMat;
Plane         p;
int           time;

void setup() {
  size(400, 300, P3D);
  frameRate(30);
  
  PImage bump = loadImage("bump.png");  
  p = new Plane(bump);
}

void draw() {
  background(255);
  
  camera(0, 0, 1000, 0, 0, 0, 0, 1, 0);
  iViewMat = (PMatrix3D)g.getMatrix();
  iViewMat.invert();
  
  // ================
  // 適当に回します。
  // ================
  time++;
  rotateY(radians(time * 1.0));
  rotateX(radians(time * 0.4));
  rotateZ(radians(time * 0.8));
  
  // ==================
  // 適当に箱を描きます
  // ==================
  pushMatrix();
    translate(0, 0, PLANE_SIZE/2);
    p.render();
  popMatrix();

  pushMatrix();
    translate(0, 0, -PLANE_SIZE/2);
    rotateY(PI);
    p.render();
  popMatrix();

  pushMatrix();
    rotateY(HALF_PI);
    pushMatrix();
      translate(0, 0, -PLANE_SIZE/2);
      p.render();
    popMatrix();
    translate(0, 0, PLANE_SIZE/2);
    rotateY(PI);
    p.render();
  popMatrix();
  
  pushMatrix();
    rotateX(HALF_PI);
    pushMatrix();
      translate(0, 0, PLANE_SIZE/2);
      p.render();
    popMatrix();
    translate(0, 0, -PLANE_SIZE/2);
    rotateX(PI);
    p.render();
  popMatrix();

}

