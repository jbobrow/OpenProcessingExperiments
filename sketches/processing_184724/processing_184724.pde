
Arch [] arches = new Arch[17];
float gearRotatorAng = 0.0;

void setup() {
  size(600, 400, P3D);
  for (int i = 0; i < 16; i++) {
    arches[i] = new Arch(50,50,50);
  }
}

void draw() {
  background(50);
  translate(width/2, height/2,-50);
  rotateX(-20);
  rotateZ(gearRotatorAng);
  //rotateX(PI/4);
  for (float ang = 0; ang <= 2*PI; ang+=PI/8) {
    pushMatrix();
    rotateZ(ang);
    translate(180, 0, 100);
    for(int i = 0; i < 16; i++){
    arches[i].display();
}
    popMatrix();  
  }
  gearRotatorAng += .01;
}

class Arch {

  float x,y,z;
  
  Arch(float nx, float ny, float nz){
    x = nx;
    y = ny;
    z = nz;
  }
 
  void display() {
    fill(150);
    noStroke();
    pushMatrix();
    translate(0,0,0);
    box(20,60,20);
    translate(0,20,20);
    box (20,20,60);
    translate(0,-40,0);
    box (20,20,60);
    popMatrix();

  }
}

