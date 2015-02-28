

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
  background(255);

  for (int i=0; i < wNumber; i++) {
    for (int j=0; j < hNumber; j++) {
      particle[i][j].draw();
      if (mousePressed== true) {
        particle[i][j].moves(mouseX, mouseY, pmouseX, pmouseY);
      }
      else {
        particle[i][j].spring(i, j, wNumber, hNumber);
      }
    }
  }
}


void mouseReleased() {
  for (int i=0; i < wNumber; i++) {
    for (int j=0; j < hNumber; j++) {
      particle[i][j].speed();
      particle[i][j].direction();
    }
  }
}


