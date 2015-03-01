
void setup() {
  size(800, 600, P3D);
}
int rotzfactor = 0;
void draw() {
  float rotx= (mouseY/360.0)*-2*PI+PI;
  float roty= (mouseX/420.0)*2*PI-PI;
  float rotz = rotzfactor*PI/36;
  translate(0, height/2, -5000);
  rotateX(PI/8);
  for (int z = 0; z < 1100; z += 100) {
    for (int x = 0; x < 1100; x += 100) {
      for (int y = 0; y < 1100; y += 100) {
        pushMatrix();
        translate(x, y, z);
        float h = 100;
        translate(0, -h/2, 0);
        rotateX(rotx);
        rotateY(roty);
        rotateZ(rotz);
        fill(random(255), random(255), random(255));
        box(100, h, 100);
        popMatrix();
      }
      if (key == CODED) {
        if (keyCode == UP) {
          rotzfactor++;
        } else if (keyCode == DOWN) {
          rotzfactor--;
        }
      }
    }
  }
}

