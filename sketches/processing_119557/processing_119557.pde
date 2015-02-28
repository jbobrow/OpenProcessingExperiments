
/** Capacitor
Daniel Posada
Antonio Chavez
**/

import controlP5.*;
ControlP5 controlP5;
 
/* --------------------Valores iniciales------------------------ */

public int v = 12;
public int t = 1; 
public int r = 15;
public int c = 161;
public int vcc = 20;
 

void setup() {
  size(600,600);
   
/* -------nuevo valor ControlP5----- */
  controlP5 = new ControlP5(this);
   
/* -----Controladores con su id----- */
  controlP5.addSlider("Voltaje [-+120]",-120,120,v,85,110,10,100).setId(1);
  controlP5.addKnob("Tiempo [0/199]",0,199,t,170,5,50).setId(2);
  controlP5.addSlider("Recistencia [0/199]",0,199,r,125,269,100,10).setId(3);
  controlP5.addSlider("Capacitancia [0/199]",0,199,c,290,162,100,10).setId(4);
  controlP5.addSlider("Voltaje C [0/199]",0,199,vcc,290,182,100,10).setId(5);
}
  
void draw() {

//---------------------Variables de la formula------------------------//
  float vf=v*pow(10,0);
  float tf=t*pow(10,-6);
  float rf=r*pow(10,3);
  float cf=c*pow(10,-12);
  float vccf=vcc*pow(10,1);
  
//---------------------Formulas------------------------//
 float TAO=rf*cf;
 float voltajecapacitor =(vf*(1-exp(-tf/TAO))); 
  
//-----------variables interactivas de colores--------------------//
  float cb=sqrt(v*v)+130;
  float cr=r+56;
  float cc=c+56;
  float cc2=vcc/5;
  
  
//Diagrama//
   background(0);
   strokeWeight(30);
      textSize(20);
      stroke(255);
      fill(200,250,255);
      text("Voltaje del capacitor= "+voltajecapacitor+" v",50,400); 
      
//+++++++Comprobacion de valores+++++++//
textSize(9);
      text("Voltaje "+vf,10,500); 
      text("Tiempo "+tf,10,510);
      text("Resistencia "+rf,10,520);
      text("Capacitancia "+cf,10,530);
      text("Voltaje en c "+vccf,10,540);
      text("TAO "+TAO,10,550);
      
// Circuito
  stroke(255, 255, 255);
  fill(255, 255, 255);
  strokeWeight(4);
//SUPERIR
  line(50,50,350,50);
//INFERIOR
  line(50,300,165,300);
  line(231,300,350,300);
//IZQUIERDA
  line(50,50,50,135);
  line(50,205,50,300);
//DERECHA
  line(350,50,350,150);
  line(350,200,350,300);
//BATERIA
  stroke(cb,0,0);
  line(40,138,59,138);
  line(24,165,74,165);
  line(24,204,74,204);
  line(40,185,59,185);
//CAPACITOR
  stroke(0,cc,vcc);
  line(330,200,370,200);
  line(330,151,370,151);
//RESISTENCIA
  stroke(0,0,cr);
  line(167,300,178,282);
  line(188,318,178,282);
  line(188,318,200,282);
  line(209,318,200,282);
  line(209,318,221,282);
  line(231,300,222,282);

}
 
void controlEvent(ControlEvent theEvent) {
/* Eventos activados por los controladores se reenvían automáticamente a
      el método ControlEvent, marcando el ID de un controlador se puede distinguir
      cuál de los controladores ha sido cambiado. */
      
  switch(theEvent.controller().id()) {
    case(1):
    /* Controlador con  id 1 */
    v = (int)(theEvent.controller().value());
    break;
    case(2):
    /* Controlador con id 2 */
    t = (int)(theEvent.controller().value());
    break;
   case(3):
    /* Controlador con id 3 */
    r = (int)(theEvent.controller().value());
    break; 
   case(4):
    /* Controlador con id 4 */
    c = (int)(theEvent.controller().value());
    break; 
   case(5):
    /* Controlador con id 5 */
    vcc = (int)(theEvent.controller().value());
    break;  
  }
}
