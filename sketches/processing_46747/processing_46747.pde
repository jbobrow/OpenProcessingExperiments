
float posicionX=0.0;
float velocidadX=0.1;
float posicionY=500.0;
float velocidadY=-0.1;

float radio=0.0;
float velocidadR=0.1;

float velocidadC=0.15;
float colour=0.0;

void setup (){
  size (500,500);
}
void draw(){
  background (0);
  fill(255);
  //loop ();
  // esta solo existe sin el float de arriba ellipse (millis ()/30,height/2,50,50);

//posicion= posicion + velocidad;
//posicionX+=velocidad;
//jugar con la variable "posicion"

fill (255, 200,colour);
posicionX+=velocidadX;
posicionY+=velocidadY;
radio+=velocidadR;
colour+=velocidadC;

ellipse(posicionX,posicionX,radio,radio);
ellipse(posicionY,posicionY,radio,radio);

}


