
//Drawing machine #14 0.1///Alejandro González///60rpm.tv///Dominio Púbico/////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//Esta es el primer prototipo de una herramienta de dibujo que intenta emular el trazo de un carboncillo.//
//Para conseguir ese efecto, he usado un enjambre de partículas que siguen al ratón,///////////////////////
//añadiendo un poco de ruido Perlin y un poco de azar, para darle organicidad al trazo.////////////////////
//Está pensada para ser usada con una tablet, por lo que reconoce la presión y por lo que se puede borrar//
//usando la goma del lápiz. ///////////////////////////////////////////////////////////////////////////////
//Otra interacción:                                                                                      //
// · 'e' para borrar la pantalla                                                                         //
// · 'h' para ocultar la ventana de control                                                              //
// · 'u' para mostrar la ventana de control                                                              //
//Parámetros:                                                                                            //
// · 'N': número de partículas                                                                           //
// · 'D': diámetro de distribución                                                                       //
// · 'F': factor de influencia del ruido (a mayor valor, un trazo más rudo)                              //
// · 'P': para ajustar la presión de la tableta                                                          //
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//This is a charcoal drawing machine, using a swarm of particles that act//////////////////////////////////
//as pencils. In order to emulate human pulse, I´ve used perlin noise and some randomness//////////////////
//to give an organic feeling to the stroke. It´s intended to be used on tablets////////////////////////////
//Other interaction:                                                                                     //
// · 'e' to clean the screen                                                                             //
// · 'h' to hide the control window                                                                      //
// · 'u' to show the control window                                                                      //
//Parameters:                                                                                            //
// · 'N': number of particles                                                                            //
// · 'D': distribution diameter                                                                          //
// · 'F': influence of noise in movement (a bigger value, a rougher stroke)                              //
// · 'P': to adjust tablet pressure                                                                      //
///////////////////////////////////////////////////////////////////////////////////////////////////////////
  //

boolean
  drawing=false,   //estamos dibujando?//are we drawing?
  first=true;      //necesitamos crear un nuevo enjambre?//do we need to launch a new swarm?
int
  n=150,           //número de partículas inicial//inital number of particles
  kind,            //ver abajo//see below
  bg=1,            //color del fondo//background color
  sh=0;            //tono principal del pincel//stroke main hue
float 
  d=25f,   //máximo diámetro inicial del enjambre//initial value for maximum diameter
  f=.005,  //factor inicial para el Perlin que define el movimiento//initial value for the perlin noise that shifts the movement of the swarm
  p=.3;    //factor para ajustar la presión de la tableta//value to adjust the pressure value coming from the tablet

PencilSwarm swarm;  //nuestro enjambre//this swarm composes our pen

void setup(){
  size(900,450,P2D);
  cursor(CROSS);
  colorMode(RGB,1);
  smooth();
  background(bg);
  noStroke();
  cp5setup();
}

void draw(){
  if(drawing){   
    //este método --getPenKind-- nos devuelve un int con el tipo de herramienta que estamos usando: 1--ratón · 2--lápiz · 3--goma//
    //this method --getPenKind-- returns an int that represents the current drawing tool: 1--mouse · 2--pen · 3--eraser//
    kind=tablet.getPenKind(); 
    //este otro --getPressure-- devuelve el valor de presión en un flotante normalizado (0-1)//
    //and this one --getPressure-- returns the pressure of the pen as a normalized float value (0-1)//
    swarm.allDraw(mouseX,mouseY,tablet.getPressure()); 
  }
}





