
//Ramiro Plano - Ilusión óptica

int cantidad = 10;
int tamDefault = 40;
int presion, tamE, tamC, giro;

void setup() {
  size(400, 400);
  smooth();
  background(0);
  rectMode(CENTER);
}

void draw() {
  if (presion>=1) {
    for (int i=0;i<cantidad;i++) {
      for (int j=0;j<cantidad;j++) {
        fill(255);
        ellipse(i*tamDefault+tamDefault/2, j*tamDefault+tamDefault/2, tamE, tamE);
      }
    }
    if (tamE<tamDefault) {
      tamE++;
    }
  }
  if (presion>=2) {
    for (int i=0;i<cantidad;i++) {
      for (int j=0;j<cantidad;j++) {
        fill(0);
        rectangulo(i*tamDefault+tamDefault/2, j*tamDefault+tamDefault/2, tamC, giro);
        giro--;
      }
    }
    if (tamC<tamDefault-10) {
      tamC++;
    }
  }
}

void mousePressed() {
  presion++;
}

void keyPressed() {
  if(key == 'f' || key == 'F') {
    saveFrame("RPopArt####.jpg");
  }
}

void rectangulo(int x, int y, int tam, int ang) {
  pushMatrix();
  translate(x, y);
  rotate(radians(ang));
  rect(0, 0, tam, tam);
  popMatrix();
}               
