
//DECLARACIÓN DE LAS VARIABLES Y LAS MATRICES

int numbolas = 100;
color[] colorbolas= new color[numbolas] ;

//creamos cuatro matrices con numbolas elementos
float[] posicionesX = new float[numbolas];
float[] posicionesY = new float[numbolas];
float[] velocidadesX = new float[numbolas];
float[] velocidadesY = new float[numbolas];
float[] sz =new float[numbolas];
 
 
void setup() {
  size(600, 400);
  //INICIALIZAMOS POSICIONES DE X E Y Y SUS VELOCIDADES
  for (int i = 0; i<numbolas; i++) {
    posicionesX[i] = random(0,(width-1)-(sz[i]/2));
    posicionesY[i] = random(0,(height-1)-(sz[i]/2));
    velocidadesX[i] = random(1, 3);
    velocidadesY[i] = random(1, 3);
    colorbolas[i]= color (random(50),random(200),random(255));
    sz[i]= random(10,20);
  }
}
 
void draw() {
  
  fill(255,255,255,10);
  rect(0,0,width,height);
 
  //dibujamos todas las bolas por una función
  dibujabolas();
 
}
 
 
void dibujabolas() {
  noStroke();
  //fill(random(255),random(255),random(255));
 
  //iniciamos un bucle para actualizar todos los elementos de las matrices
  for (int i = 0; i<numbolas; i++) {
    //ACTUALIZAMOS
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];
 //actualizamos posiciones
    //limites X
    if ((posicionesX[i]<0+sz[i]/2)||(posicionesX[i]>width-sz[i]/2)) {
      velocidadesX[i] = -velocidadesX[i];
    }
    //limites Y
    if ((posicionesY[i]<0+sz[i]/2)||(posicionesY[i]>height-sz[i]/2)) {
      velocidadesY[i] = -velocidadesY[i];
    }
   
 
    //dibujo de círculos:
    fill(colorbolas[i]);
    ellipse(posicionesX[i], posicionesY[i], sz[i], sz[i]);
  }
}



