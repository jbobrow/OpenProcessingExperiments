
int sz = 2;
int numeroBolas = 2000;
int numeroLineas = 100;
//int timer;

//creamos un array de posicionesX con "numeroBolas" elementos:
float[] posicionesX = new float[numeroBolas];
//y creamos un array de posicionesY:
float[] posicionesY = new float[numeroBolas];
//creamos un array de velocidadesX con "numeroBolas" elementos:
float[] velocidadesX = new float[numeroBolas];
//y creamos un array de velocidadesY:
float[] velocidadesY = new float[numeroBolas];

void setup(){
  
  size(300,200);
  //inicializamos las posiciones y velocidades:
  for(int i = 0; i<numeroBolas; i++){
    posicionesX[i] = width/2;
    posicionesY[i] = height/2;
    velocidadesX[i] = random(1,5);
    velocidadesY[i] = random(1,5);
  }
}

void draw(){

    float rnd = random(0,height);
  stroke(random(0,255));
  strokeWeight(random(0,50));
  for(int i=0; i<numeroLineas; i++){
  line(0, rnd, width, rnd);}
  
  noStroke();
  rect(0,0,width,height,30);
  int m = millis();
  fill(m % 255, m % 255);

  //iniciamos un bucle para que realize la acciï¿½n para todos los
  //elementos del array:
  for(int i = 0; i<numeroBolas; i++){
    //actualitzamos las posiciones
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];

    //comprobamos los bordes X
    if((posicionesX[i]<0)||(posicionesX[i]>width)){
      velocidadesX[i] = -velocidadesX[i];
    } 
    //comprobamos los bordes Y
    if((posicionesY[i]<0)||(posicionesY[i]>height)){
      velocidadesY[i] = -velocidadesY[i];
    } 
  }

  //acabado el proceso, creamos otro bucle
  //donde dibujamos las elipses:
  for(int i = 0; i<numeroBolas; i++){
    ellipse(posicionesX[i],posicionesY[i],sz,sz); 
  }
  println(second());



}



