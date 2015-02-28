
int wNumber;
int hNumber;
Particle[][] particle;

void setup() {
  size(700, 400);
  int partSize = 10;
  wNumber=width/partSize;
  hNumber=height/partSize;
  particle = new Particle[wNumber][hNumber];
  for (int i=0; i < wNumber; i++) {
    for (int j=0; j < hNumber; j++) {
      particle[i][j] = new Particle(i*partSize, j*partSize, partSize);
    }
  }
}

void draw() {
  for (int i=0; i < wNumber; i++) {
    for (int j=0; j < hNumber; j++) {
      particle[i][j].draw();
    }
  }
}


