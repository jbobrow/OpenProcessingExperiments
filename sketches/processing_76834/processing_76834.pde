
import traer.physics.*;

Particle [] ParticleSystem = new Particle [20];


void setup() {
  size(600, 600);
  background(0);
  smooth();
  for (int i=0; i<20; i++) {
    ParticleSystem[i]= new Particle (mouseX, mouseY);
  }
}

void draw () {
  //background(100, 200, 255);
  // for (int i=0; i<20; i++) {
  //ParticleSystem[i].run();
}

void mousePressed() {
  for (int i=0; i<20; i++) {
    ParticleSystem[i].run();
  }
}

class Particle {
  float x;
  float y;
  float speedX=2;
  float speedY= 8;

  Particle (float _x, float _y) {
    x=_x;
    y=_y;
  }

  void run() {
    display();
    //speed();
    // bounce();
  }
  void display() {
    rect(mouseX, mouseY, 20, 20);
  }


  }




