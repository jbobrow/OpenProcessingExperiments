

// Autor: Köhn.Federico.Lucas // daemonfk@gmail.com //
// Objetivo: Animar tres círculos de acuerdo al movimiento del mouse.


///////////////////////////////////////////////////////////////////////////////////////
// FUNCIÓNES.DEL.PROGRAMA_PDE:


/*

 Objetivo-Busqueda:
 
 **Manipular circulos con el mouse, "arrastrando y dejando en la posición..." que el usuario desee.
 
 **De acuerdo a distancia o proximidad* entre nodos, agrandar o achicar circulos-Nodos
 
 **De a la distancia entre 2nodos pivotantes enlazados-comunes a 1 nodo, se mide para afectar un comportamiento de entorno.
 
 **Se apunta a mezclar resultantes y dar un ambiente generado por nodos manipulables.
 
 */


///////////////////////////////////////////////////////////////////////////////////////
// VARIABLES GLOBALES:


// DECLARACIÓN DE VARIABLES DINAMICO-MANIPULATIVAS:

float xM = mouseX;
float yM = mouseY;

// DECLARACIÓN DE VARIABLES FIJAS INCREMENTALES:
//Puntos en el plano:
float xaa = 0.0;
float yaa = 0.0;

float xbb = 0.0;
float ybb = 0.0;

float xcc = 0.0;
float ycc = 0.0;

int dir01 = 0; //Direccion en "aa".
int dir02 = 0; //Direccion en "aa".
int dir03 = 0; //Direccion en "aa".

///////////////////////////////////////////////////////////////////////////////////////
// SETEO DEL PROGRAMA:


int Xsize = 600;
int Ysize = Xsize;
//Ampliar en busqueda de formato aleatorio de visor...

//Factor de tamaño para escalado de objetos en escena:
int XYsize = (Xsize + Ysize)/2;
//println (XYsize); 


void setup() {

  size (Xsize, Ysize); // muestreo visor "RUN" (Ctrl + R) en pixels de resolución.

  background (200, 0, 0, 0); // Syntaxis: background (RED, GREEN, BLUE, ALPHA).

  smooth (); // Activa Antialias.
}

///////////////////////////////////////////////////////////////////////////////////////
// DIBUJO-BUCLE DEL PROGRAMA:


// Correción de signo negativo en Diferencia entre puntos de "a":


void draw () {
  frameRate (30);

  //Declaración de funcionamiento de variables:
  xM = mouseX; // Posición de mouse en X, con coef. de escalacmiento.
  yM = mouseY; // Posición de mouse en Y, con coef. de escalacmiento.

  //CirculoA de Gran incremento: 
  if ((xaa <= 0) || (yaa <= 0)) {  //Rango de accion de la variable xaa.
    dir01 = 1;
  } 
  if ((xaa >= Xsize) || (yaa >= Xsize)) {
    dir01 = -1;
  }

  //CirculoB, de mediano incremento:
  if ((xbb <= 0) || (ybb <= 0)) {  //Rango de accion de la variable xaa.
    dir02 = 1;
  } 
  if ((xbb >= Xsize) || (ybb >= Xsize)) {  //Rango de accion de la variable xaa.
    dir02 = -1;
  }

  //CirculoC, de pequeño incremento:
  if ((xcc <= 0) || (ycc <= 0)) {  //Rango de accion de la variable xaa.
    dir03 = 1;
  }
  if ((xcc >= Xsize) || (ycc >= Xsize)) {  //Rango de accion de la variable xaa.
    dir03 = -1;
  }



  xaa = xaa + (xM*0.005)*dir01; // Incremental de pto.OrigenX de Circulo "A", afectado por posición de mouse. 
  yaa = yaa + (yM*0.005)*dir01; // Incremental de pto.OrigenY de Circulo "A", afectado por posición de mouse.

  xbb = xbb + (xM*0.005)*dir02;
  ybb = ybb + (yM*0.005)*dir02;

  xcc = xcc + (xM*0.007)*dir03;
  ycc = ycc + (yM*0.007)*dir03;




  ////////////////////////////////////////////////////////// GEOMETRÌAS:



  // Para nodo (Circulo de gran incremento) "A":
  strokeWeight (5); // Ancho del trazo en pixeles
  stroke (0, 0, 0, 255); // Syntaxis: fill (val-RED, val-GREEN, val-BLUE, ALPHA).
  fill (255, 255, 255, 255); // Syntaxis: fill (val-RED, val-GREEN, val-BLUE, ALPHA).
  ellipseMode (CENTER);
  ellipse (xM, yM, xaa, yaa); // Syntaxis: ellipse(x, y, width, height). Ver como hacer Promedio para Width y Height variable...



  // Para nodo (Mediano sin crecimiento) "B" :
  strokeWeight (5); // Ancho del trazo en pixeles
  stroke (0, 0, 0, 255); // Syntaxis: fill (val-RED, val-GREEN, val-BLUE, ALPHA).
  fill (255, 255, 255, 255); // Syntaxis: fill (val-RED, val-GREEN, val-BLUE, ALPHA).
  ellipseMode (CENTER);
  ellipse (xbb, ybb, 50, 50); // Syntaxis: ellipse(x, y, width, height). Ver como hacer Promedio para Width y Height variable...


  // Para nodo (Chiquito sin crecimiento) "C" :
  strokeWeight (5); // Ancho del trazo en pixeles
  stroke (0, 0, 0, 255); // Syntaxis: fill (val-RED, val-GREEN, val-BLUE, ALPHA).
  fill (255, 255, 255, 255); // Syntaxis: fill (val-RED, val-GREEN, val-BLUE, ALPHA).
  ellipseMode (CENTER);
  ellipse (xcc, ycc, 30, 30); // Syntaxis: ellipse(x, y, width, height). Ver como hacer Promedio para Width y Height variable...


  ////////////////////////////////////////////////////////// PRINTln():

  println (xaa + " -- " + xbb + " -- " + dir01 + " -- " + dir02 + " -- " + dir03 + " -- " + Xsize);


  // Cierre de void draw().
}



///////////////////////////////////////////////////////////////////////////////////////
// FIN.







