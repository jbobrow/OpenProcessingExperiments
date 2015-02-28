
//Eva Díaz

//Sketch en el que aparecen multiples pelotas de basketball moviendose por la pantalla
//cumpliendo lo siguiente:
// su posición cambia la clic con el ratón y una de sus propiedades (el tamaño) cambia la clic.
//las pelotas se mueven rebotando el las paredes.
 

int sz = 60;// medida de las pelotas de basket
int numPelotas = 15;



//matriz de posicionesX con "numPelotas":
float[] posicionesX = new float[numPelotas];
//lo mismo para posicionesY:
float[] posicionesY = new float[numPelotas];
//y para velocidadesX:
float[] velocidadesX = new float[numPelotas];
//y velocidadesY:
float[] velocidadesY = new float[numPelotas];




//gracias a la siguiente fución cambiamos la direccion de las Pelotas de basket
void mousePressed(){
  //reinicializamos las velocidades:
  for(int i = 0; i<numPelotas; i++){
    velocidadesX[i] = random(2,10);
    velocidadesY[i] = random(2,10);
    }
   // cambiamos una de sus propiedades (el diametro) y luego volvemos al original
   if(sz<100){
     sz = sz+8;
   }
   if (sz>=100){
     sz = 60;
   }
}


void setup(){
  size(600,800);
  //inicializamos posiciones i velocidades:
  for(int i = 0; i<numPelotas; i++){
    posicionesX[i] = width/2;
    posicionesY[i] = height/2;
    velocidadesX[i] = random(1,5);
    velocidadesY[i] = random(1,5);
  }
}

void draw(){
  background(225);
  
  //bucle para que se hagan las mismas acciones
  //en totos los valores de las matrices
  for(int i = 0; i<numPelotas; i++){
    //actualizamos posiciones
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];

    // X
    if((posicionesX[i]<sz/2)||(posicionesX[i]>width-sz/2)){
      velocidadesX[i] = -velocidadesX[i];
    } 
    // Y
    if((posicionesY[i]<sz/2)||(posicionesY[i]>height-sz/2)){
      velocidadesY[i] = -velocidadesY[i];
    } 
  
  
  
   //Dibujo:

   fill(245,131,25);
   ellipse(posicionesX[i],posicionesY[i],sz,sz);
   strokeWeight(1.5);
   ellipse(posicionesX[i],posicionesY[i],sz-25,sz);
 
  fill(0);

  rect(posicionesX[i],posicionesY[i]-sz/2,sz/sz,sz);
  

 
  }
}





