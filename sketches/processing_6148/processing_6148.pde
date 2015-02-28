
float rot;
int sz=20;
int radius=40;
int numeroBolas=20000;

//creamos una array de posiciones "x" y "y"con "numeroBolas" elementos
float[] posicionesX=new float[numeroBolas];
float[] posicionesY=new float[numeroBolas];
//creamos un array de velocidades "x" y "y" con "numeroBolas" elementos
float[] velocidadesX=new float[numeroBolas];
float[] velocidadesY= new float[numeroBolas];
float[] distanciaX=new float[numeroBolas];
float[] distanciaY=new float[numeroBolas];


void setup(){

  size(400,400,P3D);

  //colorMode(HSB,255);

  // inicializamos las posiciones y velocidades
  for(int i=0; i<numeroBolas; i++){
    posicionesX[i]=random(width);
    posicionesY[i]=random(height);
    velocidadesX[i]=random(1.6);
    velocidadesY[i]=random(0.001);
    distanciaX[i]=random(0.001);
    distanciaY[i]=random(0.01);


  }

}

void draw(){
  background(0);
  //iniciamos un loop para que realize la accion para todos los elementos del array

  for(int i=0; i<numeroBolas; i++){
    //actualizamos las posiciones
    posicionesX[i]+=velocidadesX[i];
    posicionesY[i]+=velocidadesY[i];
    distanciaX[i]=dist(posicionesX[i],posicionesY[i], mouseX,mouseY);
    distanciaY[i]=dist(posicionesX[i],posicionesY[i],mouseX,mouseY);



    // calculamos la distancia y generamos una reaccion al array


    if(distanciaX[i]<posicionesX[i]){


      velocidadesX[i]=velocidadesX[i]-0.1;
      posicionesX[i]= posicionesX[i]-radians(radius);
      //rotate(radians(radius/50));
    }

    if(distanciaY[i]<posicionesY[i]){

      //velocidadesY[i]=-radians(30);
      velocidadesY[i]=velocidadesY[i]-0.1;
      posicionesY[i]= posicionesY[i]-radians(radius);
      // rotate(radians(radius/50));
    }



    //comprobamos los bordes X
    if((posicionesX[i]<0) || (posicionesX[i]>width)){
      velocidadesX[i]=-  velocidadesX[i];
    }

    //comprobamos los bordes Y

    if((posicionesY[i]<0) || (posicionesY[i]>height)){
      velocidadesY[i]=-  velocidadesY[i];
    }




  }
  // acabado el processo creamos otro loop donde dibujamos las elipses
  for(int i=0; i<numeroBolas; i++){

    stroke(posicionesX[i],posicionesY[i],100);
    point(posicionesX[i],posicionesY[i]);    //con puntos se pueden usar mas de 20000 particulas//
    //noStroke();
    //ellipse(posicionesX[i],posicionesY[i],5,5);
  }
}









