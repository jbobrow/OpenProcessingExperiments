
Stone stonehenge;

float gearRotatorAng = 0.0;
void setup() {
  size(600, 400, P3D);
  stonehenge = new Stone(0,0,0);
}

void draw() {
  background(50);
  translate(width/2, height/2,-200);
  rotateX(PI/4);
  for (float ang=0; ang<=2*PI; ang+=PI/3) {
    pushMatrix();
    rotateZ(ang+gearRotatorAng);
    translate(180, 0, 100);
    stonehenge.render();
    popMatrix();
  }
  gearRotatorAng+=.001;
}


class Stone{
  float x,y,z;
  float ang;

  Stone(float nx, float ny, float nz) {
    x=nx;
    y=ny;
    z=nz;
    
  }

  void render() {
    rotateX(PI/-2);
    rotateY(PI/2);
    pushMatrix();
    translate(x,0,z);

    translate(-50,0,0);
    box(40,100,40);
 
 
 
    translate(100,0,0);
    box(40,100,40);
  


    translate(-50,-70,0);
    box(140,40,40);
    
    
    popMatrix();
  }
}
