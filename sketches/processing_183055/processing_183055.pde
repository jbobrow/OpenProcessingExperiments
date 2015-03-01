
float rx = 0;
float rz = 0;


void setup() {
  size(600, 400, P3D);
}


void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(rx);
  rotateZ(rz);
  for (int x=-1; x<=1; x++) {
    for (int y=-1; y<=1; y++) {
      for (int z=-1; z<=1; z++) {
        pushMatrix();
        translate(x*50, y*50, z*50);
        fill(255);
        box(40);

        popMatrix();
      }
    }
  }
  rx +=.02;
  rz += .03;
}



