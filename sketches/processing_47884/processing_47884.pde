
/*BAsado en sketch de  joan soler-adillon 
 */

int sz = 40;
int numeroBolas = 1000;
float[] posicionesX = new float[numeroBolas];
float[] posicionesY = new float[numeroBolas];
float[] velocidadesX = new float[numeroBolas];
float[] velocidadesY = new float[numeroBolas];

void setup(){
   background(0);
       size(400,400);
    smooth();
  for(int i = 0; i<numeroBolas; i++){
    posicionesX[i] = width/32;
    posicionesY[i] = height/4;
    velocidadesX[i] = random(1,6);
    velocidadesY[i] = random(1,6);
  }
}

void draw(){
  
  for(int i = 0; i<numeroBolas; i++){
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];
   if((posicionesX[i]<0)||(posicionesX[i]>width)){
      velocidadesX[i] = -velocidadesX[i];
    } 
      if((posicionesY[i]<0)||(posicionesY[i]>height)){
      velocidadesY[i] = -velocidadesY[i];
    } 
  }
  for(int i = 0; i<numeroBolas; i++){
    ellipse(posicionesX[i],posicionesY[i],sz,sz);
    stroke (4);
  }
}


        
