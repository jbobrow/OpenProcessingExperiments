
int sz = 20;
int numeroCubos = 100;

float[] posicionesX = new float[numeroCubos];
float[] posicionesY = new float[numeroCubos];
float[] velocidadesX = new float[numeroCubos];
float[] velocidadesY = new float[numeroCubos];

void setup(){
  size(400,400);
  for(int i = 0; i<numeroCubos; i++){
    posicionesX[i] = width/2;
    posicionesY[i] = height/2;
    velocidadesX[i] = random(1,3);
    velocidadesY[i] = random(1,3);
  }
}

void draw(){
  background(0);
  
  for(int i = 0; i<numeroCubos; i++){
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];

    if((posicionesX[i]<0)||(posicionesX[i]>width)){
      velocidadesX[i] = -velocidadesX[i];
    } 
    if((posicionesY[i]<0)||(posicionesY[i]>height)){
      velocidadesY[i] = -velocidadesY[i];
    } 
  }

  for(int i = 0; i<numeroCubos; i++){
 fill (random(0,255),random(0,255),random(0,255));
    rect(posicionesX[i],posicionesY[i],sz*random(1,3),sz*random(1,3));
  }
}




