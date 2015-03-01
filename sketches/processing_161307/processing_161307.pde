
// ############################################################## //
//                                                                //                                                                       
// ---------  |\    |        Universidad Industrial de Santander  // 
//     |      | \   |              Ing. ElectrÃ³nica               //
//     |      |  \  |         Autor: JesÃºs D. Bonilla Neira       // 
//     |      |   \ |            7 - 07 - 2014 ( 1.0 )            //
// ____|    . |    \|.          Potenciometros en Processing      // 
//                                                                //
// ############################################################## //

/* Programa de interfaz Processing-Arduino para lectura de potenciometro 
  desde en la placa de arduino y que imprima en el software processing.
  Referencias:
  *http://processing.org/
  *http://playground.arduino.cc/interfacing/processing
  *http://arduino.cc/en/Reference/HomePage
*/

// Se importa la librerÃ­a para la interfaz processing-arduino cargando el FIRMATA

import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

// variables para los pines de los potenciometros
int pin1 =1;
int pin2 =2;
int lec1;
int lec2;

void setup() {
  size (100,100); // tamaÃ±o de la pantalla.
 
  arduino = new Arduino(this, Arduino.list()[0], 57600); // reconocimiento de la placa de arduino
  
  // pines para reconocimento de los potenciometros
  arduino.pinMode( 1, Arduino.INPUT);
  arduino.pinMode( 2, Arduino.INPUT);
}

void loop () {
  
 // variables que leen y guardan las mediciones del potenciometro
  lec1= arduino.analogRead (pin1);
  lec2= arduino.analogRead (pin2);
  
  // impresiÃ³n de los valores del potenciometro.
  println (lec1);
  println (" ");
  println (lec2);
}  





