
//EJERCICIO QUE CONSISTE EN EL MOVIMIENTO ALEATORIO DE DIFERENTES FIGURAS A LO LARGO DE TODA LA PANTALLA 
//A LA VEZ QUE HACEN UN RANDONWALKER (VIBRAN). ADEMÁS CON EL CLICK DEL MOUSSE LOS OJOS DEL MUÑECO AUMENTAN
//HASTA UN DETERMINADO VALOR QUE HACEN QUE RETORNEN A SU MEDIDA INICIAL. Y TAMBIEN HACEMOS QUE EL COLOR DEL 
//BORDE EXTERIOR DE CADA RATON SEA DE UN COLOR DIFERENTE.

//Con una matriz podemos obtener muchos ratoncillos diferentes

int numRatones=10;
int i;

//Definimos a y b para que en un futuro con la función mousePressed el tamaño de los ojos de los 
//ratones vaya aumentando hasta un valor determinado.
int a=20;
int b=8;



//Creamos una matriz de posiciones y velocidades con "numRatones" elementos:

float[] posicionesX= new float [numRatones];
float[] posicionesY= new float [numRatones];
color[] colorRatones=new color [numRatones]; //CADA CONTORNO DE UN COLOR


void setup(){
   size(600,600);
  
//Inicializamos posiciones y velocidades
for(int i=0;i<numRatones;i++){
  posicionesX[i]=(posicionesX[i]+width/2)+(int)random(-5,5); //COMIENZA EN EL CENTRO
  posicionesY[i]=(posicionesY[i]+height/2)+(int)random(-5,5); //COMIENZA EN EL CENTRO
  colorRatones[i]=color(random(230),random(230),random(230));
  }
}

void draw (){
  background(100,posicionesX[i],posicionesY[i]); //EL COLOR DEL FONDO VARIA ALEATORIAMENTE EN FUNCION DE LA POSICION
  //X E Y DE UNO DE LOS MUÑEQUITOS.


//INICIAMOS UN BUCLE PARA QUE HAGA LAS MISMAS ACCIONES EN TODOS LOS 
//VALORES DE LA MATRIZ

for(int i=0; i<numRatones; i++){
  //ACTUALIZAMOS POSICIONES
  posicionesX[i]+=random(-5,5);
  posicionesY[i]+=random(-5,5);
 
  
  //ESTABLECEMOS LOS LIMITES EN X, DE FORMA QUE CUANDO LLEGUE A UN BORDE NO SE VAYA DE LA PANTALLA
  if(posicionesX[i]-60<0){
    posicionesX[i]=60;
  }
  
  if(posicionesX[i]+60>width){
    posicionesX[i]=width-60;
  }
  
  //ESTABLECEMOS LOS LIMITES EN Y, DE FORMA QUE CUANDO LLEGUE A UN BORDE NO SE VAYA DE LA PANTALLA
  if(posicionesY[i]-60<0){
    posicionesY[i]=60;
  }
  if(posicionesY[i]+60>height){
    posicionesY[i]=height-60;
  } 

//DIBUJAMOS

//CIRUCLO BORDE
fill(colorRatones[i]);
noStroke();
ellipse(posicionesX[i],posicionesY[i],120,120);

//OREJAS
  //EXTERIOR
  fill (149,119,119);
    //IZQUIERDA
rect(posicionesX[i]-35,posicionesY[i]-45,30,30,5);
    //DERECHA
rect(posicionesX[i]+5,posicionesY[i]-45,30,30,5);
  //INTERIOR
  fill(216,203,203);
    //IZQUIERDA
rect(posicionesX[i]-30,posicionesY[i]-40,20,20,10);
    //DERECHA
rect(posicionesX[i]+10,posicionesY[i]-40,20,20,10);

//CARA
fill (196,180,180);
beginShape ();
vertex(posicionesX[i]-25,posicionesY[i]-25);
vertex(posicionesX[i]+25,posicionesY[i]-25);
vertex(posicionesX[i]+15,posicionesY[i]+50);
vertex(posicionesX[i]-15,posicionesY[i]+50);
vertex (posicionesX[i]-25,posicionesY[i]-25);
endShape();

//BIGOTE
stroke(149,119,119);
strokeWeight (3);
//IZQUIERDO
line(posicionesX[i]-35,posicionesY[i]+30,posicionesX[i]-15,posicionesY[i]+30);
line(posicionesX[i]-35,posicionesY[i]+40,posicionesX[i]-15,posicionesY[i]+40);
  //DERECHO
line(posicionesX[i]+15,posicionesY[i]+30,posicionesX[i]+35,posicionesY[i]+30);
line(posicionesX[i]+15,posicionesY[i]+40,posicionesX[i]+35,posicionesY[i]+40);

//OJOS
strokeWeight (1);
  //EXTERIORES
  fill(255);
    //IZQUIERDO
ellipse (posicionesX[i]-20,posicionesY[i],a,a);
    //DERECHO
ellipse(posicionesX[i]+20,posicionesY[i],a,a);
  //INTERIORES
  fill(0);
   //IZQUIERDO
ellipse (posicionesX[i]-20,posicionesY[i],b,b);
    //DERECHO
ellipse (posicionesX[i]+20,posicionesY[i],b,b);

//NARIZ
fill (149,119,119);
rect (posicionesX[i]-5,posicionesY[i]+45,10,10,2);

}

}


//A CONTINUACION CON LA FUNCION DE MOUSEPRESSED HAREMOS QUE EL TAMAÑO DE LOS OJOS VAYA AUMENTANDO
void mousePressed(){
    if(a<40){
      a=a+4;
    }
    if(b<16){
      b=b+4;
    }
    if(a>=40){
      a=20;
      b=8;
    }
  
}
  





