
StoneArch[] stonehedge = new StoneArch[16];
float q = 0;
void setup() {
  size(800, 600, P3D);
  for (int i = 0; i < 16; i++) {
    stonehedge[i] = new StoneArch(0, 0, 0);
  }
}

  void draw() {
    background(50);
    translate(width/2, height/2, -200);
    int i = 0;
    rotateY(q);
    for (float ang = 0.0; ang < 2*PI; ang += PI/8) {
      pushMatrix();
      rotateY(ang);
      
      translate(0, 0, 360);
      stonehedge[i].render();
      popMatrix();
      i++;
    }
    q += .001;
  }
class StoneArch {
  float x, y, z;
  float ang;

  StoneArch(float nx, float ny, float nz) {
    x = nx;
    y = ny;
    z = nz;
  }

  void render() {
       fill(#BCBCBC);

    pushMatrix();
    translate(x, 0, z); 
    translate(-40, 0, 0);
    box(40, 100, 40);
    translate(100, 0, 0); 
    box(40, 100, 40);
    translate(-50, -70, 0);
    box(140, 40, 40);
    popMatrix();
  }
}

