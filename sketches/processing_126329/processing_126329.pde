
void setup() {
  size(600, 400, P3D);
  frameRate(30);
}

void draw() {
  background(250);
  landscape();
}

float z = 0.0;
float theta = 0.0;
float increment = 0.001;
void landscape() {
  int w = 10;
  int h = 20;
  translate(width/2, height/2, 150);
  rotateX(1.2);
  //rotateY(-0.05+theta);
  float elevation = 15;
  for (int x = -11; x < 11; x++) {
    for (int y = -5; y < 6; y++) {
      beginShape(QUADS);
      fill(175, 150);
      strokeWeight(0.2);
      stroke(0);
      float ampl = 5;
      vertex(x*w, y*h, noise(x/ampl, y/ampl, z)*elevation);
      vertex((x+1)*w, (y)*h, noise((x+1)/ampl, y/ampl, z)*elevation);
      vertex((x+1)*w, (y+1)*h, noise((x+1)/ampl, (y+1)/ampl, z)*elevation);
      vertex((x)*w, (y+1)*h, noise(x/ampl, (y+1)/ampl, z)*elevation);
      endShape();
    }
  }
  z+=0.05;
  theta+=increment;
}



