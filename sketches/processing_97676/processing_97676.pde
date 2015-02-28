

int mida = 20;
int numeroMarcians = 20;
float h = random(0, 50);



float[] posicionesX = new float[numeroMarcians];


float[] posicionesY = new float[numeroMarcians];


float[] VelX = new float[numeroMarcians];

float[] VelY = new float[numeroMarcians];





void setup() {
  size(500, 500);

  for (int i = 0; i<numeroMarcians; i++) {
    posicionesX[i] = width/2;
    posicionesY[i] = height/2;
    VelX[i] = random(1,4);
    VelY[i] = random(1, 4);
    
   
  }
}

void draw() {
   background(0);
 for (int j=0; j<700; j++) {
  float posX = random(width);
  float posY = random(height);
  float tamano = random (4);

  fill(h, 159, 242);
  ellipse(posX, posY, tamano, tamano);
  h = (h + 1) % 360;
}

  for (int i = 0; i<numeroMarcians; i++) {
    //actualitzamos las posiciones
    posicionesX[i] += VelX[i];
    posicionesY[i] += VelY[i];


    if ((posicionesX[i]<10)||(posicionesX[i]>width-10)) {
      VelX[i] = -VelX[i];
    } 

    if ((posicionesY[i]<10)||(posicionesY[i]>height-10)) {
      VelY[i] = -VelY[i];
    }
  }


  for (int i = 0; i<numeroMarcians; i++) {
    fill(37, 255, 23);
    ellipse(posicionesX[i], posicionesY[i], mida, mida);
    
    fill(255);
    ellipse(posicionesX[i]-5, posicionesY[i]-5, 10, 10);
    ellipse(posicionesX[i]+5, posicionesY[i]-5, 10, 10);
    fill(0);
    ellipse(posicionesX[i]-5, posicionesY[i]-5, 5, 5);
    ellipse(posicionesX[i]+5, posicionesY[i]-5, 5, 5);
   
    
  }
}



