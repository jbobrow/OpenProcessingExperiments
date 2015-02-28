
/*

   Daniel Alejandro Bolívar
   07211011
   Proyecto 3: Fractales y Sucesión de Fibonacci
   
   Para ver análisis, referirse al documento "Análisis del Código" en la carpeta general del proyecto. 
   
 */

//Variables Globales

float distancia,h;
int xRotacion,wFib;
int contador;
boolean estado,colorUno,colorDos,colorTres;

void setup() {
  size(700,500);
  smooth();
  xRotacion=0;
  noStroke();
  background(0);
  estado=false;
  colorUno=false;
  colorDos=false;
  colorTres=true;
  wFib=7;
  contador=0;
  colorMode(HSB);
  frameRate(30); //Cambio el Frame Rate para generar una rotación más fluida.
}

void draw() {

  //Control para iniciar (que no inicie dibujandose la imagen)
  
  if(estado==true) {
    pushMatrix();
    translate(width/2,height/2); //Llevo el punto 0,0 al centro del lienzo
    rotate((radians(xRotacion*12))); //Genero una rotación

    //Controles de velocidad de aumento de Fibonacci (y por tanto del cambio de color)

    if(colorUno==true) {
      h=fibonacci(wFib);
    }
    else {
      if(colorDos==true) {
        h=(fibonacci(wFib))/1.2;
      }
      else {
        if(colorTres==true) {
          h=(fibonacci(wFib))*1.5;
        }
      }
    }

    fill(h,100,100,180); 
    ellipse(0+(distancia),0,(distancia/5),(distancia/5));

    contador++; //Control al aumento de la sucesión de Fibonacci. 

    if(contador>=30) {
      wFib++;
      contador=0;
    }

    xRotacion++; 
    popMatrix();

    if(distancia>width) { //Limito el valor de la distancia (para no generar elipses demasiado grandes. 
      distancia=width;
    }
    if(wFib>13) {
      wFib=7;
    }
  }
}






void mouseMoved() {
  distancia= dist(width/2,height/2,mouseX,mouseY); //Defino la distancia cada que muevo el mouse.
}


void mouseReleased() { 

  //Controles para el estado de los colores. 

  estado=true;
  if(colorUno==true) {
    colorUno=false;
    colorDos=true;
  }
  else {

    if(colorDos==true) {
      colorDos=false;
      colorTres=true;
    } 
    else {


      if(colorTres==true) {
        colorTres=false;
        colorUno=true;
      }
    }
  }
}

void keyPressed() {
  background(0); //Limpio el lienzo al presionar una tecla
}

//Metodo para calcular el valor de la sucesión de Fibonacci

int fibonacci(int n) {
  if ( n <= 1 ) {
    return 1;
  } 
  else {
    int answer = fibonacci(n-1) + fibonacci(n-2);
    return answer;
  }
}


