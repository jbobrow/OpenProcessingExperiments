

block [] cube = new block[50];
float gearRotatorAng = 0.0;

void setup(){
  size(600,400,P3D);
    for (int i = 0; i < cube.length; i++) { 
    cube[i] = new block(50,50,50);
  }
}

void draw(){
  background(50);
  camera(width/2.0+(mouseX), mouseY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  translate(width/2, height/2);
  rotateX(PI/4);
  for(float ang = 0; ang <=2*PI; ang +=PI/8){
    pushMatrix();
    rotateZ(ang + gearRotatorAng);
    translate(180,0,100);
    for (int i = 0; i < cube.length; i++) { 
    cube[i].display();;
  }
    popMatrix();
  }
  gearRotatorAng+=.01;
}
class block {
  float x, y, z;
  block(float nx, float ny, float nz) {
    x = nx;
    y = ny;
    z = nz;
  }

  void display() {
    stroke(0,255,0);
    pushMatrix();
    translate(x, y, z);
    box(20,60,20);
    translate(0,20,-20);
    box (20,20,-60);
   translate(0,-40,-20);
    box (20,20,-40);
    popMatrix();
  }
}

