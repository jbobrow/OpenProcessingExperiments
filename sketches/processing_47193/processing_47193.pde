
import processing.opengl.*;

Halo halos[];
int r =200, dim = 5;
boolean pressed = false;

void setup() {
  size(600, 600, OPENGL);
  background(200, 100, 0);
  text("created by Christian Geick 2011", width-200, height-20);
  
  halos = new Halo[dim];
  
  for(int i=0; i<dim; i++) {
    halos[i] = new Halo((i*30)+120, i*3, random(360), random(360), random(5), random(5));
  }

}
void mousePressed() {
  pressed = true;
  for(int i=0; i<dim; i++) {
    halos[i] = new Halo((i*30)+120, i*2, random(360), random(360), random(5), random(5));
  }
}
void draw() {
  if (pressed) {
    background(75, 95, 109);
    smooth();
    translate(width/2, height/2);
    rotateX(radians(frameCount/2));
    rotateY(radians(frameCount/3));
    sphereDetail(15);
    sphere(70);
    for(int i=0; i<halos.length; i++) {
      if(halos[i] != null) {
        halos[i].move();
        halos[i].paint();
      }
    }
  }
}

class Halo {

  int r, h;
  float phi, theta, dp, dt;

  Halo(int ra, int he, float p, float t, float d1, float d2) {
    r = ra;
    h = he;
    phi = p;
    theta = t;
    dp = d1;
    dt = d2;
  }

  void paint() {
    fill(254, 180, 28);
    stroke(245, 170, 20);
    strokeWeight(2);
    
    float x, y, z;
    pushMatrix();
    rotateX(radians(phi));
    rotateZ(radians(theta));
    beginShape(TRIANGLE_STRIP);
    for (int phi=0; phi<=365; phi+=5) {
      x = cos(radians(phi))*r;
      y = h;
      z = sin(radians(phi))*r;
      vertex(x, y, z);
      h = -h;
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void move() {
    phi += +dp;
    theta += dt;
  }
}


