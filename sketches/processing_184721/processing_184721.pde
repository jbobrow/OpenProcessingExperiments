
StoneArch[] stonehenge = new StoneArch[16];

float ang;
float gearRotatorAng = 0.0;
void setup() {
  size(800, 800, P3D);
  for (int i = 0; i < 16; i ++) {
    stonehenge[i] = new StoneArch(height/2, width/2, -300);
  }
}


void draw() {
  background(50);
  fill(169, 169, 169);
  translate(width/2, height/2, -300);
  rotateX(-PI/2);    
  int i = 0;
  for (float ang = 0; ang<=2*PI; ang+=PI/8) {
    pushMatrix();
    rotateZ(ang+gearRotatorAng);
    stonehenge[i].render();
    popMatrix();
    i++;
  }
  gearRotatorAng += .09;
}
class StoneArch {

  float x, y, z;
  float ang;
  float w, h, d;

  StoneArch(float nx, float ny, float nz) {
    x = nx;
    y = ny;
    z = nz;

    w = 40;
    h = 100;
    d = 40;
  }

  void render() {
    pushMatrix();
    translate(x, -h/2, z);

    // LEFT Piller
    translate(-50, 0, 0);
    box(w, h, d);
    // RIGHT Piller
    translate(100, 0, 0);
    box(w, h, d);

    // TOP Piller
    translate(-50, -70, 0);
    box(140, 40, 40);

    popMatrix();
  }
}

