
int mida = 20;
int numeroMarcians = 10;
float[] posicionesX = new float[numeroMarcians]; 
float[] posicionesY = new float[numeroMarcians]; 
float[] VelX = new float[numeroMarcians]; 
float[] VelY = new float[numeroMarcians];
float posX = random(width);
float posY = random(height);
float tamano = random (4);



void setup() {
  size(500, 500);
  

  for (int i = 0; i < numeroMarcians; i++) {
    posicionesX[i] = width/2;
    posicionesY[i] = height/2;
    VelX[i] = random(1, 4);
    VelY[i] = random(1, 4);
  }
}
void draw() {
  dibuixa_fons () ;
  for (int i=0; i < numeroMarcians; i++){
     fill(4, 159, 242);
    ellipse(posX, posY, tamano, tamano);
posiciona_elements(posicionesX[i], posicionesY[i]);
actualitza_posicions(i);
}
}

void dibuixa_fons() {
  posiciona_elements(posX[i], posY[i],tamano,tamano);
actualitza_posicions(i);
  background(0);
  for (int i=0; i<height; i=i+35) {
    fill(4, 159, 242);
    ellipse(posX, posY, tamano, tamano);

  }
    for (int k = 0; k<numeroMarcians; k++) {
      fill(37, 255, 23);
      ellipse(posicionesX[k], posicionesY[k], mida, mida);
      fill(255);
      ellipse(posicionesX[k]-5, posicionesY[k]-5, 10, 10);
      ellipse(posicionesX[k]+5, posicionesY[k]-5, 10, 10);
      fill(0);
      ellipse(posicionesX[k]-5, posicionesY[k]-5, 5, 5);
      ellipse(posicionesX[k]+5, posicionesY[k]-5, 5, 5);
    }
  }

void posiciona_elements(float posX, float posY, float tamano) {
}

void actualitza_posicions(int i) {


  for (int i = 0; i<numeroMarcians; i++) {

    posicionesX[i] += VelX[i];
    posicionesY[i] += VelY[i];


    if ((posicionesX[i]<10)||(posicionesX[i]>width-10)) {
      VelX[i] = -VelX[i];
    }

    if ((posicionesY[i]<10)||(posicionesY[i]>height-10)) {
      VelY[i] = -VelY[i];
    }
  }
}



