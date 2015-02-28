
//DECLARACIÓN DE LAS VARIABLES Y LAS MATRICES
int sz = 10;
int numbolas = 100;

//creamos cuatro matrices con numbolas elementos
float[] posicionesX = new float[numbolas];
float[] posicionesY = new float[numbolas];
float[] velocidadesX = new float[numbolas];
float[] velocidadesY = new float[numbolas];


void setup() {
  size(600, 400);
  //INICIALIZAMOS POSICIONES DE X E Y Y SUS VELOCIDADES 
  for (int i = 0; i<numbolas; i++) {
  //Inicializamos las X de las bolas en medio de la pantalla (width/2)
    posicionesX[i] = width/2;
  //Inicializamos las Y de las bolas en medio de la pantalla (height/2)  
    posicionesY[i] = height/2;
  // Determinamos las velocidades de las bolas en X e Y, con un valor aleatorio entre 1 y 3  
    velocidadesX[i] = random(1, 3);
    velocidadesY[i] = random(1, 3);
  }
}

void draw() {
  background(255);

  //dibujamos todas las bolas por una función
  dibujabolas();

}


void dibujabolas() {
  noStroke();
  fill(111,234,225);

  //iniciamos un bucle para actualizar todos los elementos de las matrices
  for (int i = 0; i<numbolas; i++) {
    //ACTUALIZAMOS 
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];
 //actualizamos posiciones
    //limites X
    if ((posicionesX[i]<0)||(posicionesX[i]>width)) {
      velocidadesX[i] = -velocidadesX[i];
    } 
    //limites Y
    if ((posicionesY[i]<0)||(posicionesY[i]>height)) {
      velocidadesY[i] = -velocidadesY[i];
    } 

    //dibujo de círculos:
    ellipse(posicionesX[i], posicionesY[i], sz, sz);
  }
}



