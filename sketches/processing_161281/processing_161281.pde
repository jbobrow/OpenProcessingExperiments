
// ##############################################################   //
//                                                                  //                                                                       
// ---------  |\    |        Universidad Industrial de Santander    // 
//     |      | \   |              Ing. Electrónica                 //
//     |      |  \  |         Autor: Jesús D. Bonilla Neira         // 
//     |      |   \ |            7 - 07 - 2014 ( 1.0 )              //
// ____|    . |    \|.               Juego de Pong                  // 
//                                                                  //
// ##############################################################   //

/**  Este juego está basado en el clásico juego de los años 70 de Acarde 
   consiste en derrotar al oponente por mayor puntuación. Se desarrollo en el marco de la 
   materia de programación en C y C++. Juego basado en una interfaz processing-arduino.
   Referencias:
   *http://processing.org/reference/   
   *http://arduino.cc/
   *http://www.cplusplus.com/
   *http://docs.oracle.com/javase/7/docs/api/java/lang/ref/Reference.html
*/

// se importa la libreria del processing para arduino, cargando antes el firmata en la placa de arduino.
import processing.serial.*;  
import cc.arduino.*;

Arduino arduino;

// ----  variables para posición esfera.

int posx=250;
int posy=250;

// --- variables para color esfera.
int esfr = 255;
int esfg = 255;
int esfb = 255;

int a=0;

// ------ variables para las barras.

float arriba=250;
float abajo=250;

// ------ variables para los movimientos
int mov=1;
int act1=7;
int act2=5;

// ------- variables potenciometros 
int pin1 =1;
int pin2 =2;
int lec1;
int lec2;


void setup() {
  size(500, 500); // el tamañode la pantalla donde se mostrará el juego.
  frameRate(10);  // una velocidad de juego que marcará junto con los movimientos de la pelota.

  arduino = new Arduino(this, Arduino.list()[0], 57600);  // reconocimiento de la conexión de la placa de arduino

/* Reconocimiento de los potenciometros para que los jugadores manejen las barras, respectivamente
Los pines son analógicos y se hará reconocimiento para mostrar variaciones ( se utiliazron potenciometros de 10K)
*/
  arduino.pinMode( 1, Arduino.INPUT);   // Potenciometro 1 -- Jugador 1
  arduino.pinMode( 2, Arduino.INPUT);   // Potenciometro 2 -- Jugador 2
}
void draw() {

  // -----------lectura de los potenciometros -------
  lec1= arduino.analogRead (pin1);   
  lec2= arduino.analogRead (pin2);
// se imprime lo que las variables de lectura del potenciometro nos de 0 a 1024 
  print (lec1);
  print (" ");
  println (lec2); 

// Dibujamos el campo de juego
  background (40, 30, 40);
  fill(255, 255, 255);
  rect (0, 250, 500, 500);

// Dibujamos la esfera y su relleno se dará en función de las variables 
//para que cambie de color según el campo en el que esté
  fill(esfr, esfg, esfb);
  ellipse(posx, posy, 20, 20);

// Barra primer jugador
  fill(255, 255, 255);  
  rect(arriba, 0, 100, 20);

  // Barra segundo jugador
  fill(40, 30, 40);  
  rect(abajo, 480, 100, 20);

// cambio de color en la esfera
  if (posy>250) {
    esfr=40;
    esfg=30;
    esfb=40;
  } else {
    esfr=255;
    esfg=255;
    esfb=255;
  }

//  ---- límites para las barras --- 
  if (arriba>=690) {
    arriba=700;
  }
  if (arriba<=0) {
    arriba=0;
  }
  if (abajo>=410) {
    abajo=420;
  }
  if (abajo<=0) {
    abajo=0;
  }

 
  // --------------------- movimientos  de la esfera ----
  if (mov==1) {
    posx=posx+act2;
    posy=posy+act1;
  }
  if (mov==2) {
    posx=posx-act2;
    posy=posy+act1;
  }
  if (mov==3) {
    posx=posx+act2;
    posy=posy-act1;
  }
  if (mov==4) {
    posx=posx-act2;
    posy=posy-act1;
  }
 if (posy<=20 || posy>=480){
   a=a+1;
 }

// --- marcación del punto para cada jugador --- 
  if (posy<20) {

    fill (240, 80, 150);
    textSize(40);
    textAlign(CENTER);
    text("¡PUNTO!", 190, 400);
  }

  if (posy>480) {
    fill (200, 60, 10);
    textSize(40);
    textAlign(CENTER);
    text("¡PUNTO!" , 190, 100);
  }
  
// movimientos de la esfera para rebotes en los limites
 if (posy>=470 && posy<=480 && posx>=abajo && posx<=abajo+80 ) {
    act1=act1*-1;
  }

  if (posy<=30 && posy>=10 && posx>=arriba && posx<=arriba+80 ) {
    act1=act1*-1;
  }

  if (posx>=500||posx<=0) {
    act2=-1*act2;
  }
  if (posy>=500|| posy<=0) {
    posx=240;
    posy=240;
  }

// arreglo de los potenciometros para poder transformar su madición en una ubicación en la pantalla
  arriba=lec2/2.5 ;
  abajo= lec1/2.5 ;
}



