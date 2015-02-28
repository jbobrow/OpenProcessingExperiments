
float x, z;
float ang;

void setup() {
  size(600, 600, P3D);
stroke(200);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<4; i++) {
    x=cos(ang)*i*100;
    z=sin(ang)*i*100;
    pushMatrix();
    translate(x, 0, z);
    rotateY(ang);
    fill(255);
    sphere(50);
    popMatrix();
  }
  ang+=0.05;
}



