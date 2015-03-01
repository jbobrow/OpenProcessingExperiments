
float gearRotatorAng = 0.0;
StoneArch[] stonehenge = new StoneArch[16];
void setup() {
  size(600, 400, P3D);
  for (int i =  0; i<16; i++) {
    stonehenge[i] = new StoneArch(0, 0, -400);
  }
}

void draw() {
  int i = 0;
  background(mouseX+mouseY);
  translate (width/2, height/2);
  //rotate(PI/4);


  for (float ang = 0; ang<=2*PI; ang+=PI/8) {
    pushMatrix();
    rotateY(ang+gearRotatorAng);

    stonehenge[i].render();
    fill(mouseX, 0, mouseY);
    translate(0, 0, -200);
    box(50);
    popMatrix();
  }
  gearRotatorAng += .01;
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
    pushMatrix();
    translate(x, 0, x);
    
    translate(-50,0,0);
    box(40,100,40);
    
    translate(100,0,0);
    box(40,100,40);
    
    translate(-50,-70,0);
    box(140,40,40);
    
    popMatrix();
  }
}


